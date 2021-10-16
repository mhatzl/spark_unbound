with Safe_Alloc;

generic
   type Element_Type is private;
   type Index_Type is range <>;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Unbound_Array with SPARK_Mode is
   
   type Count_Type is new Natural;
   
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
     with Dynamic_Predicate => (if Arr = null then Last = No_Index else Arr.all'First = Index_Type'First and then Arr.all'First <= Arr.all'Last
                                and then (if Arr.all'Length <= 0 then Last = No_Index else Last <= Arr.all'Last));
   
   
   -- Ghost ---------------------------------------------
   
   function Ghost_Arr_Length (Self : Array_Acc) return Count_Type with Ghost,
     Post => ((if Self = null then Ghost_Arr_Length'Result = Count_Type'First else Ghost_Arr_Length'Result = Self.all'Length));
   
   
   -- Procdeures/Functions ------------------------------
   
   function First_Index (Self : Unbound_Array_Record) return Index_Type
     with Inline, Post => (if Self.Arr = null then First_Index'Result = Index_Type'First else First_Index'Result = Self.Arr.all'First);
   
   
   function Capacity (Self : Unbound_Array_Record) return Count_Type
     with Post => (if Self.Arr /= null then Capacity'Result = Ghost_Arr_Length(Self.Arr) else Capacity'Result = Count_Type'First);
   
   -- Unbound_Array creations --------------------------------------------
   
   -- Sets up a new unbound array with cap as capacity
   function To_Unbound_Array (Cap : Positive) return Unbound_Array_Record
     with Pre => Positive(Index_Type'Last) >= Cap and then Index_Type'First <= Index_Type(Cap),
       Post => (if To_Unbound_Array'Result.Arr /= null then (Capacity(To_Unbound_Array'Result) = Count_Type(Cap)
                     and then To_Unbound_Array'Result.Arr.all'First = Index_Type'First and then To_Unbound_Array'Result.Arr.all'Last = Index_Type(Cap))
                    else Capacity(To_Unbound_Array'Result) = Count_Type'First);
   
   function "=" (Left, Right : Unbound_Array_Record) return Boolean
     with Global => null, Post => (if "="'Result then (Left.Arr = null and then Right.Arr = null)
                                   or else (Last_Index(Left) = Last_Index(Right) and then First_Index(Left) = First_Index(Right)
                                   and then (Left.Arr /= null and then Right.Arr /= null 
                                     and then (for all I in First_Index(Left) .. Last_Index(Left)
                                       => Element(Left,I) = Element(Right,I)))));          
   
   --  procedure Reserve_Capacity (Self : in out Unbound_Array_Record; Cap : in Count_Type; Success: out Boolean)
   --    with Pre => Cap > Capacity(Self),
   --      Post => (if Success then Capacity(Self) = Cap else Count_Type(Ghost_Last_Array'Length) = Capacity(Self));

   function Length (Self : Unbound_Array_Record) return Count_Type
     with Post => (if Last_Index(Self) = No_Index or else Capacity(Self) = Count_Type'First then Length'Result = Count_Type'First
                     else (if First_Index(Self) > Last_Index(Self) then Length'Result = Count_Type'First
                     else Length'Result = Count_Type(Last_Index(Self) - First_Index(Self)) + 1));

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

   --  procedure Query_Element
   --    (Self : in Unbound_Array_Record;
   --     Index     : in Index_Type;
   --     Process   : not null access procedure (Process_Element : in Element_Type))
   --      with Pre => First_Index(Self) <= Index and then Last_Index(Self) >= Index;

   --  procedure Update_Element
   --    (Self : in out Unbound_Array_Record;
   --     Index     : in     Index_Type;
   --     Process   : not null access procedure (Process_Element : in out Element_Type))
   --  with Pre => First_Index <= Index and then Last_Index(Self) >= Index; --,
      -- Post => Element(Self, Index) = Process_Element; -- Not sure how to access Process_Element here

   procedure Copy (Target : out Unbound_Array_Record;
                   Source : Unbound_Array_Record; Success: out Boolean)
     with Post => (if Success then (Target.Arr = null and then Source.Arr = null)
                                   or else (Capacity(Target) = Capacity(Source)
                                   and then Last_Index(Target) = Last_Index(Source) and then First_Index(Target) = First_Index(Source)
                                   and then (Target.Arr /= null and then Source.Arr /= null 
                                     and then (for all I in First_Index(Target) .. Last_Index(Target)
                                       => Element(Target,I) = Element(Source,I)))) else (Target.Last = No_Index and then Target.Arr = null));
   
   -- mhatzl
   --  procedure Move (Target : in out Unbound_Array_Record;
   --                  Source : in out Unbound_Array_Record; Success: out Boolean)
   --    with Post => (if Success then Length(Source) = 0
   --                 );
   --  
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
   
   procedure Append (Self : in out Unbound_Array_Record;
                     New_Item  : in     Element_Type; Success: out Boolean)
     with Pre => Self.Arr /= null,
     Post => (if Success then Last_Element(Self) = New_Item and then Self.Last = Self.Last'Old + 1
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
   --  
   --  procedure Delete_Last (Self : in out Unbound_Array_Record;
   --                         Count     : in     Positive := 1);
   --  
   --  procedure Reverse_Elements (Self : in out Unbound_Array_Record);
   --  
   --  procedure Swap (Self : in out Unbound_Array_Record;
   --                  I, J      : in     Index_Type);

 
   function First_Element (Self : Unbound_Array_Record) return Element_Type
     with Pre => Self.Arr /= null and then Self.Last /= No_Index and then Length(Self) > Count_Type'First,
   Post => First_Element'Result = Self.Arr.all(First_Index(Self));

   function Last_Index (Self : Unbound_Array_Record) return Extended_Index
     with Post => (Last_Index'Result = Self.Last and then (if Self.Arr = null then Last_Index'Result = No_Index elsif Self.Arr.all'Length > 0 then Last_Index'Result <= Self.Arr.all'Last else Last_Index'Result = No_Index)), Inline;

   function Last_Element (Self : Unbound_Array_Record) return Element_Type
     with Pre => Self.Arr /= null and then Self.Last /= No_Index and then Length(Self) > Count_Type'First,
   Post => Last_Element'Result = Self.Arr.all(Last_Index(Self));

   function Find_Index (Self : Unbound_Array_Record;
                        Item      : Element_Type;
                        Index     : Index_Type := Index_Type'First)
                        return Extended_Index
     with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
     Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
                else (for all I in First_Index(Self) .. Index => Element(Self, I) /= Item));

   -- mhatzl
   --  function Reverse_Find_Index (Self : Unbound_Array_Record;
   --                               Item      : Element_Type;
   --                               Index     : Index_Type := Index_Type'Last)
   --                               return Extended_Index;

   function Contains (Self : Unbound_Array_Record;
                      Item      : Element_Type) return Boolean
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
   
-- Private ------------------------------------------------
private
   
   package Array_Alloc is new Safe_Alloc.Arrays(Element_Type => Element_Type, Index_Type => Index_Type, Array_Type => Array_Type, Array_Type_Acc => Array_Acc);
   
end Unbound_Array;
