with Spark_Unbound.Safe_Alloc;
with AUnit.Assertions; use AUnit.Assertions;
with Ada.Exceptions;

package body SA_Arrays_Tests is

   procedure TestAlloc_WithForcingStorageError_ResultNullReturned(T : in out Test_Fixture)
   is
      type Array_Type is array (Integer range <>) of Integer;
      type Array_Acc is access Array_Type;
      package Int_Arrays is new Spark_Unbound.Safe_Alloc.Arrays(Element_Type => Integer, Index_Type => Integer, Array_Type => Array_Type, Array_Type_Acc => Array_Acc);
      Arr_Acc : Array_Acc;
      Array_Last : Integer := 1_000_000_000;
      Storage_Error_Forced : Boolean := False;
      
      -- table to keep track of allocated arrays to be freed later
      type Acc_Table_Array is array (Integer range <>) of Array_Acc;
      Acc_Table : Acc_Table_Array(0 .. 1_000_000);
      Table_Index : Integer := Acc_Table'First;
   begin
      declare
      begin
         loop
            exit when (Storage_Error_Forced or else Table_Index >= Acc_Table'Last);
            
            begin
               Arr_Acc := Int_Arrays.Alloc(First => Integer'First, Last => Array_Last);
               
               begin
                  Acc_Table(Table_Index) := Arr_Acc;
                  Table_Index := Table_Index + 1;
               exception
                  when others =>
                     Assert(False, "Table append failed");
               end;
                        
               if Arr_Acc = null then
                  Storage_Error_Forced := True;
               elsif Array_Last < Integer'Last - Array_Last then
                  Array_Last := Array_Last + Array_Last;
               else
                  Array_Last := Integer'Last;
               end if;
            exception
               when E : others =>
                  Assert(False, "Alloc failed: " & Ada.Exceptions.Exception_Name(E) & " => " & Ada.Exceptions.Exception_Message(E));
            end;
         end loop;

         -- free allocated
         for I in Acc_Table'First .. Acc_Table'Last loop
            Int_Arrays.Free(Acc_Table(I));
         end loop;
         
         Assert(Storage_Error_Forced, "Storage_Error could not be forced. Last value = " & Array_Last'Image);
      exception
         when E : others =>
            Assert(False, "Exception got raised with Last = " & Array_Last'Image & " Reason: " & Ada.Exceptions.Exception_Name(E) & " => " & Ada.Exceptions.Exception_Message(E));
      end;   
   end TestAlloc_WithForcingStorageError_ResultNullReturned;
   

end SA_Arrays_Tests;
