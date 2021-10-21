with Ada.Unchecked_Deallocation;

package body Safe_Alloc with SPARK_Mode is

   package body Definite with SPARK_Mode is
      procedure Dealloc is new Ada.Unchecked_Deallocation (T, T_Acc);

      function Alloc return T_Acc is
         pragma SPARK_Mode (Off); -- Spark OFF for exception handling
      begin
         return new T;
      exception
         when Storage_Error =>
            return null;
      end Alloc;

      procedure Free (Pointer : in out T_Acc) is
      begin
         Dealloc (Pointer);
      end Free;
   end Definite;
   
   package body Arrays with SPARK_Mode is
      procedure Dealloc is new Ada.Unchecked_Deallocation (Array_Type, Array_Type_Acc);

      function Alloc (First, Last : Index_Type) return Array_Type_Acc is
         pragma SPARK_Mode (Off); -- Spark OFF for exception handling
      begin
         return new Array_Type(First .. Last);
      exception
         when Storage_Error =>
            return null;
      end Alloc;
      
      procedure Free (Pointer : in out Array_Type_Acc) is
      begin
         Dealloc (Pointer);
      end Free;
      
   end Arrays;
   
end Safe_Alloc;
