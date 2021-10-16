with Unbound_Array;

procedure Test_Unbound with SPARK_Mode is
   
   type MyInt is new Integer with Default_Value => 0;
   
   package unbound_int is new Unbound_Array(Element_Type => MyInt, Index_Type => Positive);
   test : unbound_int.Unbound_Array_Record := unbound_int.To_Unbound_Array(Cap => 1, Default_Item => 0);
   
   
   type Test_Record is record
      Val1 : Integer;
      Val2 : Positive;
   end record;
   
   -- Note: Using type like Float will fail function `Contains`
   
   --  package unbound_record is new Unbound_Array(Element_Type => Test_Record, Index_Type => Positive);
   --  test2 : unbound_record.Unbound_Array_Record := unbound_record.To_Unbound_Array(Cap => 1, Default_Item => Test_Record'(Val1 => -1, Val2 => 1));
   
   -- Current Problem: "memory accessed through objects of access type" might not be initialized after elaboration of main program
   -- Default_Component_Value is currently only supported for scalar types so no idea how to solve this
   
begin
   
   unbound_int.Clear(test);
   
   --  unbound_record.Clear(test2);
   
end Test_Unbound;
