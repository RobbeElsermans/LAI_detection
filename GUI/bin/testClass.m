classdef testClass
   properties (Access = public)
      Property1 = ""
   end
   methods (Access = public)
       function textLatenZien(obj, tekst)
         disp(tekst + obj.Property1)
       end
   end
end