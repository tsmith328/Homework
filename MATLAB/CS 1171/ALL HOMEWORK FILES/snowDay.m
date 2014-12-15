function closed = snowDay(forecast)
    %Let it snow, let it snow, let it snow!
    pastHighs = [];
    weekWeather = {};
    anySnow = false;
    for i = (1:7)
        day = forecast(i).Day;
        weather = forecast(i).Forecast;
        high = forecast(i).High;
        weekWeather = [weekWeather {weather}];
        if strcmpi(weather, 'snow')
            stuck = willItStick(pastHighs);
        else
            stuck = false;
        end
        pastHighs = [pastHighs high];
        if stuck
            snowday = day;
            dayNum = i;
            anySnow = true;
        end
    end
    if anySnow
        [hourly, rate] = weatherMan(forecast(dayNum));
        totalSnow = sum(hourly)*rate;
        report.Week = forecast;
        report.SnowDay = snowday;
        report.PredictedSnowfall = totalSnow;
        days = 1;
        j = dayNum;
        while j <=7;
            if pastHighs(j) > 32
                break;
            else
                days = days + 1;
                j = j + 1;
            end
        end
        report.PredictedDuration = days;
        closed = askBud(report);
    else
        closed = 'Campus will remain open.';
    end 
end