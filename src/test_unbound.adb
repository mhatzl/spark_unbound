with Unbound_Array;

procedure Test_Unbound with SPARK_Mode is
   package unbound_int is new Unbound_Array(Element_Type => Integer, Index_Type => Positive, "=" => "="(Integer, Integer));
   test : unbound_int.Unbound_Array_Acc := unbound_int.To_Unbound_Array(1);
begin
   
   unbound_int.Clear(test);
   
end Test_Unbound;
