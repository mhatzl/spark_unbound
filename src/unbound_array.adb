package body Unbound_Array with SPARK_Mode is
   
   function To_Unbound_Array (Cap : Positive; Default_Item : Element_Type) return Unbound_Array_Record
   is
      Arr_Acc : Array_Acc := Array_Alloc.Alloc(First => Index_Type'First, Last => Index_Type(Cap));
      Unbound_Arr : Unbound_Array_Record := Unbound_Array_Record'(Last => No_Index, Arr => Arr_Acc);
   begin
      if Unbound_Arr.Arr /= null then
         for I in Unbound_Arr.Arr.all'First .. Unbound_Arr.Arr.all'Last loop
            Unbound_Arr.Arr.all(I) := Default_Item;
            pragma Loop_Invariant (for all P in Unbound_Arr.Arr.all'First .. I => Unbound_Arr.Arr.all(P) = Default_Item);
         end loop;
      end if;
            
      return Unbound_Arr;
   end To_Unbound_Array;
    
   
   function "=" (Left, Right : Unbound_Array_Record) return Boolean is
   begin
      if Left.Arr = null and then Right.Arr = null then
         return True;
      end if;
   
      if (Left.Arr /= null or else Right.Arr /= null) then
         return False;
      end if;
   
      if (Last_Index(Left) /= Last_Index(Right)) or else (First_Index(Left) /= First_Index(Right)) then
         return False;
      end if;
   
      for I in Last_Index(Left) .. First_Index(Left) loop
         if Element(Left, I) /= Element(Right, I) then
            return False;
         end if;
         pragma Loop_Invariant (for all P in First_Index(Left) .. I => Left.Arr.all(P) = Right.Arr.all(P));
      end loop;
   
      return True;
   end "=";

   function Capacity (Self : Unbound_Array_Record) return Count_Type is
   begin
      if Self.Arr = null then
         return Count_Type'First;
      end if;
      
      return Self.Arr.all'Length;
   end Capacity;

   --  procedure Reserve_Capacity (Self : in out Unbound_Array_Record; Cap : in Count_Type; Success: out Boolean) is
   --  begin
   --     null;
   --  end Reserve_Capacity;

   function Length (Self : Unbound_Array_Record) return Count_Type is
   begin
      if Last_Index(Self) = No_Index then
         return Count_Type'First;
      end if;
      
      return Count_Type(Last_Index(Self) - First_Index(Self)) + 1; -- Last = First leaves room for 1 element
   end Length;

   function Is_Empty (Self : Unbound_Array_Record) return Boolean is
   begin
      return Last_Index(Self) = No_Index;      
   end Is_Empty;
   
   procedure Clear (Self : in out Unbound_Array_Record) is
   begin
      Self.Last := No_Index;
      Array_Alloc.Free(Self.Arr);
   end Clear;
   
   function Element (Self : Unbound_Array_Record; Index : Index_Type) return Element_Type is
   begin
      return Self.Arr.all(Index);
   end Element;
   
   procedure Replace_Element (Self : in out Unbound_Array_Record; Index : in Index_Type; New_Item : in Element_Type) is
   begin
      Self.Arr.all(Index) := New_Item;
   end Replace_Element;

   --  procedure Update_Element
   --    (Self : in out Unbound_Array_Record;
   --     Index     : in     Index_Type;
   --     Process   : not null access procedure (Process_Element : in out Element_Type)) is
   --  begin
   --     Process.all(Self.Arr.all(Index));
   --  end Update_Element;

   procedure Copy (Target : out Unbound_Array_Record;
                   Source : Unbound_Array_Record; Success: out Boolean)
   is
   begin
      Target.Last := No_Index; 
      Target.Arr := null;
      
      if Source.Arr = null then
         -- pragma Assert (Source = Target); -- somehow fails even if Target.Arr = null and Source.Arr = null would count as equal
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
         --  pragma Assert (Source = Target); -- somehow fails even if "=" Post contract is the same
         
         Success := True;
      end if;
   end Copy;
   
   
   procedure Append (Self : in out Unbound_Array_Record;
                     New_Item  : in     Element_Type; Success: out Boolean)
   is
   begin
      if Last_Index(Self) < Self.Arr.all'Last then
         Self.Last := Self.Last + 1;
         Self.Arr.all(Last_Index(Self)) := New_Item;
         Success := True;
      elsif Capacity(Self) < Index_Type'Range_Length then
         declare
            Added_Capacity : Index_Type := Index_Type(Capacity(Self)); -- Try to double array capacity for O(Log(N))
            Ghost_Added_Capactiy : Index_Type;
         begin
            while ((Index_Type'Last - Added_Capacity) < Index_Type(Capacity(Self) + 1)) and then Added_Capacity > Index_Type'First loop
               Ghost_Added_Capactiy := Added_Capacity;
               Added_Capacity := Added_Capacity - 1;
               
               pragma Loop_Invariant (Added_Capacity = Ghost_Added_Capactiy - 1);
            end loop;
            
            declare
               New_Max_Last : Index_Type := Index_Type(Capacity(Self)) + Added_Capacity;
               Ghost_New_Max_Last : Index_Type;
               Arr_Acc : Array_Acc := Array_Alloc.Alloc(First => Self.Arr.all'First, Last => New_Max_Last);
               Tmp_Last : Extended_Index := Self.Last;
            begin
               while Arr_Acc = null and then New_Max_Last > Index_Type(Capacity(Self)) and then New_Max_Last > (Last_Index(Self) + 1) loop
                  Ghost_New_Max_Last := New_Max_Last;                  
                  New_Max_Last := New_Max_Last - 1;
                  Arr_Acc := Array_Alloc.Alloc(First => Self.Arr.all'First, Last => New_Max_Last);
                  
                  pragma Loop_Invariant (New_Max_Last = Ghost_New_Max_Last - 1);
                  pragma Loop_Invariant (Tmp_Last < New_Max_Last);
                  pragma Loop_Invariant (if Arr_Acc /= null then Arr_Acc.all'Last >= Arr_Acc.all'First);
                  pragma Loop_Invariant (if Arr_Acc /= null then Arr_Acc.all'First = Self.Arr.all'First);
                  pragma Loop_Invariant (if Arr_Acc /= null then Arr_Acc.all'Last = New_Max_Last);
                  pragma Loop_Invariant (if Arr_Acc /= null then Arr_Acc.all'Last >= Last_Index(Self));
               end loop;
               
               if Arr_Acc = null then
                  Success := False;
               else
                  for I in First_Index(Self) .. Last_Index(Self) loop
                     Arr_Acc.all(I) := Self.Arr.all(I);
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
                        raise Program_Error; -- needed so that `Self.Last := No_Index;` is not unused
                     end if;                     
                  else
                     raise Program_Error; -- needed so `Self.Arr` is checked after Free()
                  end if;
               end if;
            end;
         end;
      else
         Success := False;
      end if;
   end Append;
      
   --  procedure Delete (Self : in out Unbound_Array_Record;
   --                    Index     : in     Extended_Index;
   --                    Count     : in     Positive := 1) is
   --  begin
   --     null;
   --  end Delete;
   
   procedure Delete_Last (Self : in out Unbound_Array_Record; Count : in Positive := 1)
   is
   begin
      -- Actually not deleting anything, but moving values out of scope
      Self.Last := Self.Last - Extended_Index(Count);
   end;
      

   function First_Element (Self : Unbound_Array_Record) return Element_Type is
   begin
      return Self.Arr.all(First_Index(Self));
   end First_Element;

   function First_Index (Self : Unbound_Array_Record) return Index_Type is
   begin
      if Self.Arr = null then
         return Index_Type'First;
      end if;
      
      return Self.Arr.all'First;
   end First_Index;
        
   function Last_Index (Self : Unbound_Array_Record) return Extended_Index is
   begin
      return Self.Last;
   end Last_Index;
   
   
   function Last_Element (Self : Unbound_Array_Record) return Element_Type is
   begin
      return Self.Arr.all(Last_Index(Self));
   end Last_Element;

   function Find_Index (Self : Unbound_Array_Record;
                        Item      : Element_Type;
                        Index     : Index_Type := Index_Type'First)
                        return Extended_Index is
   begin
      for I in First_Index(Self) .. Index loop      
         if Element(Self, I) = Item then
            return I;
         end if;
         pragma Loop_Invariant (for all P in First_Index(Self) .. I => Element(Self, P) /= Item);
      end loop;
      
      return No_Index;
   end Find_Index;
     
   function Contains (Self : Unbound_Array_Record; Item : Element_Type) return Boolean is
   begin
      if Self.Arr = null or else Self.Last = No_Index then
         return False;
      end if;
   
      for I in First_Index(Self) .. Last_Index(Self) loop
         if Self.Arr.all(I) = Item then
            return True;
         end if;
      end loop;
      return False;
   end Contains;

   
   -- Private --------------------------------
   
   --  procedure Shrink (Self : Unbound_Array_Record; Cap : Positive) is
   --  begin
   --     null;
   --  end Shrink;
   
   
   -- Ghost --------------------------------
   
   function Ghost_Arr_Length (Self : Array_Acc) return Count_Type is
   begin
      if Self = null then
         return Count_Type'First;
      end if;
      
      return Self.all'Length;
   end Ghost_Arr_Length;
   

   
end Unbound_Array;
