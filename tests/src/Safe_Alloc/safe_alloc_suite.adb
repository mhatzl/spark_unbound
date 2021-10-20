with AUnit.Test_Caller;
with SA_Arrays_Tests;
with SA_Definite_Tests;

package body Safe_Alloc_Suite is

   package SA_Arrays_Test_Caller is new AUnit.Test_Caller(SA_Arrays_Tests.Test_Fixture);
   package SA_Definite_Test_Caller is new AUnit.Test_Caller(SA_Definite_Tests.Test_Fixture);

   
   function Suite return Access_Test_Suite is
      SA_Suite : constant Access_Test_Suite := new Test_Suite;
   begin
      -- Add Arrays Tests --------------------------------- 
      SA_Suite.Add_Test(SA_Arrays_Test_Caller.Create("Test Arrays Alloc with trying to force Storage_Error => Returns `null`", SA_Arrays_Tests.TestAlloc_WithForcingStorageError_ResultNullReturned'Access));
      
      
      -- Add Definite Tests --------------------------------- 
      SA_Suite.Add_Test(SA_Definite_Test_Caller.Create("Test Definite Alloc with trying to force Storage_Error => Returns `null`", SA_Definite_Tests.TestAlloc_WithForcingStorageError_ResultNullReturned'Access));
      
      return SA_Suite;
   end Suite;

end Safe_Alloc_Suite;
