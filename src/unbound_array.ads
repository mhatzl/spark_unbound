with Safe_Alloc;
with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

generic
   type Element_Type is private;
   type Index_Type is range <>; -- must be in the range of type Positive for Natural overflow prevention (Some kind of compiler restriction would be nice)
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Unbound_Array with SPARK_Mode is
   
   pragma Unevaluated_Use_Of_Old (Allow); -- needed to use `Self.Arr.all'Old` to prove some contracts
   
   
   -- Needed index type conversions ------------------------------------------------------------------------------------

   function In_Index_Range (Source : Positive) return Boolean is
      (In_Range(Arg => (To_Big_Integer(Integer(Index_Type'First)) + To_Big_Integer(Source) - To_Big_Integer(Positive'First)),
                Low => To_Big_Integer(Integer(Index_Type'First)), High => To_Big_Integer(Integer(Index_Type'Last)))) with Ghost;

   
   function Get_Capacity_Offset (Offset : Positive) return Index_Type
     with Pre => In_Index_Range(Offset),
     Post => Get_Capacity_Offset'Result = Index_Type(Integer(Index_Type'First) + (Integer(Offset) - Integer(Positive'First)));
   
   
   -- Type and variabble definitions ------------------------------------------------------------------------------------
   -- Note: Having Last and Arr of some private type would be better, but then Pre and Post contracts get really messy
   
   subtype Extended_Index is
     Index_Type'Base range 
       Index_Type'First-1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
   
   No_Index : constant Extended_Index := Extended_Index'First;
   
   type Array_Type is array(Index_Type range <>) of Element_Type;
   type Array_Acc is access Array_Type;
   

   type Unbound_Array_Record is record
      Last : Extended_Index := No_Index;
      Arr : Array_Acc := null;
   end record
     with Dynamic_Predicate => (if Arr = null then
                                  Last = No_Index
                                  else 
                                    (Arr.all'First = Index_Type'First 
                                     and then Arr.all'First <= Arr.all'Last
                                     and then (if Arr.all'Length <= 0 then Last = No_Index else Last <= Arr.all'Last)));
   

   -- Unbound_Array creations ------------------------------------------------------------------------------
   
   -- Sets up a new unbound array with Initial_Capacity as capacity
   -- If an array is allocated, Default_Item is set for every entry 
   function To_Unbound_Array (Initial_Capacity : Positive; Default_Item : Element_Type) return Unbound_Array_Record
     with Pre => In_Index_Range(Initial_Capacity),
            Post => (if To_Unbound_Array'Result.Arr /= null then Capacity(To_Unbound_Array'Result) = Natural(Initial_Capacity)
                       and then To_Unbound_Array'Result.Arr.all'First = Index_Type'First and then To_Unbound_Array'Result.Arr.all'Last = Get_Capacity_Offset(Initial_Capacity)
                       and then (for all I in To_Unbound_Array'Result.Arr.all'First .. To_Unbound_Array'Result.Arr.all'Last => To_Unbound_Array'Result.Arr.all(I) = Default_Item)
                     else Capacity(To_Unbound_Array'Result) = Natural'First);
   
   
   -- Procedures/Functions ----------------------------------------------------------------------------------
   
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
   
   
   --  procedure Reserve_Capacity (Self : in out Unbound_Array_Record; New_Capacity : in Positive; Default_Item : Element_Type; Success: out Boolean)
   --    with Pre => New_Capacity > Length(Self),
   --      Post => (if Success then Capacity(Self) = New_Capacity else Ghost_Last_Array'Length = Capacity(Self));

   
   procedure Shrink (Self : in out Unbound_Array_Record; New_Capacity : Natural; Success : out Boolean)
     with Pre => Self.Arr /= null and then New_Capacity >= Length(Self) and then New_Capacity < Capacity(Self),
     Post => (If New_Capacity = 0 and then Success then Capacity(Self) = Natural'First and then Last_Index(Self) = No_Index
              else Self.Arr /= null and then Self.Last = Self.Last'Old
              and then (if Self.Last'Old > No_Index then Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self)))
              and then (if Success then Capacity(Self) = New_Capacity));
   
   
   function Length (Self : Unbound_Array_Record) return Natural
     with Post => (if Last_Index(Self) = No_Index or else Capacity(Self) = Natural'First then Length'Result = Natural'First
                     else (if First_Index(Self) > Last_Index(Self) then Length'Result = Natural'First
                     else Length'Result = Natural(abs(Integer(Last_Index(Self)) - Integer(First_Index(Self))) + 1)));

   
   function Is_Empty (Self : Unbound_Array_Record) return Boolean
     with Post => (if Last_Index(Self) = No_Index then Is_Empty'Result = True else Is_Empty'Result = False);

   
   procedure Clear (Self : in out Unbound_Array_Record)
     with Post => Self.Arr = null and then Self.Last = No_Index;

   
   function Element (Self : Unbound_Array_Record; Index : Index_Type) return Element_Type
     with Pre => Last_Index(Self) > No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
     Post => Element'Result = Self.Arr.all(Index);
   
   
   procedure Replace_Element (Self : in out Unbound_Array_Record; Index : in Index_Type; New_Item : in Element_Type)
     with Pre => Last_Index(Self) > No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
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
     and then Capacity(Target) > Natural'First  and then First_Index(Source) = First_Index(Target)
     and then In_Index_Range(Positive(Capacity(Target))) and then Last_Index(Source) <= Get_Capacity_Offset(Positive(Capacity(Target))),
     Post => Capacity(Target) = Ghost_Arr_Length(Target.Arr.all'Old)
     and then (if Success then Source.Arr = null and then Source.Last = No_Index
                 and then Target.Last = Source.Last'Old and then Ghost_Arr_Equals(Left => Target.Arr.all, Right => Source.Arr.all'Old, First => First_Index(Target), Last => Last_Index(Target))
               else (Target.Last = Target.Last'Old and then Ghost_Arr_Equals(Left => Target.Arr.all'Old, Right => Target.Arr.all, First => Target.Arr.all'First, Last => Target.Arr.all'Last)
                 and then Source.Last = Source.Last'Old and then Ghost_Arr_Equals(Left => Source.Arr.all'Old, Right => Source.Arr.all, First => Source.Arr.all'First, Last => Source.Arr.all'Last)));
   
   
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
     with Pre => Self.Arr /= null and then In_Range(Arg => To_Big_Integer(Capacity(Self)),
                                                    Low => To_Big_Integer(Natural'First), High => abs(To_Big_Integer(Integer(Index_Type'Last)) - To_Big_Integer(Integer(Index_Type'First)))),
     Post => (if Success then
                Self.Arr /= null and then Last_Element(Self) = New_Item and then Self.Last = Self.Last'Old + 1
                and then (if Self.Last'Old /= No_Index then Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Self.Last'Old))
              elsif Self.Arr = null then Self.Last = No_Index 
              else (Self.Last = Self.Last'Old and then Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self))));

   
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
     with Pre => Self.Arr /= null and then Length(Self) >= Natural(Count),
     Post => Integer(Self.Last'Old - Self.Last) = Count
     and then (if Last_Index(Self) > No_Index then
                 Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self))
               else Is_Empty(Self));
   
   
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
     with Pre => Self.Arr /= null and then Last_Index(Self) > No_Index and then Length(Self) > Natural'First,
     Post => Last_Element'Result = Self.Arr.all(Last_Index(Self));

   -- Searches the elements of Self for an element equal to Item (using the generic formal equality operator). 
   -- The search starts at position Index and proceeds towards Last_Index (Self). 
   -- If no equal element is found, then Find_Index returns No_Index. Otherwise, it returns the index of the first equal element encountered
   --
   -- Note: Same behavior as Find_Index defined in Containers.Vectors [RM-A-18-2]
   function Find_Index (Self : Unbound_Array_Record; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
     with Pre => Last_Index(Self) >= Index and then First_Index(Self) <= Index,
     Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
              else (Last_Index(Self) = No_Index or else (for all I in Index .. Last_Index(Self)  => Element(Self, I) /= Item)));

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
   --  function Sorted_Find_Index (Self : Unbound_Array_Record; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
   --    with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
   --    Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
   --               else (for all I in First_Index(Self) .. Index => Element(Self, I) /= Item));
     --  
   --  function Sorted_Reverse_Find_Index (Self : Unbound_Array_Record; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
   --    with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
   --    Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
   --               else (for all I in First_Index(Self) .. Index => Element(Self, I) /= Item));
   --  
   --  end Generic_Sorting;
   
   
-- Ghost --------------------------------------------------------------------------------------------------------------
   

   function Ghost_Acc_Length (Self : Array_Acc) return Natural
     with Ghost,
     Post => ((if Self = null then Ghost_Acc_Length'Result = Natural'First else Ghost_Acc_Length'Result = Self.all'Length));
   
   
   function Ghost_Arr_Equals (Left, Right : Array_Type; First, Last : Index_Type) return Boolean 
     with Ghost,
     Post => (if Ghost_Arr_Equals'Result then (for all I in First .. Last => Left(I) = Right(I))
                  else (Left'First > First or else Right'First > First or else Left'Last < Last or else Right'Last < Last
                or else (for some I in First .. Last => Left(I) /= Right(I))));
              
   
   function Ghost_Arr_Length (Self : Array_Type) return Natural
     with Ghost,
     Post => Ghost_Arr_Length'Result = Self'Length;
   
-- Private -------------------------------------------------------------------------------------------------------------
private
   
   package Array_Alloc is new Safe_Alloc.Arrays(Element_Type => Element_Type, Index_Type => Index_Type, Array_Type => Array_Type, Array_Type_Acc => Array_Acc);
   
end Unbound_Array;
