with AUnit.Reporter.Text;
with AUnit.Run;
with Unbound_Array_Suite;
with Safe_Alloc_Suite;
with GNAT.OS_Lib;

with Text_IO;
with Spark_Unbound;

procedure Tests is
   use type AUnit.Status;

   Reporter : AUnit.Reporter.Text.Text_Reporter;

   function Unbound_Array_Test_Runner is new AUnit.Run.Test_Runner_With_Status(Unbound_Array_Suite.Suite);
   function Safe_Alloc_Test_Runner is new AUnit.Run.Test_Runner_With_Status(Safe_Alloc_Suite.Suite);

begin
   -- Run Unbound_Array tests
   if Unbound_Array_Test_Runner(Reporter) /= AUnit.Success then
      GNAT.OS_Lib.OS_Exit(1);
   end if;

   -- Run Safe_Alloc tests
   if Safe_Alloc_Test_Runner(Reporter) /= AUnit.Success then
      GNAT.OS_Lib.OS_Exit(1);
   end if;
end Tests;
