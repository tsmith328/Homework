function labReport(data, experiment)
   fields = fieldnames(data);
   xField = fields{1};
   yField = fields{2};
   y_field = yField;
   xVals = data.(xField);
   xMask = xField == '_';
   yMask = yField == '_';
   xField(xMask) = ' ';
   yField(yMask) = ' ';
   len = length({data.(y_field)});
   if (mod(len,2) == 0)
       subplotWidth = len/2;
   else
       subplotWidth = ceil(len/2);
   end
   y = {data.(y_field)};
   maxX = max(xVals);
   minX = min(xVals);
   maxY = 0;
   minY = 0;
   for j = (1:len)
       if (maxY < max(y{j}))
           maxY = max(y{j});
       end
       if (minY > min(y{j}))
           minY = min(y{j});
       end
   end
   hold on
   for i = (1:len)
       yVals = y{i};
       subplot(2,subplotWidth,i);
       plot(xVals,yVals)
       trial = num2str(i);
       title([experiment, ': Trial ', trial])
       xlabel(xField)
       ylabel(yField)
       axis([minX maxX minY maxY])
   end
   hold off
end