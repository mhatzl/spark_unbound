with Safe_Alloc;

generic
   type Element_Type is private;
   type Index_Type is range <>;
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
package Unbound_Array with SPARK_Mode is
   
   type Unbound_Array_Type (<>) is private;
   type Unbound_Array_Acc is access Unbound_Array_Type;
   subtype Not_Null_Unbound_Array_Acc is not null Unbound_Array_Acc;

   --  type Cursor is private;
   --  pragma Preelaborable_Initialization(Cursor);

   type Count_Type is new Natural;
   subtype Extended_Index is
     Index_Type'Base range 
       Index_Type'First-1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
   
   No_Index : constant Extended_Index := Extended_Index'First;
   --  No_Element : constant Cursor;

   function "=" (Left, Right : Not_Null_Unbound_Array_Acc) return Boolean
     with Post => (if "="'Result then Length(Left) = Length(Right) and then
                     (for all I in First_Index(Left) .. Last_Index(Left) 
                      => Element(Left,I) = Element(Right,I))
                  else Length(Left) /= Length(Right) or else (for some I in First_Index(Left) .. Last_Index(Left) 
                      => Element(Left,I) /= Element(Right,I)));

   --  function To_Unbound_Array (Length : Count_Type) return Unbound_Array_Acc;

   --  function To_Unbound_Array (New_Item : Element_Type; Length : Count_Type) return Unbound_Array_Acc;

   function "&" (Left, Right : Not_Null_Unbound_Array_Acc) return Unbound_Array_Acc
     with Post => (if "&"'Result /= null then 
                     (for all I in First_Index(Left) .. Last_Index(Left)
                      => (Contains("&"'Result, Element(Left, I))))
                    and then (for all I in First_Index(Right) .. Last_Index(Right)
                      => (Contains("&"'Result, Element(Right, I)))));

   function "&" (Left : Not_Null_Unbound_Array_Acc; Right : Element_Type) return Unbound_Array_Acc
     with Post => (if "&"'Result /= null then Contains("&"'Result, Right)
                    and then (for all I in First_Index(Left) .. Last_Index(Left)
                      => (Contains("&"'Result, Element(Left, I)))));

   function "&" (Left : Element_Type; Right : Not_Null_Unbound_Array_Acc) return Unbound_Array_Acc
      with Post => (if "&"'Result /= null then Contains("&"'Result, Left)
                    and then (for all I in First_Index(Right) .. Last_Index(Right)
                      => (Contains("&"'Result, Element(Right, I)))));

   function "&" (Left, Right : Element_Type) return Unbound_Array_Acc
     with Post => (if "&"'Result /= null then Contains("&"'Result, Left) and then Contains("&"'Result, Right));

   function Capacity (Self : Not_Null_Unbound_Array_Acc) return Count_Type;

   procedure Reserve_Capacity (Self : in out Not_Null_Unbound_Array_Acc; Cap : in Count_Type; Success: out Boolean)
     with Pre => Cap > Capacity(Self), 
       Post => (if Success then Capacity(Self) = Cap else Capacity(Self'Old) = Capacity(Self));

   function Length (Self : Not_Null_Unbound_Array_Acc) return Count_Type;

   -- Not supported because filling array with empty elements seems like a bad idea
   --  procedure Set_Length (Self : in out Not_Null_Unbound_Array_Acc; Length : in Count_Type; Success: out Boolean)
   --    with Post => (if Success then Length(Self) = Length else Length(Self'Old) = Length(Self);

   function Is_Empty (Self : Not_Null_Unbound_Array_Acc) return Boolean
    with Post => (if Length(Self) = 0 then Is_Empty'Result = True else Is_Empty'Result = False);

   procedure Clear (Self : in out Unbound_Array_Acc);
    -- with Post => Self = null; -- currenlty leads to `null-excluding formal` compile error

   --  function To_Cursor (Container : Unbound_Array_Acc; Index : Extended_Index) return Cursor;

   --  function To_Index (Position : Cursor) return Extended_Index;

   function Element (Self : Not_Null_Unbound_Array_Acc; Index : Index_Type) return Element_Type
     with Pre => First_Index(Self) <= Index and then Last_Index(Self) >= Index,
          Post => Find_Index(Self, Element'Result, Index) = Index;

   --  function Element (Position : Cursor) return Element_Type;

   procedure Replace_Element (Self : in out Not_Null_Unbound_Array_Acc; Index : in Index_Type; New_Item : in Element_Type; Success: out Boolean);
   
   --  procedure Replace_Element (Container : in out Unbound_Array_Acc; Position : in Cursor; New_item : in Element_Type);

   procedure Query_Element
     (Self : in Not_Null_Unbound_Array_Acc;
      Index     : in Index_Type;
      Process   : not null access procedure (Process_Element : in Element_Type); Success: out Boolean)
       with Pre => First_Index(Self) <= Index and then Last_Index(Self) >= Index,
     Post => (if Success then Element(Self, Index) = Process_Element
             else Element(Self, Index) /= Process_Element);

   --  procedure Query_Element
   --    (Position : in Cursor;
   --     Process  : not null access procedure (Element : in Element_Type));

   procedure Update_Element
     (Self : in out Not_Null_Unbound_Array_Acc;
      Index     : in     Index_Type;
      Process   : not null access procedure
        (Element : in out Element_Type); Success: out Boolean)
   with Pre => First_Index(Self) <= Index and then Last_Index(Self) >= Index,
      Post => (if Success then Element(Self, Index) = Process.all'Result);
   
   --  procedure Update_Element
   --    (Container : in out Unbound_Array_Acc;
   --     Position  : in     Cursor;
   --     Process   : not null access procedure
   --                     (Element : in out Element_Type));

   procedure Move (Target : in out Not_Null_Unbound_Array_Acc;
                   Source : in out Not_Null_Unbound_Array_Acc);

   procedure Insert (Self : in out Not_Null_Unbound_Array_Acc;
                     Before    : in     Extended_Index;
                     New_Item  : in     Not_Null_Unbound_Array_Acc; Success: out Boolean);
   
   procedure Insert (Container : in out Not_Null_Unbound_Array_Acc;
                     Before    : in     Extended_Index;
                     New_Item  : in     Element_Type; Success: out Boolean);

   --  procedure Insert (Container : in out Unbound_Array_Acc;
   --                    Before    : in     Cursor;
   --                    New_Item  : in     Unbound_Array_Acc);
   --  
   --  procedure Insert (Container : in out Unbound_Array_Acc;
   --                    Before    : in     Cursor;
   --                    New_Item  : in     Unbound_Array_Acc;
   --                    Position  :    out Cursor);

   --  procedure Insert (Self : in out Not_Null_Unbound_Array_Acc;
   --                    Before    : in     Extended_Index;
   --                    New_Item  : in     Element_Type;
   --                    Count     : in     Count_Type := 1; Success: out Boolean);

   --  procedure Insert (Container : in out Unbound_Array_Acc;
   --                    Before    : in     Cursor;
   --                    New_Item  : in     Element_Type;
   --                    Count     : in     Count_Type := 1);
   --  
   --  procedure Insert (Container : in out Unbound_Array_Acc;
   --                    Before    : in     Cursor;
   --                    New_Item  : in     Element_Type;
   --                    Position  :    out Cursor;
   --                    Count     : in     Count_Type := 1);

   --  procedure Insert (Self : in out Not_Null_Unbound_Array_Acc;
   --                    Before    : in     Extended_Index;
   --                    Count     : in     Count_Type := 1; Success: out Boolean);

   --  procedure Insert (Container : in out Unbound_Array_Acc;
   --                    Before    : in     Cursor;
   --                    Position  :    out Cursor;
   --                    Count     : in     Count_Type := 1);

   procedure Prepend (Self : in out Not_Null_Unbound_Array_Acc;
                      New_Item  : in    Not_Null_Unbound_Array_Acc; Success: out Boolean);

   procedure Prepend (Self : in out Not_Null_Unbound_Array_Acc;
                      New_Item  : in     Element_Type; Success: out Boolean);
   
   --  procedure Prepend (Self : in out Not_Null_Unbound_Array_Acc;
   --                     New_Item  : in     Element_Type;
   --                     Count     : in     Count_Type := 1; Success: out Boolean);

   procedure Append (Self : in out Not_Null_Unbound_Array_Acc;
                     New_Item  : in   Not_Null_Unbound_Array_Acc; Success: out Boolean);

   procedure Append (Self : in out Not_Null_Unbound_Array_Acc;
                     New_Item  : in     Element_Type; Success: out Boolean);   
   
   --  procedure Append (Self : in out Not_Null_Unbound_Array_Acc;
   --                    New_Item  : in     Element_Type;
   --                    Count     : in     Count_Type := 1; Success: out Boolean);

   --  procedure Insert_Space (Self : in out Not_Null_Unbound_Array_Acc;
   --                          Before    : in     Extended_Index;
   --                          Count     : in     Count_Type := 1; Success: out Boolean);

   --  procedure Insert_Space (Container : in out Unbound_Array_Acc;
   --                          Before    : in     Cursor;
   --                          Position  :    out Cursor;
   --                          Count     : in     Count_Type := 1);

   procedure Delete (Self : in out Not_Null_Unbound_Array_Acc;
                     Index     : in     Extended_Index;
                     Count     : in     Positive := 1; Success: out Boolean);

   --  procedure Delete (Container : in out Unbound_Array_Acc;
   --                    Position  : in out Cursor;
   --                    Count     : in     Count_Type := 1);

   procedure Delete_First (Self : in out Not_Null_Unbound_Array_Acc;
                           Count     : in     Positive := 1; Success: out Boolean);

   procedure Delete_Last (Self : in out Not_Null_Unbound_Array_Acc;
                          Count     : in     Positive := 1; Success: out Boolean);

   procedure Reverse_Elements (Self : in out Not_Null_Unbound_Array_Acc; Success: out Boolean);

   procedure Swap (Self : in out Not_Null_Unbound_Array_Acc;
                   I, J      : in     Index_Type; Success: out Boolean);

   --  procedure Swap (Container : in out Unbound_Array_Acc;
   --                  I, J      : in     Cursor);

   function First_Index (Self : Not_Null_Unbound_Array_Acc) return Index_Type;

   --  function First (Container : Unbound_Array_Acc) return Cursor;

   function First_Element (Self : Not_Null_Unbound_Array_Acc) return Element_Type;

   function Last_Index (Self : Not_Null_Unbound_Array_Acc) return Extended_Index;

   --  function Last (Container : Unbound_Array_Acc) return Cursor;

   function Last_Element (Self : Not_Null_Unbound_Array_Acc) return Element_Type;

   --  function Next (Position : Cursor) return Cursor;
   --  
   --  procedure Next (Position : in out Cursor);
   --  
   --  function Previous (Position : Cursor) return Cursor;
   --  
   --  procedure Previous (Position : in out Cursor);

   function Find_Index (Self : Not_Null_Unbound_Array_Acc;
                        Item      : Element_Type;
                        Index     : Index_Type := Index_Type'First)
                        return Extended_Index;

   --  function Find (Container : Unbound_Array_Acc;
   --                 Item      : Element_Type;
   --                 Position  : Cursor := No_Element)
   --     return Cursor;

   function Reverse_Find_Index (Self : Not_Null_Unbound_Array_Acc;
                                Item      : Element_Type;
                                Index     : Index_Type := Index_Type'Last)
                                return Extended_Index;

   --  function Reverse_Find (Container : Unbound_Array_Acc;
   --                         Item      : Element_Type;
   --                         Position  : Cursor := No_Element)
   --     return Cursor;

   function Contains (Self : Not_Null_Unbound_Array_Acc;
                      Item      : Element_Type) return Boolean;

   --  function Has_Element (Position : Cursor) return Boolean;

   --  procedure  Iterate
   --    (Container : in Unbound_Array_Acc;
   --     Process   : not null access procedure (Position : in Cursor));
   --  
   --  procedure Reverse_Iterate
   --    (Container : in Unbound_Array_Acc;
   --     Process   : not null access procedure (Position : in Cursor));

   generic
      with function "<" (Left, Right : Element_Type) return Boolean is <>;
   package Generic_Sorting with SPARK_Mode is

      function Is_Sorted (Self : Not_Null_Unbound_Array_Acc) return Boolean;

      procedure Sort (Self : in out Not_Null_Unbound_Array_Acc; Success: out Boolean);

      procedure Merge (Target  : in out Not_Null_Unbound_Array_Acc;
                       Source  : in out Not_Null_Unbound_Array_Acc; Success: out Boolean);

   end Generic_Sorting;
   
-- Private ------------------------------------------------
private
   
   type Unbound_Array_Type is array(Index_Type range <>) of Element_Type;
   
   package Array_Alloc is new Safe_Alloc.Arrays(Element_Type => Element_Type, Index_Type => Index_Type, Array_Type => Unbound_Array_Type, Array_Type_Acc => Unbound_Array_Acc);
   
end Unbound_Array;
