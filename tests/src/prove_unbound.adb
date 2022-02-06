with Spark_Unbound.Arrays;

--- Procedure to instantiate concrete packages of Unbound_Array to be proven by GNATprove.
procedure Prove_Unbound with SPARK_Mode
is

   type MyInt is new Integer with Default_Value => 0;

   package unbound_int is new Spark_Unbound.Arrays(Element_Type => MyInt, Index_Type => Positive);
   test : unbound_int.Unbound_Array := unbound_int.To_Unbound_Array (Initial_Capacity => 2);

   type myRange is range -1_000 .. 1_000;

   package unbound_neg_int is new Spark_Unbound.Arrays(Element_Type => MyInt, Index_Type => myRange);
   test_neg : unbound_neg_int.Unbound_Array := unbound_neg_int.To_Unbound_Array (Initial_Capacity => 1);

   type Test_Record is record
      Val1 : Integer;
      Val2 : Positive;
   end record;

   type Short_Range is range Short_Integer'First + 1 .. Short_Integer'Last; -- +1 needed for No_Index

   package unbound_record is new Spark_Unbound.Arrays(Element_Type => Test_Record, Index_Type => Short_Range);
   test_short : unbound_record.Unbound_Array := unbound_record.To_Unbound_Array(Initial_Capacity => 100);

   package pos_unbound_record is new Spark_Unbound.Arrays(Element_Type => Test_Record, Index_Type => Spark_Unbound.Long_Positive); -- Note: Long_Positive is the longest supported index range
   test_pos : pos_unbound_record.Unbound_Array := pos_unbound_record.To_Unbound_Array(Initial_Capacity => 10_000);

   -- Current Problem: "memory accessed through objects of access type" might not be initialized after elaboration of main program
   -- Note: Default_Component_Value is currently only supported for scalar types so no idea how to solve this

   -- Note: Using type Float will fail function `Contains` with default `=` (equality without delta is a bad idea for float types)

begin

   unbound_int.Clear (test);
   unbound_neg_int.Clear (test_neg);
   unbound_record.Clear (test_short);
   pos_unbound_record.Clear (test_pos);

end Prove_Unbound;
