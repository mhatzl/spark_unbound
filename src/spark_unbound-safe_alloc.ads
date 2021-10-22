--- @summary
--- Package for save heap allocation.
---
--- @description
--- Package containing two generic packages for safe heap allocation.
--- No `Storage_Error` is propagated if the heap allocation failed.
---
package Spark_Unbound.Safe_Alloc with SPARK_Mode is
   
   --- @summary
   --- Generic package for safe heap allocation of type `T` whose size is known at compile time. 
   ---
   --- @description
   --- Generic package for safe heap allocation of type `T` whose size is known at compile time.
   --- Type `T_Acc` is used to access the allocated instance of type `T`.
   generic
      type T is limited private;
      type T_Acc is access T;
   package Definite with SPARK_Mode is
      
      --- Tries to allocate type `T` on the heap.
      --- @return `null` if `Storage_Error` was raised.
      function Alloc return T_Acc;
   
      --- Deallocates the instance of type `T` from the heap.
      --- @param Pointer The reference to an heap allocated instance of type `T` set to `null` after deallocation.
      procedure Free (Pointer: in out T_Acc)
        with Post => Pointer = null;
      
   end Definite;
   
   --- @summary
   --- Generic package for safe heap allocation of array `Array_Type`. 
   ---
   --- @description
   --- Generic package for safe heap allocation of array `Array_Type`.
   --- Type `Array_Type_Acc` is used to access the allocated instance of array `Array_Type`.
   ---
   --- Note: The allocated array is NOT initialized.
   generic
      type Element_Type is private;
      type Index_Type is range <>;
      type Array_Type is array (Index_Type range <>) of Element_Type;
      type Array_Type_Acc is access Array_Type;
   package Arrays with SPARK_Mode is
      
      --- Tries to allocate an array of `Element_Type` with range from `First` to `Last` on the heap.
      --- @param First Sets the lower bound for the allocated array.
      --- @param Last Sets the upper bound for the allocated array.
      --- @return `null` if `Storage_Error` was raised.
      function Alloc (First, Last : Index_Type) return Array_Type_Acc
        with Pre => Last >= First,
        Post => (if Alloc'Result /= null then (Alloc'Result.all'First = First and then Alloc'Result.all'Last = Last));
   
      --- Deallocates the instance of type `Array_Type` from the heap.
      --- @param Pointer The reference to an heap allocated instance of type `Array_Type` set to `null` after deallocation.
      procedure Free (Pointer: in out Array_Type_Acc)
        with Post => Pointer = null;
      
   end Arrays;
   
end Spark_Unbound.Safe_Alloc;
