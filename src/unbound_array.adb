package body Unbound_Array with SPARK_Mode is
   
   procedure Clear (Self : in out Unbound_Array_Acc) is
   begin
      Array_Alloc.Free(Self);
   end Clear;
   
   

end Unbound_Array;
