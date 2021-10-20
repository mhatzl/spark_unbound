with AUnit.Reporter.Text;
with AUnit.Run;
with Unbound_Array_Suite;
with Safe_Alloc_Suite;

procedure Tests is
   Reporter : AUnit.Reporter.Text.Text_Reporter;

   procedure Unbound_Array_Test_Runner is new AUnit.Run.Test_Runner(Unbound_Array_Suite.Suite);
   procedure Safe_Alloc_Test_Runner is new AUnit.Run.Test_Runner(Safe_Alloc_Suite.Suite);
begin
   -- Run Unbound_Array tests
   Unbound_Array_Test_Runner(Reporter);

   -- Run Safe_Alloc tests
   Safe_Alloc_Test_Runner(Reporter);

end Tests;
