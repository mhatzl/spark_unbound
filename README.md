# spark_unbound

![Build and Prove](https://github.com/mhatzl/spark_unbound/actions/workflows/build_prove.yml/badge.svg?branch=main)
![Tests](https://github.com/mhatzl/spark_unbound/actions/workflows/run_tests.yml/badge.svg?branch=main)
![Generate Documentation](https://github.com/mhatzl/spark_unbound/actions/workflows/generate_doc.yml/badge.svg?branch=main)

Spark_Unbound offers generic unbound data structures in *Ada-Spark*.
All data structures are proven with *Spark* and the allocation handles `Storage_Error` internally,
so only a **Stack Overflow** might happen (Note: Using tools like *GNATstack* can resolve this last error).  

Since *Spark* does not prove generics directly, some instances are used per data structure trying to cover most type ranges.

**Note:** As the chosen instance dictates the conducted proves, it is best to run *GNATprove* on your own instance.


## Supported Data Structures
### Unbound_Array

**Note:** Currently, **Unbound_Array** is the only supported unbound data structure.

This data structure is defined in the [`Spark_Unbound.Arrays`](/src/spark_unbound-arrays.ads) package with according functions and procedures and is intended as a safe replacement of `Ada.Containers.Vector`
with notable restrictions for creating `Unbound_Array`s and removing the `Cursor` type.
All procedures that might fail have a `Success` output that states if the execution was successful.

Internally, `Unbound_Array` uses an array that is dynamically allocated and resized on the heap.

**Note:** The maximum length of an `Unbound_Array` is constrained by `Natural'Range_Length` since `Capacity` and `Length` return `Natural`.

**Current missing functionality:**

- `Insert`, `Prepend`, `Reverse_Elements`, `Swap` and indexed deletion is not yet implemented
- The sub-package `Generic_Sorting` is not yet implemented
- Other functions/procedures available in `Ada.Containers.Vector` might never be implemented


## Safe Allocation

*Spark* can prove absence of runtime errors except `Storage_Error`, but as discussed in an issue at [AdaCore/ada-spark-rfcs](https://github.com/AdaCore/ada-spark-rfcs/issues/78),
it is possible to catch `Storage_Error` for heap allocations. 
Since handling exceptions is not supported in *Spark*, the generic package `Safe_Alloc` is a wrapper with a small part not in *Spark*
that handles `Storage_Error` and returns `null` in that case.


# Tests

Tests are set up in the `tests` subdirectory using [AUnit](https://github.com/AdaCore/aunit) to verify the `Safe_Alloc` part that is not in *Spark*
and some functionality of every data structure to serve as a kind of usage guide.

To run tests manually, move to the `tests` directory and run `alr run`.

# Contribution

Feedback is very much welcomed as I am very new to Ada.
Since I want to participate in the *Crate of the Year*-Award, I will not accept any pull request before end of this year to avoid any legal issues.


# License


