with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers.Big_Integers;

generic
   type Original is range <>;
   type Index_Type is range <>;
package Index_Alignment is

   -- Shifts `Source` by aligning Original'First with Index_Type'First
   function Shift_To_Index_First (Source : Original) return Index_Type
     with Inline,
     Pre => In_Range(Arg => (To_Big_Integer(Integer(Index_Type'First)) - To_Big_Integer(Integer(Original'First))),
                     Low => To_Big_Integer(Integer'First), High => To_Big_Integer(Integer'Last))
     and then In_Range(Arg => abs(To_Big_Integer(Integer(Source)) - To_Big_Integer(Integer(Original'First))),
                       Low => To_Big_Integer(0), High => To_Big_Integer(Index_Type'Range_Length))
     and then In_Range(Arg => abs(To_Big_Integer(Integer(Source)) - To_Big_Integer(Integer(Original'First))),
                       Low => To_Big_Integer(Integer'First), High => To_Big_Integer(Integer'Last))
     and then In_Range(Arg => (abs(To_Big_Integer(Integer(Source)) - To_Big_Integer(Integer(Original'First))) + (To_Big_Integer(Integer(Index_Type'First)) - To_Big_Integer(Integer(Original'First)))),
                       Low => To_Big_Integer(Integer(Index_Type'First)), High => To_Big_Integer(Integer(Index_Type'Last))),
     Post => Shift_To_Index_First'Result = Index_Type(abs(Integer(Source) - Integer(Original'First)) + (Integer(Index_Type'First) - Integer(Original'First)));

end Index_Alignment;
