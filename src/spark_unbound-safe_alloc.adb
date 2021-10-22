with Ada.Unchecked_Deallocation;

package body Spark_Unbound.Safe_Alloc with SPARK_Mode is

   package body Definite with SPARK_Mode is
      
      function Alloc return T_Acc is
         pragma SPARK_Mode (Off); -- Spark OFF for exception handling
      begin
         return new T;
      exception
         when Storage_Error =>
            return null;
      end Alloc;

      procedure Free (Pointer : in out T_Acc) is
         procedure Dealloc is new Ada.Unchecked_Deallocation (T, T_Acc);
      begin
         Dealloc (Pointer);
      end Free;
   end Definite;
   
   package body Arrays with SPARK_Mode is

      function Alloc (First, Last : Index_Type) return Array_Type_Acc is
         pragma SPARK_Mode (Off); -- Spark OFF for exception handling
      begin
         return new Array_Type(First .. Last);
      exception
         when Storage_Error =>
            return null;
      end Alloc;
      
      procedure Free (Pointer : in out Array_Type_Acc) is
         procedure Dealloc is new Ada.Unchecked_Deallocation (Array_Type, Array_Type_Acc);
      begin
         Dealloc (Pointer);
      end Free;
      
   end Arrays;
   
end Spark_Unbound.Safe_Alloc;
