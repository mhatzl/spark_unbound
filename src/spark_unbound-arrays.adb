with Spark_Unbound.Safe_Alloc;

package body Spark_Unbound.Arrays with SPARK_Mode is
   
   package Array_Alloc is new Spark_Unbound.Safe_Alloc.Arrays(Element_Type => Element_Type, Index_Type => Index_Type, Array_Type => Array_Type, Array_Type_Acc => Array_Acc);
   
   
   function Get_Capacity_Offset (Offset : Positive) return Index_Type
   is
      Arr_Offset : Integer := Integer(Offset) - Integer(Positive'First);
   begin
      return Index_Type(Integer(Index_Type'First) + Arr_Offset);
   end Get_Capacity_Offset;
      
   
   function To_Unbound_Array (Initial_Capacity : Positive) return Unbound_Array
   is
      Arr_Acc : Array_Acc := Array_Alloc.Alloc(First => Index_Type'First, Last => Get_Capacity_Offset(Initial_Capacity));
      Unbound_Arr : Unbound_Array := Unbound_Array'(Last => No_Index, Arr => Arr_Acc);
   begin
      return Unbound_Arr;
   end To_Unbound_Array;
   
   
   function "=" (Left, Right : Unbound_Array) return Boolean
   is
   begin
      if Left.Arr = null and then Right.Arr = null then
         return True;
      end if;
   
      if (Left.Arr = null and then Right.Arr /= null) or else (Left.Arr /= null and then Right.Arr = null) then
         return False;
      end if;
      
      if (Last_Index(Left) /= Last_Index(Right)) or else (First_Index(Left) /= First_Index(Right)) then
         return False;
      end if;
   
      for I in First_Index(Left) .. Last_Index(Left) loop
         if Element(Left, I) /= Element(Right, I) then
            return False;
         end if;
         pragma Loop_Invariant (for all P in First_Index(Left) .. I => Element(Left, P) = Element(Right, P));
      end loop;
      
      return True;
   end "=";

   
   function Capacity (Self : Unbound_Array) return Natural
   is
   begin
      if Self.Arr = null then
         return Natural'First;
      end if;
      
      return Self.Arr.all'Length;
   end Capacity;

   
   --  procedure Reserve_Capacity (Self : in out Unbound_Array; Cap : in Count_Type; Success: out Boolean) is
   --  begin
   --     null;
   --  end Reserve_Capacity;

   
   procedure Shrink (Self : in out Unbound_Array; New_Capacity : Natural; Success : out Boolean)
   is
   begin
      if New_Capacity = Natural'First then
         Clear(Self);
         if Self.Arr = null and then Self.Last = No_Index then
            Success := True;
            return;
         else
            raise Program_Error;
         end if;   
      end if;
      
      declare
         Arr_Acc : Array_Acc := Array_Alloc.Alloc(First => First_Index(Self), Last => Get_Capacity_Offset(Positive(New_Capacity)));
         Tmp : Unbound_Array := Unbound_Array'(Last => No_Index, Arr => Arr_Acc);
      begin   
         if Tmp.Arr = null then
            Success := False;
         else
            if Is_Empty(Self) then
               Clear(Self);
            else
               Move(Tmp, Self);
            end if;
            
            if Self.Arr = null and then Self.Last = No_Index then
               Self.Arr := Tmp.Arr;
               Self.Last := Tmp.Last;
               Success := True;
            else
               Clear(Tmp);
               if Tmp.Arr = null and then Tmp.Last = No_Index then
                  Success := False;
               else
                  raise Program_Error;
               end if;
            end if;
         end if;     
      end;     
   end Shrink;
   
      
   function Length (Self : Unbound_Array) return Natural
   is
   begin
      if Last_Index(Self) = No_Index then
         return Natural'First;
      end if;
      -- abs() needed since indizes might be negative
      return Natural(abs(Integer(Last_Index(Self)) - Integer(First_Index(Self))) + 1); -- Last = First leaves room for 1 element
   end Length;

   
   function Is_Empty (Self : Unbound_Array) return Boolean
   is
   begin
      return Last_Index(Self) = No_Index;      
   end Is_Empty;
   
   
   procedure Clear (Self : in out Unbound_Array) is
   begin
      Self.Last := No_Index;
      Array_Alloc.Free(Self.Arr);
   end Clear;
   
   
   function Element (Self : Unbound_Array; Index : Index_Type) return Element_Type
   is
   begin
      return Self.Arr.all(Index);
   end Element;
   
   
   procedure Replace_Element (Self : in out Unbound_Array; Index : in Index_Type; New_Item : in Element_Type)
   is
   begin
      Self.Arr.all(Index) := New_Item;
   end Replace_Element;

   
   --  procedure Update_Element
   --    (Self : in out Unbound_Array;
   --     Index     : in     Index_Type;
   --     Process   : not null access procedure (Process_Element : in out Element_Type)) is
   --  begin
   --     Process.all(Self.Arr.all(Index));
   --  end Update_Element;

   
   procedure Copy (Target : out Unbound_Array; Source : Unbound_Array; Success: out Boolean)
   is
   begin
      Target.Last := No_Index; 
      Target.Arr := null;
      
      if Source.Arr = null then
         Success := True;
         return;
      end if;
             
      Target.Arr := Array_Alloc.Alloc(First => Source.Arr.all'First, Last => Source.Arr.all'Last);
   
      if Target.Arr = null then
         Success := False;
      else
         Target.Last := Source.Last;
         for I in First_Index(Source) .. Last_Index(Source) loop
            Target.Arr.all(I) := Source.Arr.all(I);
            pragma Loop_Invariant (for all P in First_Index(Source) .. I => Target.Arr.all(P) = Source.Arr.all(P));
         end loop;

         Success := True;
      end if;
   end Copy;
   
   
   procedure Move (Target : in out Unbound_Array; Source : in out Unbound_Array)
   is
   begin
      for I in First_Index(Source) .. Last_Index(Source) loop
         Target.Arr.all(I) := Source.Arr.all(I);
         pragma Loop_Invariant (for all P in First_Index(Source) .. I => Target.Arr.all(P) = Source.Arr.all(P));
      end loop;
      Target.Last := Source.Last;
      
      Source.Last := No_Index;
      Array_Alloc.Free(Source.Arr);
      
      if Source.Arr /= null or else Source.Last /= No_Index then
         raise Program_Error;
      end if;
   end Move;
   
   
   procedure Append (Self : in out Unbound_Array; New_Item : in Element_Type; Success: out Boolean)
   is
   begin
      if Last_Index(Self) < Self.Arr.all'Last then
         Self.Last := Self.Last + 1;
         Self.Arr.all(Last_Index(Self)) := New_Item;
         Success := True;
      else
         declare
            Added_Capacity : Natural := Capacity(Self); -- Try to double array capacity for O(Log(N))
            Ghost_Added_Capactiy : Natural with Ghost;
         begin
            while (Integer(Index_Type'Last) - Added_Capacity) < Integer(Get_Capacity_Offset(Positive(Capacity(Self)))) and then Added_Capacity > Natural'First loop
               Ghost_Added_Capactiy := Added_Capacity;
               Added_Capacity := Added_Capacity - 1;
               
               pragma Loop_Invariant (Added_Capacity = Ghost_Added_Capactiy - 1);
            end loop;
            
            declare
               New_Max_Last : Index_Type := Get_Capacity_Offset(Positive(Capacity(Self) + Added_Capacity));
               Ghost_New_Max_Last : Index_Type with Ghost;
               Arr_Acc : Array_Acc := null;
               Tmp_Last : Extended_Index := Self.Last;
            begin
               while Arr_Acc = null and then New_Max_Last > Get_Capacity_Offset(Positive(Capacity(Self))) loop
                  Arr_Acc := Array_Alloc.Alloc(First => Self.Arr.all'First, Last => New_Max_Last);
                  Ghost_New_Max_Last := New_Max_Last;                  
                  New_Max_Last := New_Max_Last - 1;
                  
                  pragma Loop_Invariant (New_Max_Last = Ghost_New_Max_Last - 1);
                  pragma Loop_Invariant (if Arr_Acc /= null then Arr_Acc.all'Last >= Arr_Acc.all'First);
                  pragma Loop_Invariant (if Arr_Acc /= null then Arr_Acc.all'First = First_Index(Self));
                  pragma Loop_Invariant (if Arr_Acc /= null then Arr_Acc.all'Last > Get_Capacity_Offset(Positive(Capacity(Self))));
               end loop;
               
               if Arr_Acc = null then
                  Success := False;
               else
                  for I in First_Index(Self) .. Last_Index(Self) loop
                     Arr_Acc.all(I) := Self.Arr.all(I);
                     pragma Loop_Invariant (for all P in First_Index(Self) .. I => Arr_Acc.all(P) = Self.Arr.all(P));
                  end loop;
                  Self.Last := No_Index;
                  Array_Alloc.Free(Self.Arr);
                  if Self.Arr = null and then Self.Last = No_Index then
                     Self.Arr := Arr_Acc;
                     if Self.Arr /= null and Tmp_Last < Self.Arr.all'Last then
                        Self.Last := Tmp_Last + 1;
                        Self.Arr.all(Last_Index(Self)) := New_Item;
                        Success := True;
                     else
                        raise Program_Error;
                     end if;                     
                  else
                     raise Program_Error;
                  end if;
               end if;
            end;
         end;
      end if;
   end Append;
      
   
   --  procedure Delete (Self : in out Unbound_Array;
   --                    Index     : in     Extended_Index;
   --                    Count     : in     Positive := 1) is
   --  begin
   --     null;
   --  end Delete;
   
   
   procedure Delete_Last (Self : in out Unbound_Array; Count : in Positive := 1)
   is
   begin
      -- Actually not deleting anything, but moving values out of scope
      Self.Last := Extended_Index(Integer(Self.Last) - Count);
   end;
      
   
   function First_Element (Self : Unbound_Array) return Element_Type
   is
   begin
      return Self.Arr.all(First_Index(Self));
   end First_Element;

   
   function First_Index (Self : Unbound_Array) return Index_Type
   is
   begin
      if Self.Arr = null then
         return Index_Type'First;
      end if;
      
      return Self.Arr.all'First;
   end First_Index;
        
   
   function Last_Index (Self : Unbound_Array) return Extended_Index
   is
   begin
      return Self.Last;
   end Last_Index;
   
   
   function Last_Element (Self : Unbound_Array) return Element_Type
   is
   begin
      return Self.Arr.all(Last_Index(Self));
   end Last_Element;

   
   function Find_Index (Self : Unbound_Array; Item : Element_Type; Index : Index_Type := Index_Type'First) return Extended_Index
   is
   begin
      if Last_Index(Self) = No_Index then
         return No_Index;
      end if;
            
      for I in Index .. Last_Index(Self) loop      
         if Element(Self, I) = Item then
            return I;
         end if;
         pragma Loop_Invariant (for all P in Index .. I => Element(Self, P) /= Item);
      end loop;
      
      return No_Index;
   end Find_Index;
    
   
   function Contains (Self : Unbound_Array; Item : Element_Type; Index : Index_Type := Index_Type'First) return Boolean
   is
   begin
      if Self.Arr = null or else Self.Last = No_Index then
         return False;
      end if;
   
      for I in Index .. Last_Index(Self) loop
         if Self.Arr.all(I) = Item then
            return True;
         end if;
         pragma Loop_Invariant (for all P in Index .. I => Element(Self, P) /= Item);
      end loop;
      return False;
   end Contains;

   
   
   -- Ghost ----------------------------------------------------------------------------------
   
   
   function Ghost_Acc_Length (Self : Array_Acc) return Natural
   is
   begin
      if Self = null then
         return Natural'First;
      end if;
      
      return Self.all'Length;
   end Ghost_Acc_Length;
      
   
   function Ghost_Arr_Equals (Left, Right : Array_Type; First, Last : Index_Type) return Boolean
   is
   begin
      if Left'First > First or else Right'First > First
        or else Left'Last < Last or else Right'Last < Last then
         
         return False;
      end if;
            
      for I in First .. Last loop
         if Left(I) /= Right(I) then
            return False;
         end if;
         pragma Loop_Invariant (for all P in First .. I => Left(P) = Right(P));
      end loop;
      return True;
   end Ghost_Arr_Equals;
      
   
   function Ghost_Arr_Length (Self : Array_Type) return Natural
   is
   begin
      return Self'Length;
   end Ghost_Arr_Length;
   
   
end Spark_Unbound.Arrays;
