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

   type Int_Range is range Integer'First + 1 .. Integer'Last; -- +1 needed for No_Index

   package unbound_record is new Spark_Unbound.Arrays(Element_Type => Test_Record, Index_Type => Int_Range);
   test_int : unbound_record.Unbound_Array := unbound_record.To_Unbound_Array(Initial_Capacity => 100);

   type Long_Pos_Range is range 1 .. Integer'Base'Range_Length**2; -- Must start at 1. Otherwise, length might exceed Long_Natural

   package pos_unbound_record is new Spark_Unbound.Arrays(Element_Type => Test_Record, Index_Type => Long_Pos_Range);
   test_pos : pos_unbound_record.Unbound_Array := pos_unbound_record.To_Unbound_Array(Initial_Capacity => 10_000);

   -- Current Problem: "memory accessed through objects of access type" might not be initialized after elaboration of main program
   -- Note: Default_Component_Value is currently only supported for scalar types so no idea how to solve this

   -- Note: Using type Float will fail function `Contains` with default `=` (equality without delta is a bad idea for float types)

begin

   unbound_int.Clear (test);
   unbound_neg_int.Clear (test_neg);
   unbound_record.Clear (test_int);
   pos_unbound_record.Clear (test_pos);

end Prove_Unbound;
