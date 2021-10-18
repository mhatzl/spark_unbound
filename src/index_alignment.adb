package body Index_Alignment is

   function Shift_To_Index_First (Source : Original) return Index_Type
   is
   begin
      return Index_Type(abs(Integer(Source) - Integer(Original'First)) + (Integer(Index_Type'First) - Integer(Original'First)));
   end Shift_To_Index_First;
   
end Index_Alignment;
