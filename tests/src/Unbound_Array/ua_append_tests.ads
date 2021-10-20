with AUnit;
with AUnit.Test_Fixtures;

package UA_Append_Tests is

   type Test_Fixture is new AUnit.Test_Fixtures.Test_Fixture with record
      V1 : Integer;
      V2 : Integer;
      V3 : Integer;
      V4 : Integer; 
   end record;
   
   
   procedure Set_Up (T : in out Test_Fixture);
   
   
   procedure TestAppend_WithEnoughCapacity_ResultAppended(T : in out Test_Fixture);
   
   
   procedure TestAppend_WithSmallCapacity_ResultAppended(T : in out Test_Fixture);
   
   
   procedure TestAppend_WithIndexEndReached_ResultNotAppended(T : in out Test_Fixture);

   
end UA_Append_Tests;
