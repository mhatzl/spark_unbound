with Spark_Unbound.Safe_Alloc;
with AUnit.Assertions; use AUnit.Assertions;
with Ada.Exceptions;

package body SA_Definite_Tests is

   procedure TestAlloc_WithForcingStorageError_ResultNullReturned(T : in out Test_Fixture)
   is
      -- type Inner_Array is array(-90 .. 90) of Integer; -- forced test fail
      type Inner_Array is array(-9_00_000_000 .. 9_00_000_000) of Integer;      
      type Alloc_Record is record
         Arr1 : Inner_Array;
         Arr2 : Inner_Array;
         Arr3 : Inner_Array;
         Arr4 : Inner_Array;
         Arr5 : Inner_Array;
         Arr6 : Inner_Array;
         Arr7 : Inner_Array;
         Arr8 : Inner_Array;
         Arr9 : Inner_Array;
         Arr10 : Inner_Array;
         Arr11 : Inner_Array;
         Arr12 : Inner_Array;
         Arr13 : Inner_Array;
         Arr14 : Inner_Array;
         Arr15 : Inner_Array;
         Arr16 : Inner_Array;
         Arr17 : Inner_Array;
         Arr18 : Inner_Array;
         Arr19 : Inner_Array;
         Arr20 : Inner_Array;
         V1 : Integer;
         V2 : Natural;
         V3 : Positive;
      end record;
      
      type Record_Acc is access Alloc_Record;
        
      package Record_Alloc is new Spark_Unbound.Safe_Alloc.Definite(T => Alloc_Record, T_Acc => Record_Acc);
      Rec_Acc : Record_Acc;
      Storage_Error_Forced : Boolean := False;
      
      -- table to keep track of allocated records to be freed later
      type Rec_Table_Array is array (Integer range <>) of Record_Acc;
      Rec_Table : Rec_Table_Array(0 .. 1_000_000);
      Table_Index : Integer := Rec_Table'First;
   begin
      declare
      begin
         loop
            exit when (Storage_Error_Forced or else Table_Index >= Rec_Table'Last);
            
            begin
               Rec_Acc := Record_Alloc.Alloc;
               
               begin
                  Rec_Table(Table_Index) := Rec_Acc;
                  Table_Index := Table_Index + 1;
               exception
                  when others =>
                     Assert(False, "Table append failed");
               end;
                        
               if Rec_Acc = null then
                  Storage_Error_Forced := True;
               end if;
            exception
               when E : others =>
                  Assert(False, "Alloc failed: " & Ada.Exceptions.Exception_Name(E) & " => " & Ada.Exceptions.Exception_Message(E));
            end;
         end loop;

         -- free allocated
         for I in Rec_Table'First .. Rec_Table'Last loop
            Record_Alloc.Free(Rec_Table(I));
         end loop;
         
         Assert(Storage_Error_Forced, "Storage_Error could not be forced");
      exception
         when E : others =>
            Assert(False, "Exception got raised! Reason: " & Ada.Exceptions.Exception_Name(E) & " => " & Ada.Exceptions.Exception_Message(E));
      end;        
            
   end TestAlloc_WithForcingStorageError_ResultNullReturned;

end SA_Definite_Tests;
