# spark_unbound

![Build and Prove](https://github.com/mhatzl/spark_unbound/actions/workflows/build_prove.yml/badge.svg?branch=main)
![Tests](https://github.com/mhatzl/spark_unbound/actions/workflows/run_tests.yml/badge.svg?branch=main)
![Generate Documentation](https://github.com/mhatzl/spark_unbound/actions/workflows/generate_doc.yml/badge.svg?branch=main)

`Spark_Unbound` offers generic unbound data structures in *Ada-Spark*.
All data structures are proven with *Spark* to achieve platinum level (functional correctness) and the allocation handles `Storage_Error` internally.
So only a **Stack Overflow** might happen.

**Note:** Using tools like *GNATstack* can resolve this last error

## Added Types

`Long_Natural` and `Long_Positive` are defined using `Long_Integer`
in `Spark_Unbound` like `Natural` and `Positive` are defined for `Integer`.

This allows to use `Long_Natural` as return value for the array length.

According to the GNAT reference manual at [implementation defined characteristics](https://docs.adacore.com/gnat_rm-docs/html/gnat_rm/gnat_rm/implementation_defined_characteristics.html), `Integer` should only represent signed 32-bit even for 64-bit targets.
Therefore, I decided to switch to `Long_Integer` as base to support 64-bit signed integers on 64-bit targets.

**Note:** `Long_Integer` might still be signed 32-bit on a 64-bit target, but for most targets it should be signed 64-bit.

## Supported Data Structures
### Unbound_Array

**Note:** Currently, **Unbound_Array** is the only supported unbound data structure.

This data structure is defined in the [`Spark_Unbound.Arrays`](/src/spark_unbound-arrays.ads) package with according functions and procedures and is intended as a safe replacement of `Ada.Containers.Vectors`
with notable restrictions for creating `Unbound_Array`s and removing the `Cursor` type.
All procedures that might fail have a `Success` output that states if the execution was successful.

Internally, `Unbound_Array` uses an array that is dynamically allocated and resized on the heap.

**Note:** The maximum length of an `Unbound_Array` is constrained by `Spark_Unbound.Long_Natural'Range_Length` since `Capacity` and `Length` return `Spark_Unbound.Long_Natural`.
This also means that the biggest possible index_type is `Spark_Unbound.Long_Positive` (Hint: `first = last => 1 element in array`). 

**Current missing functionality:**

- `Insert`, `Prepend`, `Reverse_Elements`, `Swap` and indexed deletion is not yet implemented
- The sub-package `Generic_Sorting` is not yet implemented
- Other functions/procedures available in `Ada.Containers.Vectors` might never be implemented

Below is an example on how to use `Unbound_Array`:

~~~Ada
with Spark_Unbound.Arrays;

procedure Test is
  package UA_Integer is new Spark_Unbound.Arrays(Element_Type => Integer, Index_Type => Positive);
  Test_UA : UA_Integer.Unbound_Array := UA_Integer.To_Unbound_Array(Initial_Capacity => 3);
  Success : Boolean;
begin
  -- Fill Array
  UA_Integer.Append(Test_UA, 1, Success);
  UA_Integer.Append(Test_UA, 2, Success);
  UA_Integer.Append(Test_UA, 3, Success);

  -- Now Append() needs to resize
  UA_Integer.Append(Test_UA, 4, Success);
end Test;
~~~

**Note:** You should check for `Success` after every call to `Append()`.

## Safe Allocation

*Spark* can prove absence of runtime errors except `Storage_Error`, but as discussed in an issue at [AdaCore/ada-spark-rfcs](https://github.com/AdaCore/ada-spark-rfcs/issues/78),
it is possible to catch `Storage_Error` for heap allocations. 
Since handling exceptions is not supported in *Spark*, the generic package `Safe_Alloc` is a wrapper with a small part not in *Spark*
that handles `Storage_Error` and returns `null` in that case.

Below is an example on how to use `Safe_Alloc`:

~~~Ada
with Spark_Unbound.Safe_Alloc;

procedure Test is
  type Alloc_Record is record
    V1 : Integer;
    V2 : Natural;
    V3 : Positive;
  end record;

  type Record_Acc is access Alloc_Record;
          
  package Record_Alloc is new Spark_Unbound.Safe_Alloc.Definite(T => Alloc_Record, T_Acc => Record_Acc);
  Rec_Acc : Record_Acc;
begin
  Rec_Acc := Record_Alloc.Alloc; -- Note: No `new` is set before 

  -- check if Rec_Acc is NOT null and then do something

  Record_Alloc.Free(Rec_Acc);
end Test;
~~~

# Proves

Since *Spark* does not prove generics directly, some instances are used per data structure trying to cover most type ranges.
Those types are located under [tests/src/prove_unbound.adb]().

The following command executes GNATprove to prove all data structures instantiated in `prove_unbound.adb`:

~~~
gnatprove -Ptests.gpr -j0 -u prove_unbound.adb --level=4 --proof-warnings
~~~

**Note:** As the chosen instance dictates the conducted proves, it is best to run *GNATprove* on your own instance.


# Tests

Tests are set up in the `tests` subdirectory using [AUnit](https://github.com/AdaCore/aunit) to verify the `Safe_Alloc` part that is not in *Spark*
and some functionality of every data structure to serve as a kind of usage guide.

To run tests manually, move to the `tests` directory and run 

~~~
alr run
~~~

# Installation

`Spark_Unbound` is available as crate in the Alire package manager.
To use the crate in an Alire project, add it with

~~~
alr with spark_unbound
~~~

**Note:** To use Alire with GNAT studio, I use a small Python [script](https://github.com/mhatzl/gps_alire) as GPS plugin to automatically set needed environment variables. 

# Contribution

Feedback is very much welcomed as I am very new to Ada.

My focus at the moment is to fix the following GitHub issues:

- [ ] https://github.com/mhatzl/spark_unbound/issues/3
- [ ] https://github.com/mhatzl/spark_unbound/issues/2

Any help with them is greatly appreciated.

# License

MIT Licensed

**Note:** The `doc`-branch contains API documentation that was automatically generated by GNATdoc, whose license restrictions for generated files depends on your version of GNATdoc.

**Note:** If you use this library somewhere, sending me a private message or so would be really nice 🙂
