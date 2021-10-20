with AUnit;
with AUnit.Test_Fixtures;

package SA_Arrays_Tests is

   type Test_Fixture is new AUnit.Test_Fixtures.Test_Fixture with null record;
   
   
   procedure TestAlloc_WithForcingStorageError_ResultNullReturned(T : in out Test_Fixture);
   

end SA_Arrays_Tests;
