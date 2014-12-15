function plotStock(stocks)
    threshX = [stocks{1}(1) stocks{end}(1)];
    threshY = [stocks{1}(2) stocks{1}(2)];
    
    hold on
    plot(threshX, threshY, 'k')
    xlabel('Trading Day')
    ylabel('Closing Price (USD)')
    
    for i = (1:length(stocks) - 1)
        x1 = stocks{i}(1);
        x2 = stocks{i+1}(1);
        y1 = stocks{i}(2);
        y2 = stocks{i+1}(2);
        X = [x1 x2];
        Y = [y1 y2];
        if y2 <= stocks{1}(2)
            color = 'r';
        else
            color = 'g';
        end
        plot(X, Y, color)
    end
    hold off
end