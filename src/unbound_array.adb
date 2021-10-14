package body Unbound_Array with SPARK_Mode is
   
   Test : Element_Type;
   
   function Borrow (Self : Not_Null_Unbound_Array_Acc) return Borrowed_Not_Null_Unbound_Array_Acc
   is
      Borrower : Borrowed_Not_Null_Unbound_Array_Acc := Self.all'Access;
   begin
      return Borrower;
   end Borrow;
   
   
   function To_Unbound_Array (Cap : Positive) return Unbound_Array_Acc is
   begin
      return Array_Alloc.Alloc(First => Index_Type'First, Last => Index_Type(Cap));
   end To_Unbound_Array;
   

   function "&" (Left, Right : Borrowed_Not_Null_Unbound_Array_Acc) return Unbound_Array_Acc is
   begin
      return To_Unbound_Array(1);      
   end "&";
   
   function "&" (Left : Borrowed_Not_Null_Unbound_Array_Acc; Right : Element_Type) return Unbound_Array_Acc is
   begin
      return To_Unbound_Array(1);       
   end "&";

   function "&" (Left : Element_Type; Right : Not_Null_Unbound_Array_Acc) return Unbound_Array_Acc is
   begin
      return To_Unbound_Array(1);       
   end "&";

   function "&" (Left, Right : Element_Type) return Unbound_Array_Acc is
   begin
      return To_Unbound_Array(1);      
   end "&";
    
   function "=" (Left, Right : Borrowed_Not_Null_Unbound_Array_Acc) return Boolean is
   begin
      return False;      
   end "=";

   function Capacity (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Count_Type is
   begin
      return Count_Type'First;      
   end Capacity;

   procedure Reserve_Capacity (Self : in out Not_Null_Unbound_Array_Acc; Cap : in Count_Type; Success: out Boolean) is
   begin
      null;       
   end Reserve_Capacity;

   function Length (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Count_Type is
   begin
      return Count_Type'First;      
   end Length;

   function Is_Empty (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Boolean is
   begin
      return False;      
   end Is_Empty;
   
   procedure Clear (Self : in out Unbound_Array_Acc) is
   begin
      Array_Alloc.Free(Self);
   end Clear;
   
   function Element (Self : Borrowed_Not_Null_Unbound_Array_Acc; Index : Index_Type) return Element_Type is
   begin
      return Test;
   end Element;

   procedure Replace_Element (Self : in out Not_Null_Unbound_Array_Acc; Index : in Index_Type; New_Item : in Element_Type) is
   begin
      null;      
   end Replace_Element;

   procedure Query_Element
     (Self : in Borrowed_Not_Null_Unbound_Array_Acc;
      Index     : in Index_Type;
      Process   : not null access procedure (Process_Element : in Element_Type); Success: out Boolean) is
   begin
      null;      
   end Query_Element;

   procedure Update_Element
     (Self : in out Not_Null_Unbound_Array_Acc;
      Index     : in     Index_Type;
      Process   : not null access procedure (Process_Element : in out Element_Type)) is
   begin
      null;      
   end Update_Element;

   procedure Copy (Target : in out Unbound_Array_Acc;
                   Source : in out Not_Null_Unbound_Array_Acc; Success: out Boolean) is
   begin
      null;      
   end Copy;
   
   
   procedure Delete (Self : in out Not_Null_Unbound_Array_Acc;
                     Index     : in     Extended_Index;
                     Count     : in     Positive := 1) is
   begin
      null;      
   end Delete;   
   
   function First_Index (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Index_Type is
   begin
      return Index_Type'First;      
   end First_Index;

   --  function First_Element (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Element_Type is
   --  begin
   --     return Element_Type'Last;
   --  end First_Element;

   function Last_Index (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Extended_Index is
   begin
      return Extended_Index'Last;      
   end Last_Index;

   --  function Last_Element (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Element_Type is
   --  begin
   --     return Element_Type'Last;
   --  end Last_Element;

   function Find_Index (Self : Borrowed_Not_Null_Unbound_Array_Acc;
                        Item      : Element_Type;
                        Index     : Index_Type := Index_Type'First)
                        return Extended_Index is
   begin
      return Extended_Index'First;      
   end Find_Index;  
     
   function Contains (Self : Borrowed_Not_Null_Unbound_Array_Acc; Item : Element_Type) return Boolean is
   begin
      for I in Self.all'Range loop
         if Self.all(I) = Item then
            return True;
         end if;
      end loop;    
      return False;
   end Contains;
   
   
   -- Ghost --------------------------------
   function Ghost_Capacity (Self : Borrowed_Not_Null_Unbound_Array_Acc) return Count_Type is
   begin
      return Self.all'Length;
   end Ghost_Capacity;
   
   function Ghost_Element (Self : Borrowed_Not_Null_Unbound_Array_Acc; Index : Index_Type) return Element_Type is
   begin
      return Self.all(Index);
   end Ghost_Element;
   
   function Ghost_Copy (Source : in out Not_Null_Unbound_Array_Acc) return Not_Null_Unbound_Array_Acc is
      Target : Unbound_Array_Acc;
      Success : Boolean;
   begin
      Copy(Target, Source, Success);
      if Success then
         return Target;
      end if;
      return To_Unbound_Array(1);
   end Ghost_Copy;
   
end Unbound_Array;
