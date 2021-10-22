with Spark_Unbound.Arrays;
with AUnit.Assertions; use AUnit.Assertions;


package body UA_Append_Tests is

   
   procedure Set_Up (T : in out Test_Fixture)
   is
   begin
      T.V1 := 1;
      T.V2 := 2;
      T.V3 := 3;
      T.V4 := 4;
   end;
      
   
   procedure TestAppend_WithEnoughCapacity_ResultAppended(T : in out Test_Fixture)
   is
      package UA_Integer is new Spark_Unbound.Arrays(Element_Type => Integer, Index_Type => Positive);
      Test_UA : UA_Integer.Unbound_Array := UA_Integer.To_Unbound_Array(Initial_Capacity => 10);
      Success : Boolean;
   begin
      UA_Integer.Append(Test_UA, T.V1, Success);
      Assert(Success, "Appending V1 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V1, "Appending V1 did not set it as last element");
      
      UA_Integer.Append(Test_UA, T.V2, Success);     
      Assert(Success, "Appending V2 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V2, "Appending V2 did not set it as last element");
      
      UA_Integer.Append(Test_UA, T.V3, Success);     
      Assert(Success, "Appending V3 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V3, "Appending V3 did not set it as last element");
      
      UA_Integer.Append(Test_UA, T.V4, Success); 
      Assert(Success, "Appending V4 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V4, "Appending V4 did not set it as last element");
      
      UA_Integer.Clear(Test_UA);
   end;
      
   
   procedure TestAppend_WithSmallCapacity_ResultAppended(T : in out Test_Fixture)
   is
      package UA_Integer is new Spark_Unbound.Arrays(Element_Type => Integer, Index_Type => Positive);
      Test_UA : UA_Integer.Unbound_Array := UA_Integer.To_Unbound_Array(Initial_Capacity => 3); -- Note the low capacity
      Success : Boolean;
   begin      
      UA_Integer.Append(Test_UA, T.V1, Success);
      Assert(Success, "Appending V1 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V1, "Appending V1 did not set it as last element");
      
      UA_Integer.Append(Test_UA, T.V2, Success);     
      Assert(Success, "Appending V2 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V2, "Appending V2 did not set it as last element");
      
      UA_Integer.Append(Test_UA, T.V3, Success);     
      Assert(Success, "Appending V3 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V3, "Appending V3 did not set it as last element");
      
      
      Assert(UA_Integer.Length(Test_UA) = UA_Integer.Capacity(Test_UA), "Length of Unbound_Array did not reach Capacity");
      
      -- Now Append needs to resize
      
      UA_Integer.Append(Test_UA, T.V4, Success); 
      Assert(Success, "Appending V4 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V4, "Appending V4 did not set it as last element");
      
      UA_Integer.Clear(Test_UA);
   end;
   
      
   procedure TestAppend_WithIndexEndReached_ResultNotAppended(T : in out Test_Fixture)
   is
      type Small_Index is range 0 .. 2;  -- Note: Type only allows 3 values
      package UA_Integer is new Spark_Unbound.Arrays(Element_Type => Integer, Index_Type => Small_Index);
      Test_UA : UA_Integer.Unbound_Array := UA_Integer.To_Unbound_Array(Initial_Capacity => 3);
      Success : Boolean;
   begin
      UA_Integer.Append(Test_UA, T.V1, Success);
      Assert(Success, "Appending V1 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V1, "Appending V1 did not set it as last element");
      
      UA_Integer.Append(Test_UA, T.V2, Success);     
      Assert(Success, "Appending V2 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V2, "Appending V2 did not set it as last element");
      
      UA_Integer.Append(Test_UA, T.V3, Success);     
      Assert(Success, "Appending V3 failed");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V3, "Appending V3 did not set it as last element");
      
      
      Assert(UA_Integer.Length(Test_UA) = UA_Integer.Capacity(Test_UA), "Length of Unbound_Array did not reach Capacity");
      
      -- Append can not resize beyond Index_Type range
      
      UA_Integer.Append(Test_UA, T.V4, Success);
      Assert(not Success, "Appened V4 even though Index_Type exceeded");
      Assert(UA_Integer.Last_Element(Test_UA) /= T.V4, "Appended V4 even though Index_Type limit exceeded");
      Assert(UA_Integer.Last_Element(Test_UA) = T.V3, "V3 not last element after exceeding Index_Type limit");
      
      UA_Integer.Clear(Test_UA);
   end;
      

end UA_Append_Tests;
