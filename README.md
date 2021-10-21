# spark_unbound ![Main Workflow](https://github.com/mhatzl/spark_unbound/actions/workflows/main_ubuntu.yml/badge.svg?branch=main)

Spark_Unbound offers generic unbound data structures in *Ada-Spark*.
All data structures are proven with *Spark* and the allocation handles `Storage_Error` internally,
so only a **Stack Overflow** might happen (Note: Using tools like *GNATstack* can resolve this last error).  

Since *Spark* does not prove generics directly, some instances are used per data structure trying to cover most type ranges.

**Note:** As the choosen instance dictates the conducted proves, it is best to run *GNATprove* on your own instance.


## Supported Data Structures
### Unbound_Array

**Note:** Currently, **Unbound_Array** is the only supported unbound data structure.

This data structure is intended as a safe replacement of `Ada.Containers.Vector`
with notable restrictions for creating `Unbound_Array`s and removing the `Cursor` type.
All procedures that might fail have a `Success` output that states if the execution was successful.

Internally, `Unbound_Array` uses an array that is dynamically allocated and resized on the heap.

**Status**

- To be able to prove functional correctness, I had to make the underlying types public and therefore open for external modification.  
  I hope to fix this at some point.

- *GNATprove* returns:  
  `"memory accessed through objects of access type" might not be initialized after elaboration of main program`.  
  I do not know how to resolve this for now.
  
- `Insert`, `Prepend`, `Reverse_Elements`, `Swap` and indexed deletion is not yet implemented
- The sub-package `Generic_Sorting` is not yet implemented
- Other functions/procedures available in `Ada.Containers.Vector` might never be implemented


## Safe Allocation

*Spark* can prove absence of runtime errors except `Storage_Error`, but as discused in an issue at [AdaCore/ada-spark-rfcs](https://github.com/AdaCore/ada-spark-rfcs/issues/78),
it is possible to catch `Storage_Error` for heap allocations. 
Since handling exceptions is not supported in *Spark*, the generic package `Safe_Alloc` is a wrapper with a small part not in *Spark*
that handles `Storage_Error` and returns `null` in that case.


# Tests

Tests are setup in the `tests` subdirectory using `AUnit` to verify the `Safe_Alloc` part that is not in *Spark*
and some functionality of every data structure to serve as a kind of usage guide.

**Status:**

- Failed tests do not flag GitHub actions as failed


# Contribution

Feedback is very much welcomed.
Since I want to participate in the *Crate of the Year*-Award, I will not accept any pull request before end of this year to avoid any legal issues.


# License

I am using GPS Community Edition 2021 which mandates GPL as far as I understood.
For a hobbyist/student, GNATpro is too expensive, but if I am able to afford it at some point, changing this project to dual licensing or MIT is planned.
