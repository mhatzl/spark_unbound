-- Package for save heap allocation
package Safe_Alloc with SPARK_Mode is
   
   -- Package for definite type heap allocation
   generic
      type T is private;
      type T_Acc is access T;
   package Definite with SPARK_Mode is
      
      -- Tries to allocate type `T` on the heap
      -- @Returns `null` if `Storage_Error` was raised
      function Alloc return T_Acc;
   
      -- Frees the allocated type `T` from the heap
      procedure Free (Pointer: in out T_Acc)
        with Post => Pointer = null;
      
   end Definite;
   
   -- Package for array heap allocation
   generic
      type Element_Type is private;
      type Index_Type is range <>;
      type Array_Type is array (Index_Type range <>) of Element_Type;
      type Array_Type_Acc is access Array_Type;
   package Arrays with SPARK_Mode is
      
      -- Tries to allocate array of `Element_Type` with range from `First` to `Last` on the heap
      -- @Returns `null` if `Storage_Error` was raised
      function Alloc (First, Last : Index_Type) return Array_Type_Acc
        with Pre => Last >= First,
        Post => (if Alloc'Result /= null then (Alloc'Result.all'First = First and then Alloc'Result.all'Last = Last));
   
      -- Frees the allocated array from the heap
      procedure Free (Pointer: in out Array_Type_Acc)
        with Post => Pointer = null;
      
   end Arrays;
   
end Safe_Alloc;
