with Unbound_Array;

procedure Test_Unbound with SPARK_Mode is
   
   type MyInt is new Integer with Default_Value => 0;
   
   package unbound_int is new Unbound_Array(Element_Type => MyInt, Index_Type => Positive);
   test : unbound_int.Unbound_Array_Record := unbound_int.To_Unbound_Array(1);
begin
   
   unbound_int.Clear(test);
   
end Test_Unbound;
