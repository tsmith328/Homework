function stock = buySellOrHold(fileName)
    [numbers, texts, ~] = xlsread(fileName);
    [rows, cols] = size(texts);
    for i = 1:cols
        if isequal(texts{1,i},'Close')
            closeInd = i-1;
            break;
        end
    end
    prices = numbers(:,closeInd)';
    pointAvg22 = movingAverage(prices,22);
    days = 1:length(prices);
    movingAvgDiff = diff(pointAvg22)./diff(days);
    diffAvg22 = movingAverage(movingAvgDiff,22);
    movAvgLen = length(pointAvg22);
    movAvgx1 = days(movAvgLen-65:movAvgLen);
    movAvgx2 = days(movAvgLen-130:movAvgLen);
    movAvgx3 = days(1:length(diffAvg22));
    movAvgC1 = polyfit(movAvgx1,pointAvg22(movAvgLen-65:end),1);
    movAvgy1 = polyval(movAvgC1,movAvgx1);
    movAvgC2 = polyfit(movAvgx2,pointAvg22(movAvgLen-130:end),1);
    movAvgy2 = polyval(movAvgC2,movAvgx2);
    movAvgC3 = polyfit(movAvgx3,diffAvg22,1);
    movAvgy3 = polyval(movAvgC3,movAvgx3);
    hold on
    subplot(2,1,1)
    hold on
        plot(days,prices,'b-')
        plot(days,pointAvg22,'r-')
        plot(movAvgx1,movAvgy1,'k-')
        plot(movAvgx2,movAvgy2,'k-')
    subplot(2,1,2)
    hold on
        plot(days(2:end),movingAvgDiff,'c-')
        plot(days(2:end),diffAvg22,'m-')
        plot(movAvgx3,movAvgy3,'k-')
    hold off
    stock = processSlopes(movAvgC1(1),movAvgC2(1),movAvgC3(1));
end