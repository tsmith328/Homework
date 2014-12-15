function UniqueBestFit(xData,yData)
    numPoints = length(yData);
    newX = linspace(min(xData),max(xData));
    firstMatch = true;
    order = 1:numPoints-1;
    numRows = ceil(length(order)/2.0);
    for i = order
        c = polyfit(xData,yData,i);
        fitY = polyval(c,newX);
        testY = polyval(c,xData);
        AAD = mean(abs(testY - yData));
        subplot(numRows,2,i)
            hold on;
            plot(xData,yData,'rx');
            if AAD < 0.75 && firstMatch
                color = 'b';
                firstMatch = false;
            else
                color = 'k';
            end
            plot(newX,fitY,color);
            title(sprintf('Order %d Fit',i));
    end
end