function slope = linFit(fileName, lowerX, upperX)
    hold on
    fileIn = csvread(fileName);
    funcX = fileIn(:,1)';
    funcY = fileIn(:,2)';
    plot(funcX,funcY,'bo')
    
    startX = min(funcX);
    endX = max(funcX);
    lineX = linspace(startX,endX);
    
    rangeStart = find(funcX >= lowerX,1);
    rangeEnd = find(funcX <= upperX,1,'last');
    rangeX = funcX(rangeStart:rangeEnd);
    rangeY = funcY(rangeStart:rangeEnd);
    
    lineC = polyfit(rangeX,rangeY,1);
    lineY = polyval(lineC,lineX);
    plot(lineX,lineY,'r-');

    slope = 1000\round(lineC(1) *1000);
    hold off
end