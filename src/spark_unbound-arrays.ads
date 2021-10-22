with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

--- @summary
--- This package is intended as a safe and proven alternative to `Ada.Containers.Vector`.
---
--- @description
--- This package offers proven functions/procedures for an unbound array that are inspired by the `Ada.Containers.Vector` package.
---
--- Note: The range of `Index_Type` must be smaller than `Natural'Range_Length` since `Capacity' and `Length` return type `Natural`.
--- This is NOT enforced by the compiler!
generic
   type Element_Type is private;
   type Index_Type is range <>; -- range must be smaller than Natural'Range_Length for overflow prevention (Some kind of compiler restriction would be nice)               
   with function "=" (Left, Right : Element_Type) return Boolean is <>;
   --- Function used to compare elements inside `Unbound_Array`s.
   --- @param Left Element that is compared against `Right`.
   --- @param Right Element that is comparef against `Left`.
   --- @return `True` if `Left` and `Right` are equal.

package Spark_Unbound.Arrays with SPARK_Mode is
   
   -- needed to use `Self.Arr.all'Old` to prove some contracts
   pragma Unevaluated_Use_Of_Old (Allow); 
   
   -- Type and variabble definitions ------------------------------------------------------------------------------------
   -- Note: Having Last and Arr of some private type would be better, but then Pre and Post contracts get really messy
   
   --- Type to provide the possibility of one invalid index.
   subtype Extended_Index is
     Index_Type'Base range 
       Index_Type'First-1 .. Index_Type'Min (Index_Type'Base'Last - 1, Index_Type'Last) + 1;
   
   --- Index used to indicate 'out of range`.
   No_Index : constant Extended_Index := Extended_Index'First;
   
   --- Note: Type should be treated as private.
   type Array_Type is array(Index_Type range <>) of Element_Type;
   --- Note: Type should be treated as private.
   type Array_Acc is access Array_Type;
   
   --- Main type for `Unbound_Array` handling.
   ---
   --- Note: `Last` and `Arr` should not be changed manually.
   --- @field Last Index of the last valid entry in Arr.all.
   --- @field Arr Reference to the underlying allocated array.
   type Unbound_Array is record
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
   
   --- Sets up a new `Unbound_Array` with `Initial_Capacity` as capacity.
   ---
   --- Complexity: O(1) => Only allocates the array without setting any value
   --- @param Initial_Capacity Tries to allocate an `Unbound_Array` with `Capacity(To_Unbound_Array'Result) = Initial_Capacity`.
   --- @return `Unbound_Array` with `Capacity(To_Unbound_Array'Result) = Initial_Capacity` if allocation was successful, or `To_Unbound_Array'Result.Arr = null`.
   function To_Unbound_Array (Initial_Capacity : Positive) return Unbound_Array
     with Pre => Ghost_In_Index_Range(Initial_Capacity),
            Post => (if To_Unbound_Array'Result.Arr /= null then Capacity(To_Unbound_Array'Result) = Natural(Initial_Capacity)
                       and then To_Unbound_Array'Result.Arr.all'First = Index_Type'First and then To_Unbound_Array'Result.Arr.all'Last = Get_Capacity_Offset(Initial_Capacity)
                     else Capacity(To_Unbound_Array'Result) = Natural'First);
   
   
   -- Procedures/Functions ----------------------------------------------------------------------------------
   
   --- This function calculates the `Index_Type` for `Offset + Index_Type'Last`.
   --- 
   --- Complexity: O(1) => Integer calculation.
   --- @param Offset The vallue added to `Index_Type'First`.
   --- @return `Offset + Index_Type'First`.
   function Get_Capacity_Offset (Offset : Positive) return Index_Type
     with Pre => Ghost_In_Index_Range(Offset),
     Post => Get_Capacity_Offset'Result = Index_Type(Integer(Index_Type'First) + (Integer(Offset) - Integer(Positive'First)));
   
   --- This function compares two `Unbound_Array`s by comparing each element (using the generic formal equality operator)
   --- if `Left` and `Right` have the same length.
   ---
   --- Note: The capacity can be different and `Left` and `Right` are still considered equal.
   ---
   --- Complexity: O(n) => All elements might be compared.
   --- @param Left `Unbound_Array` compared against `Right`.
   --- @param Right `Unbound_Array` compared against `Left`.
   --- @return `True` if `Left` and `Right` have the same elements in the same sequence. Otherwise, `False` is returned.
   function "=" (Left, Right : Unbound_Array) return Boolean
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
   
   --- This function returns the capacity of `Self`.
   ---
   --- Complexity: O(1) => Size of underlying array is always known.
   --- @param Self Instance of an `Unbound_Array`.
   --- @return The capacity of `Self` (More precise: The length of the underlying allocated array).
   function Capacity (Self : Unbound_Array) return Natural
     with Post => (if Self.Arr /= null then Capacity'Result = Ghost_Acc_Length(Self.Arr) else Capacity'Result = Natural'First);
   
   
   --  procedure Reserve_Capacity (Self : in out Unbound_Array; New_Capacity : in Positive; Default_Item : Element_Type; Success: out Boolean)
   --    with Pre => New_Capacity > Length(Self),
   --      Post => (if Success then Capacity(Self) = New_Capacity else Ghost_Last_Array'Length = Capacity(Self));


   --- This procedure tries to move the content of `Self` to an `Unbound_Array` of a smaller capacity.
   ---
   --- Note: `Self` remains unchanged if `Success = False`.
   ---
   --- Complexity: O(n) => All elements are moved, but allocation might fail before.
   --- @param Self Instance of an `Unbound_Array`.
   --- @param New_Capacity The new capacity `Self` should be shrunken to.
   --- @param Success `True` if `Self` got shrunken or `False` if the content of `Self` could not be moved.
   procedure Shrink (Self : in out Unbound_Array; New_Capacity : Natural; Success : out Boolean)
     with Pre => Self.Arr /= null and then New_Capacity >= Length(Self) and then New_Capacity < Capacity(Self),
     Post => (If New_Capacity = 0 and then Success then Capacity(Self) = Natural'First and then Last_Index(Self) = No_Index
              else Self.Arr /= null and then Self.Last = Self.Last'Old
              and then (if Self.Last'Old > No_Index then Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self)))
              and then (if Success then Capacity(Self) = New_Capacity));
   
   --- This function returns the number of elements inside `Self`.
   ---
   --- Complexity: O(1) => First_Index(Self) and Last_Index(Self) is always known.
   --- @param Self Instance of an `Unbound_Array`.
   --- @return Number of elements inside `Self`.
   function Length (Self : Unbound_Array) return Natural
     with Post => (if Last_Index(Self) = No_Index or else Capacity(Self) = Natural'First then Length'Result = Natural'First
                     else (if First_Index(Self) > Last_Index(Self) then Length'Result = Natural'First
                     else Length'Result = Natural(abs(Integer(Last_Index(Self)) - Integer(First_Index(Self))) + 1)));

   --- This function denotes if `Self` as no elements.
   ---
   --- Complexity: O(1) => Length(Self) is always known.
   --- @param Self Instance of an `Unbound_Array`.
   --- @return `True` if `Self` has no elements, or `False` if `Self` has at least one element.
   function Is_Empty (Self : Unbound_Array) return Boolean
     with Post => (if Last_Index(Self) = No_Index then Is_Empty'Result = True else Is_Empty'Result = False);

   --- This procedure deallocates the underlying array of `Self` and sets `Self.Last = No_Index`.
   ---
   --- Complexity: O(1) => Unchecked_Deallocation of underlying array.
   --- @param Self Instance of an `Unbound_Array`.
   procedure Clear (Self : in out Unbound_Array)
     with Post => Self.Arr = null and then Self.Last = No_Index;

   --- This function returns the element inside `Self` at index `Index`.
   ---
   --- Complexity: O(1) => Index access on array is constant time.
   --- @param Self Instance of an `Unbound_Array`.
   --- @param Index Array index for the element that should be returned.
   --- @return The element inside `Self` at index `Index`.
   function Element (Self : Unbound_Array; Index : Index_Type) return Element_Type
     with Pre => Last_Index(Self) > No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
     Post => Element'Result = Self.Arr.all(Index);
   
   --- This procedure replaces the element inside `Self` at index `Index` with `New_Item`.
   ---
   --- Complexity: O(1) => Index access on array is constant time.
   --- @param Self Instance of an `Unbound_Array`.
   --- @param Index Array index for the element that should be replaced.
   --- @param New_Item Value that is set for the element at index `Index`. 
   procedure Replace_Element (Self : in out Unbound_Array; Index : in Index_Type; New_Item : in Element_Type)
     with Pre => Last_Index(Self) > No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
     Post => Element(Self, Index) = New_Item;

   
   --  procedure Update_Element
   --    (Self : in out Unbound_Array;
   --     Index     : in     Index_Type;
   --     Process   : not null access procedure (Process_Element : in out Element_Type))
   --  with Pre => First_Index <= Index and then Last_Index(Self) >= Index; --,
      -- Post => Element(Self, Index) = Process_Element; -- Not sure how to prove that Process_Element got changed correctly

   --- Procedure that tries to copy elements of `Source` to `Target`.
   ---
   --- Note: `Target` is set to `Target.Arr = null` and `Target.Last = No_Index` if `Success = False`. `Source` remains unchanged.
   ---
   --- Complexity: O(n) => All elements must be copied, but allocation might fail before.
   --- @param Target Instance of an `Unbound_Array` with `Target = Source` and `Capacity(Target) = Capacity(Source)` on `Success = True`.
   --- @param Source Instance of an `Unbound_Array` that is copied to `Target`.
   --- @param Success `True` if all elements of `Source` were copied to `Target`.
   procedure Copy (Target : out Unbound_Array; Source : Unbound_Array; Success: out Boolean)
     with Post => (if Success then Target = Source and then Capacity(Target) = Capacity(Source)
                     else (Target.Last = No_Index and then Target.Arr = null));

   --- Procedure that tries to move elements of `Source` to `Target`.
   ---
   --- Note: `Capacity(Target)` can be different to `Capacity(Source)`, but all elements of `Source` must fit inside `Target`.
   ---
   --- Complexity: Theta(n) => Alle elements of `Source` must be copied.
   --- @param Target Instance of `Unbound_Array` with all elements of `Source` being moved to.
   --- @param Source Instance of `Unbound_Array` that is cleared at the end of `Move`.
   procedure Move (Target : in out Unbound_Array; Source : in out Unbound_Array)
     with Pre => Source.Arr /= null and then Target.Arr /= null and then Last_Index(Source) /= No_Index
     and then Capacity(Target) > Natural'First  and then First_Index(Source) = First_Index(Target)
     and then Ghost_In_Index_Range(Positive(Capacity(Target))) and then Last_Index(Source) <= Get_Capacity_Offset(Positive(Capacity(Target))),
     Post => Capacity(Target) = Ghost_Arr_Length(Target.Arr.all'Old)
     and then Source.Arr = null and then Source.Last = No_Index
     and then Target.Last = Source.Last'Old and then Ghost_Arr_Equals(Left => Target.Arr.all, Right => Source.Arr.all'Old, First => First_Index(Target), Last => Last_Index(Target));
   
   
               --  else (Target.Last = Target.Last'Old and then Ghost_Arr_Equals(Left => Target.Arr.all'Old, Right => Target.Arr.all, First => Target.Arr.all'First, Last => Target.Arr.all'Last)
               --    and then Source.Last = Source.Last'Old and then Ghost_Arr_Equals(Left => Source.Arr.all'Old, Right => Source.Arr.all, First => Source.Arr.all'First, Last => Source.Arr.all'Last)));
   
   
   --  procedure Insert (Self : in out Unbound_Array;
   --                    Before    : in     Extended_Index;
   --                    New_Item  : in     Unbound_Array; Success: out Boolean);
   --  
   --  procedure Insert (Container : in out Unbound_Array;
   --                    Before    : in     Extended_Index;
   --                    New_Item  : in     Element_Type; Success: out Boolean);
   --  
   --  procedure Prepend (Self : in out Unbound_Array;
   --                     New_Item  : in    Unbound_Array; Success: out Boolean);
   --  
   --  procedure Prepend (Self : in out Unbound_Array;
   --                     New_Item  : in     Element_Type; Success: out Boolean);
   --  
   --  procedure Append (Self : in out Unbound_Array;
   --                    New_Item  : in   Unbound_Array; Success: out Boolean);
   
   --- Procedure that tries to append `New_Item` to `Self`.
   ---
   --- Note: The underlying array of `Self` is tried to be increased automatically if `Capacity(Self) = Length(Self)`.
   ---
   --- Complexity: O(n) => `Capacity(Self)` is tried to be doubled if `Capacity(Self) = Length(Self)` is reached.
   --- @param Self Instance of an `Unbound_Array`.
   --- @param New_Item Element that is appended to `Self` if `Success = True`.
   --- @param Success `True` if `New_Item` got appended to `Self`.
   procedure Append (Self : in out Unbound_Array; New_Item : in Element_Type; Success: out Boolean)
     with Pre => Self.Arr /= null and then In_Range(Arg => To_Big_Integer(Capacity(Self)),
                                                    Low => To_Big_Integer(Natural'First), High => abs(To_Big_Integer(Integer(Index_Type'Last)) - To_Big_Integer(Integer(Index_Type'First)))),
     Post => (if Success then
                Self.Arr /= null and then Last_Element(Self) = New_Item and then Self.Last = Self.Last'Old + 1
                and then (if Self.Last'Old /= No_Index then Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Self.Last'Old))
              elsif Self.Arr = null then Self.Last = No_Index 
              else (Self.Last = Self.Last'Old and then Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self))));

   
   --  procedure Delete (Self : in out Unbound_Array;
   --                    Index     : in     Extended_Index;
   --                    Count     : in     Positive := 1)
   --    with Pre => (Extended_Index'Last >= Extended_Index(Count) and then Index <= (Extended_Index'Last - Extended_Index(Count)) and then
   --                   First_Index <= Index and then Last_Index(Self) >= (Index + Extended_Index(Count))),
   --    Post => (Length(Ghost_Last_Array) - Count_Type(Count) = Length(Self) and then
   --               (for all I in First_Index .. Last_Index(Self)
   --               => Element(Self, I) = Element(Ghost_Last_Array,I)));

   -- mhatzl
   --  procedure Delete_First (Self : in out Unbound_Array;
   --                          Count     : in     Positive := 1);
   
   --- This procedure deletes the last `Count` elements inside `Self`.
   ---
   --- Complexity: O(1) => Only `Last_Index(Self)` is reduced.
   --- @param Self Instance of an `Unbound_Array`.
   --- @param Count Number of elements to delete.
   procedure Delete_Last (Self : in out Unbound_Array; Count : in Positive := 1)
     with Pre => Self.Arr /= null and then Length(Self) >= Natural(Count),
     Post => Integer(Self.Last'Old - Self.Last) = Count
     and then (if Last_Index(Self) > No_Index then
                 Ghost_Arr_Equals(Left => Self.Arr.all, Right => Self.Arr.all'Old, First => First_Index(Self), Last => Last_Index(Self))
               else Is_Empty(Self));
   
   
   --  procedure Reverse_Elements (Self : in out Unbound_Array);
   --  
   
   --  procedure Swap (Self : in out Unbound_Array;
   --                  I, J      : in     Index_Type);

   --- This function returns the first index of `Self`.
   ---
   --- Complexity: O(1) => First index is fixed.
   --- @param Self Instance of an `Unbound_Array`.
   --- @return The first index of `Self`.
   function First_Index (Self : Unbound_Array) return Index_Type
     with Inline, Post => (if Self.Arr = null then First_Index'Result = Index_Type'First else First_Index'Result = Self.Arr.all'First);
   
   --- This function returns the element at `First_Index(Self)`.
   ---
   --- Complexity: O(1) => Array access is constant time.
   --- @param Self Instance of an `Unbound_Array`.
   --- @return The first element of `Self`.
   function First_Element (Self : Unbound_Array) return Element_Type
     with Pre => Self.Arr /= null and then Self.Last /= No_Index and then Length(Self) > Natural'First,
     Post => First_Element'Result = Self.Arr.all(First_Index(Self));

   --- This function returns the last index of `Self`.
   ---
   --- Complexity: O(1) => `Last_Index(Self)` is kept with `Self.Last`.
   --- @param Self Instance of an `Unbound_Array`.
   --- @return The last index of `Self`.
   function Last_Index (Self : Unbound_Array) return Extended_Index
     with Post => (Last_Index'Result = Self.Last and then (if Self.Arr = null then Last_Index'Result = No_Index 
                       elsif Self.Arr.all'Length > 0 then Last_Index'Result <= Self.Arr.all'Last else Last_Index'Result = No_Index)), Inline;

   --- This function returns the element at `Last_Index(Self)`.
   ---
   --- Complexity: O(1) => Array access is constant time.
   --- @param Self Instance of an `Unbound_Array`.
   --- @return The last element of `Self`.
   function Last_Element (Self : Unbound_Array) return Element_Type
     with Pre => Self.Arr /= null and then Last_Index(Self) > No_Index and then Length(Self) > Natural'First,
     Post => Last_Element'Result = Self.Arr.all(Last_Index(Self));

   --- This function searches the elements of `Self` for an element equal to `Item` (using the generic formal equality operator). 
   --- The search starts at position `Index` and proceeds towards `Last_Index(Self)`. 
   --- If no equal element is found, then `Find_Index` returns `No_Index`. Otherwise, it returns the index of the first equal element encountered.
   ---
   --- Note: Same behavior as `Find_Index` defined in `Ada.Containers.Vectors` [RM-A-18-2].
   ---
   --- Complexity: O(n) => All elements might get compared against `Item`.
   --- @param Self Instance of an `Unbound_Array`.
   --- @param Item Element that is searched for in `Self`.
   --- @param Index Array index to start searching towards `Last_Index(Self)` for `Item`.
   --- @return `No_Index` if `Item` was not found, or the index `I` where `Element(Self, I) = Item`.
   function Find_Index (Self : Unbound_Array; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
     with Pre => Last_Index(Self) >= Index and then First_Index(Self) <= Index,
     Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
              else (Last_Index(Self) = No_Index or else (for all I in Index .. Last_Index(Self)  => Element(Self, I) /= Item)));

   -- mhatzl
   --  function Reverse_Find_Index (Self : Unbound_Array;
   --                               Item      : Element_Type;
   --                               Index     : Index_Type := Index_Type'Last)
   --                               return Extended_Index;

   --- This function searches the elements of `Self` for an element equal to `Item` (using the generic formal equality operator).
   --- The search starts at position `Index` and proceeds towards `Last_Index(Self)`.
   --- If no equal element is found, then `Contains` returns `False`. Otherwise, `Contains` returns true.
   --- 
   --- Complexity: O(n) => All elements might get compared against `Item`.
   --- @param Self Instance of an `Unbound_Array`.
   --- @param Item Element that is searched for in `Self`.
   --- @param Index Array index to start searching towards `Last_Index(Self)` for `Item`.
   function Contains (Self : Unbound_Array; Item : Element_Type; Index : Index_Type := Index_Type'First) return Boolean
     with Post => (if Contains'Result then Self.Arr /= null and then Self.Last /= No_Index
                     and then (for some I in Index .. Last_Index(Self) => Element(Self, I) = Item));

   
   --  function Reverse_Contains (Self : Unbound_Array;
   --                               Item      : Element_Type;
   --                               Index     : Index_Type := Index_Type'Last)
   --                               return Boolean;

   -- mhatzl
   --  generic
   --     with function "<" (Left, Right : Element_Type) return Boolean is <>;
   --  package Generic_Sorting with SPARK_Mode is
   --  
   --     function Is_Sorted (Self : Unbound_Array) return Boolean;
   --  
   --     procedure Sort (Self : in out Unbound_Array; Success: out Boolean);
   --  
   --     procedure Merge (Target  : in out Unbound_Array;
   --                      Source  : in out Unbound_Array; Success: out Boolean);
   --  
   --     function Sorted_Contains (Self : Unbound_Array;
     --                   Item      : Element_Type) return Boolean
     --  with Post => (if Contains'Result then
     --       (for some I in First_Index(Self) .. Last_Index(Self)
     --        => Element(Self, I) = Item)
     --   else (for all I in First_Index(Self) .. Last_Index(Self)
     --        => Element(Self, I) /= Item));
     --
     -- procedure Sorted_Add (Self : in out Unbound_Array; New_Item : in Element_Type; Success: out Boolean)
   --
   --  function Sorted_Find_Index (Self : Unbound_Array; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
   --    with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
   --    Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
   --               else (for all I in First_Index(Self) .. Index => Element(Self, I) /= Item));
     --  
   --  function Sorted_Reverse_Find_Index (Self : Unbound_Array; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
   --    with Pre => Last_Index(Self) /= No_Index and then Last_Index(Self) >= Index and then First_Index(Self) <= Index,
   --    Post => (if Find_Index'Result /= No_Index then Element(Self,Find_Index'Result) = Item
   --               else (for all I in First_Index(Self) .. Index => Element(Self, I) /= Item));
   --  
   --  end Generic_Sorting;
   
   
-- Ghost --------------------------------------------------------------------------------------------------------------
   
   -- This ghost function checks if `Offset + Index_Type'First` is still in the range of `Index_Type`.
   -- Note: Not to be used for anything but proves
   -- @param Offset The value added to `Index_Type'First`.
   -- @return `True` if `Offset + Index_Type'First` is still inside the range of `Index_Type`, `False` otherwise.
   function Ghost_In_Index_Range (Offset : Positive) return Boolean is
      (In_Range(Arg => (To_Big_Integer(Integer(Index_Type'First)) + To_Big_Integer(Offset) - To_Big_Integer(Positive'First)),
                Low => To_Big_Integer(Integer(Index_Type'First)), High => To_Big_Integer(Integer(Index_Type'Last)))) with Ghost;

   
   -- Ghost function needed for some proves.
   -- Note: Not to be used for anything but proves.
   function Ghost_Acc_Length (Self : Array_Acc) return Natural
     with Ghost,
     Post => ((if Self = null then Ghost_Acc_Length'Result = Natural'First else Ghost_Acc_Length'Result = Self.all'Length));
   
   -- Ghost function needed for some proves.
   -- Note: Not to be used for anything but proves. 
   function Ghost_Arr_Equals (Left, Right : Array_Type; First, Last : Index_Type) return Boolean 
     with Ghost,
     Post => (if Ghost_Arr_Equals'Result then (for all I in First .. Last => Left(I) = Right(I))
                  else (Left'First > First or else Right'First > First or else Left'Last < Last or else Right'Last < Last
                or else (for some I in First .. Last => Left(I) /= Right(I))));
              
   -- Ghost function needed for some proves.
   -- Note: Not to be used for anything but proves.
   function Ghost_Arr_Length (Self : Array_Type) return Natural
     with Ghost,
     Post => Ghost_Arr_Length'Result = Self'Length;

end Spark_Unbound.Arrays;
