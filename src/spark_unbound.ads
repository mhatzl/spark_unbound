with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

--- @summary
--- The `Spark_Unbound` package contains various unbound generic data structures.
--- All data structures are formally proven by Spark and `Storage_Error` for heap allocation is handled internally.
---
--- @description
--- The `Spark_Unbound` package contains the following unbound generic data structures:
---
--- - `Unbound_Array`: The package `Spark_Unbound.Arrays` provides the type and functionality for this data structure.
---
--- The functionality for safe heap allocation is provided in the package `Spark_Unbound.Safe_Alloc`.
---
--- The source code is MIT licensed and can be found at: https://github.com/mhatzl/spark_unbound
package Spark_Unbound with SPARK_Mode is

   package Long_Integer_To_Big is new Signed_Conversions(Int => Long_Integer);

   subtype Long_Natural is Long_Integer range 0 .. Long_Integer'Last;
   package Long_Natural_To_Big is new Signed_Conversions(Int => Long_Natural);

   subtype Long_Positive is Long_Integer range 1 .. Long_Integer'Last;
   package Long_Positive_To_Big is new Signed_Conversions(Int => Long_Positive);

end Spark_Unbound;
