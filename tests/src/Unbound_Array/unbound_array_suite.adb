with AUnit.Test_Caller;
with UA_Append_Tests;

package body Unbound_Array_Suite is

   
   package Append_Test_Caller is new AUnit.Test_Caller(UA_Append_Tests.Test_Fixture);

   
   function Suite return Access_Test_Suite is
      UA_Suite : constant Access_Test_Suite := new Test_Suite;
   begin
      -- Add Append Tests --------------------------------- 
      UA_Suite.Add_Test(Append_Test_Caller.Create("Test Append with enough Capacity => Everything appended", UA_Append_Tests.TestAppend_WithEnoughCapacity_ResultAppended'Access));
      UA_Suite.Add_Test(Append_Test_Caller.Create("Test Append with too small initial Capacity => Everything appended", UA_Append_Tests.TestAppend_WithSmallCapacity_ResultAppended'Access));
      UA_Suite.Add_Test(Append_Test_Caller.Create("Test Append with Index_Type limit reached => Not appended after limit", UA_Append_Tests.TestAppend_WithIndexEndReached_ResultNotAppended'Access));
      
      
      
      return UA_Suite;
   end Suite;
   

end Unbound_Array_Suite;
