package body Unbound_Array with SPARK_Mode is
   
   function To_Unbound_Array (Cap : Positive) return Unbound_Array_Record
   is
      Arr_Acc : Array_Acc := Array_Alloc.Alloc(First => Index_Type'First, Last => Index_Type(Cap));
      Unbound_Arr : Unbound_Array_Record := Unbound_Array_Record'(Last => No_Index, Arr => Arr_Acc);
   begin
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
      
      return Count_Type(Last_Index(Self) - First_Index(Self));
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

   --  procedure Query_Element
   --    (Self : in Unbound_Array_Record;
   --     Index     : in Index_Type;
   --     Process   : not null access procedure (Process_Element : in Element_Type)) is
   --  begin
   --     Process.all(Self.Arr.all(Index));
   --  end Query_Element;

   --  procedure Update_Element
   --    (Self : in out Unbound_Array_Record;
   --     Index     : in     Index_Type;
   --     Process   : not null access procedure (Process_Element : in out Element_Type)) is
   --  begin
   --     Process.all(Self.Arr.all(Index));
   --  end Update_Element;

   --  procedure Copy (Target : out Unbound_Array_Record;
   --                  Source : Unbound_Array_Record; Success: out Boolean)
   --  is
   --     Arr_Acc : Array_Acc := Array_Alloc.Alloc(First_Index, Last_Index(Source));
   --  begin
   --     Target.Last := Source.Last;
   --     Target.Arr := Arr_Acc;
   --  
   --     if Target.Arr = null then
   --        Success := False;
   --     else
   --        for I in First_Index .. Last_Index(Source) loop
   --           Target.Arr.all(I) := Source.Arr.all(I);
   --        end loop;
   --        Success := True;
   --     end if;
   --  end Copy;
   
   
   --  procedure Delete (Self : in out Unbound_Array_Record;
   --                    Index     : in     Extended_Index;
   --                    Count     : in     Positive := 1) is
   --  begin
   --     null;
   --  end Delete;

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

   -- Ghost --------------------------------
   
   --  procedure Ghost_Copy (Self : Unbound_Array_Record; Arr : in out Constr_Array) is
   --  begin
   --     for I in Self.Arr.all'Range loop
   --        Arr(I) := Self.Arr.all(I);
   --     end loop;
   --  end Ghost_Copy;
   
   --  
   --  function Ghost_Array_Equals_Last (Self : Unbound_Array_Record; Arr : Constr_Array) return Boolean is
   --  begin
   --     for I in Self.Arr.all'Range loop
   --        if Self.Arr.all(I) /= Arr(I) then
   --           return False;
   --        end if;
   --     end loop;
   --     return True;
   --  end Ghost_Array_Equals_Last;
   --  
   --  
   --  function Ghost_Equals (Self : Unbound_Array_Record) return Boolean
   --  is
   --  begin
   --     return Ghost_Array_Equals_Last(Self, Ghost_Last_Arr);
   --  end Ghost_Equals;
   --  

   
   function Ghost_Arr_Length (Self : Array_Acc) return Count_Type is
   begin
      if Self = null then
         return Count_Type'First;
      end if;
      
      return Self.all'Length;
   end Ghost_Arr_Length;
   

   
end Unbound_Array;
