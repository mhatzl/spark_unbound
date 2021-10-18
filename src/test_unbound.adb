--  with Unbound_Array;
with Index_Alignment;

procedure Test_Unbound with SPARK_Mode is
   
   type MyInt is new Integer with Default_Value => 0;
   
   --  package unbound_int is new Unbound_Array(Element_Type => MyInt, Index_Type => Positive);
   --  test : unbound_int.Unbound_Array_Record := unbound_int.To_Unbound_Array(Cap => 1, Default_Item => 0);
   
   type myRange is range -1000 .. 1000;
   
   --  package unbound_neg_int is new Unbound_Array(Element_Type => MyInt, Index_Type => myRange);
   --  test_neg : unbound_neg_int.Unbound_Array_Record := unbound_neg_int.To_Unbound_Array(Cap => 1, Default_Item => 0);
   
   type Test_Record is record
      Val1 : Integer;
      Val2 : Positive;
   end record;
   
   -- Note: Using type like Float will fail function `Contains`
   
   --  package unbound_record is new Unbound_Array(Element_Type => Test_Record, Index_Type => Positive);
   --  test2 : unbound_record.Unbound_Array_Record := unbound_record.To_Unbound_Array(Cap => 1, Default_Item => Test_Record'(Val1 => -1, Val2 => 1));
   
   
   -- Current Problem: "memory accessed through objects of access type" might not be initialized after elaboration of main program
   -- Default_Component_Value is currently only supported for scalar types so no idea how to solve this
   
   
   package Positive_Align is new Index_Alignment(Index_Type => myRange, Original => Positive);
   Neg_Align_Test : myRange;
   
   type Smaller_Int is range Integer'First + 110 .. 100;
   
   package Int_Align is new Index_Alignment(Index_Type => Smaller_Int, Original => Positive);
   Int_Align_Test : Smaller_Int;
   
begin
   
   --  unbound_int.Clear(test);
   --  unbound_neg_int.Clear(test_neg);
   
   --  unbound_record.Clear(test2);
   
   Neg_Align_Test := Positive_Align.Shift_To_Index_First(Source => 20);
   Int_Align_Test := Int_Align.Shift_To_Index_First(Source => Positive'Last-10);
   
end Test_Unbound;
