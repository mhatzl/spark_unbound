with Safe_Alloc;

generic
   type Element_Type is private;
   type Index_Type is range <>;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Unbound_Array with SPARK_Mode is
   
   type Count_Type is new Natural;
   
   type Unbound_Array_Type (<>) is private;
   type Unbound_Array_Acc is access Unbound_Array_Type;
   subtype Not_Null_Array_Acc is not null Unbound_Array_Acc;
   type Borrowed_Not_Null_Unbound_Array_Acc is not null access constant Unbound_Array_Type;
   
   subtype Extended_Index is
     Index_Type'Base range 
       Index_Type'First-1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
   
   No_Index : constant Extended_Index := Extended_Index'First;
   
   -- Unbound_Array creations --------------------------------------------
   
   -- Sets up a new unbound array with cap as capacity
   function To_Unbound_Array (Cap : Positive) return Unbound_Array_Acc
     with Post => (if To_Unbound_Array'Result /= null then Capacity(Borrow(To_Unbound_Array'Result)) = Count_Type(Cap));

   function "&" (Left, Right : Borrowed_Not_Null_Unbound_Array_Acc) return Unbound_Array_Acc
     with Post => (if "&"'Result /= null then 
                     (for all I in First_Index(Left) .. Last_Index(Left)
                      => (Contains(Borrow("&"'Result), Element(Left, I))))
                    and then (for all I in First_Index(Right) .. Last_Index(Right)
                      => (Contains(Borrow("&"'Result), Element(Right, I)))));

   function "&" (Left : Borrowed_Not_Null_Unbound_Array_Acc; Right : Element_Type) return Unbound_Array_Acc
     with Post => (if "&"'Result /= null then Contains(Borrow("&"'Result), Right)
                    and then (for all I in First_Index(Left) .. Last_Index(Left)
                      => (Contains(Borrow("&"'Result), Element(Left, I)))));

   function "&" (Left : Element_Type; Right : Not_Null_Unbound_Array_Acc) return Unbound_Array_Acc
      with Post => (if "&"'Result /= null then Contains(Borrow("&"'Result), Left)
                    and then (for all I in First_Index(Borrow(Right)) .. Last_Index(Borrow(Right))
                      => (Contains(Borrow("&"'Result), Element(Borrow(Right), I)))));

   function "&" (Left, Right : Element_Type) return Unbound_Array_Acc
     with Post => (if "&"'Result /= null then Contains(Borrow("&"'Result), Left) and then Contains(Borrow("&"'Result), Right));
   
   -- Ghost ---------------------------------------------
   
   Ghost_Last_Length : Count_Type := Count_Type'First with Ghost;
   Ghost_Last_Array : Not_Null_Unbound_Array_Acc := To_Unbound_Array(1) with Ghost;
   
   function Ghost_Capacity (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Count_Type with Ghost;
   
   function Ghost_Element (Self : Borrowed_Not_Null_Unbound_Array_Acc; Index : Index_Type) return Element_Type with Ghost;
   
   function Ghost_Copy (Source : in out Not_Null_Unbound_Array_Acc) return Not_Null_Unbound_Array_Acc with Ghost;

   -- Procdeures/Functions ------------------------------
   
   function Borrow (Self : Not_Null_Unbound_Array_Acc) return Borrowed_Not_Null_Unbound_Array_Acc;
   
   function "=" (Left, Right : Borrowed_Not_Null_Unbound_Array_Acc) return Boolean
     with Post => (if "="'Result then Length(Left) = Length(Right) and then
                     (for all I in First_Index(Left) .. Last_Index(Left) 
                      => Element(Left,I) = Element(Right,I))
                  else Length(Left) /= Length(Right) or else (for some I in First_Index(Left) .. Last_Index(Left) 
                      => Element(Left,I) /= Element(Right,I)));

   function Capacity (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Count_Type
     with Post => Capacity'Result = Ghost_Capacity(Self);

   procedure Reserve_Capacity (Self : in out Not_Null_Unbound_Array_Acc; Cap : in Count_Type; Success: out Boolean)
     with Pre => Cap > Capacity(Borrow(Self)), 
       Post => (if Success then Capacity(Borrow(Self)) = Cap else Capacity(Borrow(Ghost_Last_Array)) = Capacity(Borrow(Self)));

   function Length (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Count_Type
     with Post => (if Last_Index(Self) = No_Index then Length'Result = 0
                     else (if First_Index(Self) > Last_Index(Self) then Length'Result = 0
                     else Length'Result = Count_Type(Last_Index(Self) - First_Index(Self))));

   function Is_Empty (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Boolean
    with Post => (if Length(Self) = 0 then Is_Empty'Result = True else Is_Empty'Result = False);

   procedure Clear (Self : in out Unbound_Array_Acc)
    with Post => Self = null;

   function Element (Self : Borrowed_Not_Null_Unbound_Array_Acc; Index : Index_Type) return Element_Type
     with Pre => First_Index(Self) <= Index and then Last_Index(Self) >= Index,
     Post => (Ghost_Element(Self, Index) = Element'Result and then
                Find_Index(Self, Element'Result, Index) = Index);

   procedure Replace_Element (Self : in out Not_Null_Unbound_Array_Acc; Index : in Index_Type; New_Item : in Element_Type)
     with Pre => First_Index(Borrow(Self)) <= Index and then Last_Index(Borrow(Self)) >= Index,
   Post => Element(Borrow(Self), Index) = New_Item;

   procedure Query_Element
     (Self : in Borrowed_Not_Null_Unbound_Array_Acc;
      Index     : in Index_Type;
      Process   : not null access procedure (Process_Element : in Element_Type); Success: out Boolean)
       with Pre => First_Index(Self) <= Index and then Last_Index(Self) >= Index;

   procedure Update_Element
     (Self : in out Not_Null_Unbound_Array_Acc;
      Index     : in     Index_Type;
      Process   : not null access procedure (Process_Element : in out Element_Type))
   with Pre => First_Index(Borrow(Self)) <= Index and then Last_Index(Borrow(Self)) >= Index; --,
      -- Post => Element(Borrow(Self), Index) = Process_Element; -- Not sure how to access Process_Element here

   procedure Copy (Target : in out Unbound_Array_Acc;
                   Source : in out Not_Null_Unbound_Array_Acc; Success: out Boolean)
     with Post => (Length(Borrow(Source)) = Length(Borrow(Ghost_Last_Array)) and then
                     "="(Borrow(Source), Borrow(Ghost_Last_Array)) = True and then
                       (if Success then (
                              if Target /= null and then
                       First_Index(Borrow(Target)) = First_Index(Borrow(Source)) and then
                        Last_Index(Borrow(Target)) = Last_Index(Borrow(Source)) then
                     (for all I in First_Index(Borrow(Source)) .. Last_Index(Borrow(Source))
                        => Element(Borrow(Source), I) = Element(Borrow(Target),I)))
                      else Target = null));
   
   -- mhatzl
   --  procedure Move (Target : in out Unbound_Array_Acc;
   --                  Source : in out Not_Null_Unbound_Array_Acc; Success: out Boolean)
   --    with Post => (if Success then Length(Borrow(Source)) = 0
   --                 );
   --  
   --  procedure Insert (Self : in out Not_Null_Unbound_Array_Acc;
   --                    Before    : in     Extended_Index;
   --                    New_Item  : in     Not_Null_Unbound_Array_Acc; Success: out Boolean);
   --  
   --  procedure Insert (Container : in out Not_Null_Unbound_Array_Acc;
   --                    Before    : in     Extended_Index;
   --                    New_Item  : in     Element_Type; Success: out Boolean);
   --  
   --  procedure Prepend (Self : in out Not_Null_Unbound_Array_Acc;
   --                     New_Item  : in    Not_Null_Unbound_Array_Acc; Success: out Boolean);
   --  
   --  procedure Prepend (Self : in out Not_Null_Unbound_Array_Acc;
   --                     New_Item  : in     Element_Type; Success: out Boolean);
   --  
   --  procedure Append (Self : in out Not_Null_Unbound_Array_Acc;
   --                    New_Item  : in   Not_Null_Unbound_Array_Acc; Success: out Boolean);
   --  
   --  procedure Append (Self : in out Not_Null_Unbound_Array_Acc;
   --                    New_Item  : in     Element_Type; Success: out Boolean);

   procedure Delete (Self : in out Not_Null_Unbound_Array_Acc;
                     Index     : in     Extended_Index;
                     Count     : in     Positive := 1)
     with Pre => (Extended_Index'Range_Length >= Extended_Index(Count) and then Index <= (Extended_Index'Last - Extended_Index(Count)) and then
                    First_Index(Borrow(Self)) <= Index and then Last_Index(Borrow(Self)) >= (Index + Extended_Index(Count))),
     Post => (Length(Borrow(Ghost_Last_Array)) - Count_Type(Count) = Length(Borrow(Self)) and then
                (for all I in First_Index(Borrow(Self)) .. Last_Index(Borrow(Self))
                => Element(Borrow(Self), I) = Element(Borrow(Ghost_Last_Array),I)));

   -- mhatzl
   --  procedure Delete_First (Self : in out Not_Null_Unbound_Array_Acc;
   --                          Count     : in     Positive := 1);
   --  
   --  procedure Delete_Last (Self : in out Not_Null_Unbound_Array_Acc;
   --                         Count     : in     Positive := 1);
   --  
   --  procedure Reverse_Elements (Self : in out Not_Null_Unbound_Array_Acc);
   --  
   --  procedure Swap (Self : in out Not_Null_Unbound_Array_Acc;
   --                  I, J      : in     Index_Type);

   function First_Index (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Index_Type;

   --  function First_Element (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Element_Type;

   function Last_Index (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Extended_Index;

   --  function Last_Element (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Element_Type;

   function Find_Index (Self : Borrowed_Not_Null_Unbound_Array_Acc;
                        Item      : Element_Type;
                        Index     : Index_Type := Index_Type'First)
                        return Extended_Index;

   -- mhatzl
   --  function Reverse_Find_Index (Self : Borrowed_Not_Null_Unbound_Array_Acc;
   --                               Item      : Element_Type;
   --                               Index     : Index_Type := Index_Type'Last)
   --                               return Extended_Index;

   function Contains (Self : Borrowed_Not_Null_Unbound_Array_Acc;
                      Item      : Element_Type) return Boolean
     with Post => (if Contains'Result then
          (for some I in First_Index(Self) .. Last_Index(Self)
           => Element(Self, I) = Item)
      else (for all I in First_Index(Self) .. Last_Index(Self)
           => Element(Self, I) /= Item));

   -- mhatzl
   --  generic
   --     with function "<" (Left, Right : Element_Type) return Boolean is <>;
   --  package Generic_Sorting with SPARK_Mode is
   --  
   --     function Is_Sorted (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Boolean;
   --  
   --     procedure Sort (Self : in out Not_Null_Unbound_Array_Acc; Success: out Boolean);
   --  
   --     procedure Merge (Target  : in out Not_Null_Unbound_Array_Acc;
   --                      Source  : in out Not_Null_Unbound_Array_Acc; Success: out Boolean);
   --  
   --     function Sorted_Contains (Self : Borrowed_Not_Null_Unbound_Array_Acc;
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
   
   type Unbound_Array_Type is array(Index_Type range <>) of Element_Type;
   
   package Array_Alloc is new Safe_Alloc.Arrays(Element_Type => Element_Type, Index_Type => Index_Type, Array_Type => Unbound_Array_Type, Array_Type_Acc => Unbound_Array_Acc);
   
end Unbound_Array;
