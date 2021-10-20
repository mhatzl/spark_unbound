with Unbound_Array;

-- Procedure to instantiate concrete packages of Unbound_Array to be proven by GNATprove
procedure Prove_Unbound with SPARK_Mode is
   
   type MyInt is new Integer with Default_Value => 0;
   
   package unbound_int is new Unbound_Array(Element_Type => MyInt, Index_Type => Positive);
   test : unbound_int.Unbound_Array_Record := unbound_int.To_Unbound_Array(Initial_Capacity => 2, Default_Item => 0);
   
   type myRange is range -1000 .. 1000;
   
   package unbound_neg_int is new Unbound_Array(Element_Type => MyInt, Index_Type => myRange);
   test_neg : unbound_neg_int.Unbound_Array_Record := unbound_neg_int.To_Unbound_Array(Initial_Capacity => 1, Default_Item => 0);
   
   type Test_Record is record
      Val1 : Integer;
      Val2 : Positive;
   end record;
   
   -- Note: Using type like Float will fail function `Contains` with default `=`
   
   
   -- This type leads to overflows due to Natural only having half the range => Positive is the largest type not resulting in an overflow
   -- type Smaller_Int is range Integer'First + 1 .. Integer'Last; -- +1 needed for No_Index
   
   package unbound_record is new Unbound_Array(Element_Type => Test_Record, Index_Type => Positive);
   test2 : unbound_record.Unbound_Array_Record := unbound_record.To_Unbound_Array(Initial_Capacity => 100, Default_Item => Test_Record'(Val1 => -1, Val2 => 1));
   
   
   -- Current Problem: "memory accessed through objects of access type" might not be initialized after elaboration of main program
   -- Note: Default_Component_Value is currently only supported for scalar types so no idea how to solve this
   

begin
   
   unbound_int.Clear(test);
   unbound_neg_int.Clear(test_neg);
   
   unbound_record.Clear(test2);

end Prove_Unbound;
