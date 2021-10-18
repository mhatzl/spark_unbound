with Safe_Alloc;
with Ada.Numerics.Big_Numbers;
use Ada.Numerics.Big_Numbers;

generic
   type Element_Type is private;
   type Index_Type is range <>;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Unbound_Array with SPARK_Mode is
   
   pragma Unevaluated_Use_Of_Old (Allow); -- needed to use `Self.Arr.all'Old` to prove some contracts
   
   subtype Extended_Index is
     Index_Type'Base range 
       Index_Type'First-1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
   
   No_Index : constant Extended_Index := Extended_Index'First;
   Shrink_Factor : constant Natural := 10; -- if Capacity / Length <= Shrink_Factor then Array is resized to length on any delete procedure
   
   type Array_Type is array(Index_Type range <>) of Element_Type;
   type Array_Acc is access Array_Type;
   
   
   -- Note: Having Last and Arr of some private type would be better, but then Pre and Post contracts get really messy
   
   type Unbound_Array_Record is record
      Last : Extended_Index := No_Index;
      Arr : Array_Acc := null;
   end record
     with Dynamic_Predicate => (if Arr = null then Last = No_Index else Arr.all'First = Index_Type'First and then Arr.all'First <= Arr.all'Last
                                and then (if Arr.all'Length <= 0 then Last = No_Index else Last <= Arr.all'Last));
   

   -- Unbound_Array creations ------------------------------------------------------------------------------
   
   -- Sets up a new unbound array with cap as capacity
   function To_Unbound_Array (Cap : Positive; Default_Item : Element_Type) return Unbound_Array_Record
     with Pre => Index_Type'Range_Length >= Cap and then Natural'Last >= Cap,
            Post => (if To_Unbound_Array'Result.Arr /= null then (Capacity(To_Unbound_Array'Result) = Natural(Cap)
                     and then To_Unbound_Array'Result.Arr.all'First = Index_Type'First and then To_Unbound_Array'Result.Arr.all'Last = Extended_Index(Cap)
                    and then (for all I in To_Unbound_Array'Result.Arr.all'First .. To_Unbound_Array'Result.Arr.all'Last => To_Unbound_Array'Result.Arr.all(I) = Default_Item))
                    else Capacity(To_Unbound_Array'Result) = Natural'First);
   
   -- Type conversions ------------------------------------------------------------------------------------
   
   Shift_Dist_Natural : constant Natural := abs(Integer(Index_Type'First) - Integer(Natural'First));
   Natural_First_Is_Lower : constant Boolean := (Integer(Index_Type'First) > Integer(Natural'First));
   
   -- Shifts `Val` by aligning Natural'First with Index_Type'First
   function Natural_To_Index (Val : Natural) return Index_Type
     with Pre => Index_Type'Range_Length >= Val,
     Post => (if Natural_First_Is_Lower then Natural_To_Index'Result = Index_Type(Val + Shift_Dist_Natural)
                     else Natural_To_Index'Result = Index_Type(Integer(Val) - Integer(Shift_Dist_Natural)));
   
   -- Procdeures/Functions ----------------------------------------------------------------------------------
   
   function "=" (Left, Right : Unbound_Array_Record) return Boolean
     with Global => null, Post => (if "="'Result then (Left.Arr = null and then Right.Arr = null)
                                   or else (Last_Index(Left) = Last_Index(Right) and then First_Index(Left) = First_Index(Right)
                                   and then (Left.Arr /= null and then Right.Arr /= null 
                                     and then (for all I in First_Index(Left) .. Last_Index(Left)
                                         => Element(Left,I) = Element(Right,I))))
                                     else ((Left.Arr = null and then Right.Arr /= null)
                                   or else (Left.Arr /= null and then Right.Arr = null)
                                   or else Last_Index(Left) /= Last_Index(Right)
                                   or else First_Index(Left) /= First_Index(Right)
                                  or else (for some I in First_Index(Left) .. Last_Index(Left) => Element(Left,I) /= Element(Right,I))));          
   
   
   function Capacity (Self : Unbound_Array_Record) return Natural
     with Post => (if Self.Arr /= null then Capacity'Result = Ghost_Acc_Length(Self.Arr) else Capacity'Result = Natural'First);
   
   
   --  procedure Reserve_Capacity (Self : in out Unbound_Array_Record; Cap : in Count_Type; Success: out Boolean)
   --    with Pre => Cap > Capacity(Self),
   --      Post => (if Success then Capacity(Self) = Cap else Count_Type(Ghost_Last_Array'Length) = Capacity(Self));

   function Length (Self : Unbound_Array_Record) return Natural
     with Post => (if Last_Index(Self) = No_Index or else Capacity(Self) = Natural'First then Length'Result = Natural'First
                     else (if First_Index(Self) > Last_Index(Self) then Length'Result = Natural'First
                     else Length'Result = Natural(abs(Last_Index(Self) - First_Index(Self))) + 1));

   function Is_Empty (Self : Unbound_Array_Record) return Boolean
    with Post => (if Last_Index(Self) = No_Index then Is_Empty'Result = True else Is_Empty'Result = False);

   procedure Clear (Self : in out Unbound_Array_Record)
    with Post => Self.Arr = null and then Self.Last = No_Index;

   function Element (Self : Unbound_Array_Record; Index : Index_Type) return Element_Type
     with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
   Post => Element'Result = Self.Arr.all(Index);
   
   procedure Replace_Element (Self : in out Unbound_Array_Record; Index : in Index_Type; New_Item : in Element_Type)
     with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
   Post => Element(Self, Index) = New_Item;

   --  procedure Update_Element
   --    (Self : in out Unbound_Array_Record;
   --     Index     : in     Index_Type;
   --     Process   : not null access procedure (Process_Element : in out Element_Type))
   --  with Pre => First_Index <= Index and then Last_Index(Self) >= Index; --,
      -- Post => Element(Self, Index) = Process_Element; -- Not sure how to prove that Process_Element got changed correctly

   procedure Copy (Target : out Unbound_Array_Record; Source : Unbound_Array_Record; Success: out Boolean)
     with Post => (if Success then Target = Source and then Capacity(Target) = Capacity(Source)
                     else (Target.Last = No_Index and then Target.Arr = null));

   
   procedure Move (Target : in out Unbound_Array_Record; Source : in out Unbound_Array_Record; Success: out Boolean)
     with Pre => Source.Arr /= null and then Target.Arr /= null and then Last_Index(Source) /= No_Index
     and then Last_Index(Source) <= Extended_Index(Capacity(Target)) and then First_Index(Source) = First_Index(Target),
     Post => (if Success then Source.Arr = null and then Source.Last = No_Index
              and then Ghost_Arr_Equals(Left => Target.Arr.all, Right => Source.Arr.all'Old, First => First_Index(Source), Last => Last_Index(Target))
             else Ghost_Arr_Equals(Left => Target.Arr.all'Old, Right => Target.Arr.all, First => Target.Arr.all'First, Last => Target.Arr.all'Last));
   
   
   --  procedure Insert (Self : in out Unbound_Array_Record;
   --                    Before    : in     Extended_Index;
   --                    New_Item  : in     Unbound_Array_Record; Success: out Boolean);
   --  
   --  procedure Insert (Container : in out Unbound_Array_Record;
   --                    Before    : in     Extended_Index;
   --                    New_Item  : in     Element_Type; Success: out Boolean);
   --  
   --  procedure Prepend (Self : in out Unbound_Array_Record;
   --                     New_Item  : in    Unbound_Array_Record; Success: out Boolean);
   --  
   --  procedure Prepend (Self : in out Unbound_Array_Record;
   --                     New_Item  : in     Element_Type; Success: out Boolean);
   --  
   --  procedure Append (Self : in out Unbound_Array_Record;
   --                    New_Item  : in   Unbound_Array_Record; Success: out Boolean);
   
   procedure Append (Self : in out Unbound_Array_Record; New_Item : in Element_Type; Success: out Boolean)
     with Pre => Self.Arr /= null,
     Post => (if Success then Last_Element(Self) = New_Item and then Self.Last = Self.Last'Old + 1
              and then (if Self.Last'Old /= No_Index then 
                    Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Self.Last'Old))
             elsif Self.Arr = null then Self.Last = No_Index else Self.Last = Self.Last'Old);

   --  procedure Delete (Self : in out Unbound_Array_Record;
   --                    Index     : in     Extended_Index;
   --                    Count     : in     Positive := 1)
   --    with Pre => (Extended_Index'Last >= Extended_Index(Count) and then Index <= (Extended_Index'Last - Extended_Index(Count)) and then
   --                   First_Index <= Index and then Last_Index(Self) >= (Index + Extended_Index(Count))),
   --    Post => (Length(Ghost_Last_Array) - Count_Type(Count) = Length(Self) and then
   --               (for all I in First_Index .. Last_Index(Self)
   --               => Element(Self, I) = Element(Ghost_Last_Array,I)));

   -- mhatzl
   --  procedure Delete_First (Self : in out Unbound_Array_Record;
   --                          Count     : in     Positive := 1);
   
   
   procedure Delete_Last (Self : in out Unbound_Array_Record; Count : in Positive := 1)
     with Pre => Self.Arr /= null and then Last_Index(Self) /= No_Index 
     and then Length(Self) >= Natural(Count) and then Index_Type'Range_Length >= Count
     and then (Extended_Index(Count) - 1) <= (Last_Index(Self) - Extended_Index(First_Index(Self))),
     Post => Self.Last = Self.Last'Old - Extended_Index(Count) 
     and then (if Last_Index(Self) > No_Index then
                 Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self))
               else Self.Last'Old = No_Index + Extended_Index(Count));
      
   
   --  procedure Reverse_Elements (Self : in out Unbound_Array_Record);
   --  
   --  procedure Swap (Self : in out Unbound_Array_Record;
   --                  I, J      : in     Index_Type);

 
   function First_Index (Self : Unbound_Array_Record) return Index_Type
     with Inline, Post => (if Self.Arr = null then First_Index'Result = Index_Type'First else First_Index'Result = Self.Arr.all'First);
   
   function First_Element (Self : Unbound_Array_Record) return Element_Type
     with Pre => Self.Arr /= null and then Self.Last /= No_Index and then Length(Self) > Natural'First,
   Post => First_Element'Result = Self.Arr.all(First_Index(Self));

   function Last_Index (Self : Unbound_Array_Record) return Extended_Index
     with Post => (Last_Index'Result = Self.Last and then (if Self.Arr = null then Last_Index'Result = No_Index 
                       elsif Self.Arr.all'Length > 0 then Last_Index'Result <= Self.Arr.all'Last else Last_Index'Result = No_Index)), Inline;

   function Last_Element (Self : Unbound_Array_Record) return Element_Type
     with Pre => Self.Arr /= null and then Self.Last /= No_Index and then Length(Self) > Natural'First,
   Post => Last_Element'Result = Self.Arr.all(Last_Index(Self));

   function Find_Index (Self : Unbound_Array_Record; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
     with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
     Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
                else (for all I in First_Index(Self) .. Index => Element(Self, I) /= Item));

   -- mhatzl
   --  function Reverse_Find_Index (Self : Unbound_Array_Record;
   --                               Item      : Element_Type;
   --                               Index     : Index_Type := Index_Type'Last)
   --                               return Extended_Index;

   function Contains (Self : Unbound_Array_Record; Item : Element_Type) return Boolean
     with Post => (if Contains'Result then Self.Arr /= null and then Self.Last /= No_Index
                     and then (for some I in First_Index(Self) .. Last_Index(Self) => Element(Self, I) = Item));
                     

   -- mhatzl
   --  generic
   --     with function "<" (Left, Right : Element_Type) return Boolean is <>;
   --  package Generic_Sorting with SPARK_Mode is
   --  
   --     function Is_Sorted (Self : Unbound_Array_Record) return Boolean;
   --  
   --     procedure Sort (Self : in out Unbound_Array_Record; Success: out Boolean);
   --  
   --     procedure Merge (Target  : in out Unbound_Array_Record;
   --                      Source  : in out Unbound_Array_Record; Success: out Boolean);
   --  
   --     function Sorted_Contains (Self : Unbound_Array_Record;
     --                   Item      : Element_Type) return Boolean
     --  with Post => (if Contains'Result then
     --       (for some I in First_Index(Self) .. Last_Index(Self)
     --        => Element(Self, I) = Item)
     --   else (for all I in First_Index(Self) .. Last_Index(Self)
     --        => Element(Self, I) /= Item));
   --
   --
   --  end Generic_Sorting;
   
   
-- Ghost --------------------------------------------------------------------------------------------------------------
   
   function Ghost_Acc_Length (Self : Array_Acc) return Natural
     with Ghost,
     Post => ((if Self = null then Ghost_Acc_Length'Result = Natural'First else Ghost_Acc_Length'Result = Self.all'Length));
   
   
   function Ghost_Arr_Equals (Left, Right : Array_Type; First, Last : Index_Type) return Boolean 
     with Ghost,
     Pre => Left'First <= First and then Last <= Left'Last
     and then Right'First <= First and then Last <= Right'Last,
     Post => (if Ghost_Arr_Equals'Result then (for all I in First .. Last => Left(I) = Right(I))
                else (for some I in First .. Last => Left(I) /= Right(I)));
   
   
   function Ghost_Arr_Length (Self : Array_Type) return Natural
     with Ghost,
     Post => Ghost_Arr_Length'Result = Self'Length;
   
-- Private -------------------------------------------------------------------------------------------------------------
private
   
   package Array_Alloc is new Safe_Alloc.Arrays(Element_Type => Element_Type, Index_Type => Index_Type, Array_Type => Array_Type, Array_Type_Acc => Array_Acc);
   
   --  procedure Shrink (Self : in out Unbound_Array_Record; Cap : Positive; Success : Boolean)
   --    with Pre => Self.Arr /= null and then Count_Type(Cap) >= Length(Self)
   --    and then Index_Type'Range_Length >= Cap,
   --    Post => Self.Arr /= null and then Self.Last = Self.Last'Old
   --    and then Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self))
   --  and then (if Success then Capacity(Self) = Count_Type(Cap) else Capacity(Self) = Ghost_Arr_Length(Self => Self.Arr.all'Old));
   --  
end Unbound_Array;
