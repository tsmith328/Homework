function worldClock(time, cities)
    th = linspace(0,2*pi);
    hours = [1 2 3 4 5 6 7 8 9 10 11 12];
    [timeH, timeM] = strtok(time,':');
    hour = str2num(timeH);
    min = str2num(strtok(timeM,':'));
    for j = (1:length(cities))
        city = cities{j}{1};
        [cityH, cityM] = strtok(cities{j}{2},':');
        newH = hour + str2num(cityH);
        newM = min + str2num(strtok(cityM,':'));
        while newM >= 60
            newM = newM - 60;
            newH = newH + 1;
        end
        hourAng = pi+(pi * ((30 * newH + 90)/180));
        minuteAng = pi+(pi * ((30 * (newM/5) + 90)/180));
        hourX = [0, 0.6*cos(hourAng)];
        hourY = [0, -0.6*sin(hourAng)];
        minuteX = [0, 0.9*cos(minuteAng)];
        minuteY = [0, -0.9*sin(minuteAng)];
        subplot(1,length(cities),j);
            hold on
            plot(hourX, hourY, 'b-')
            plot(minuteX, minuteY, 'r-')
            plot(cos(th),sin(th),'k-')
            plot(0,0,'ko')
            title(city);
            for i = 1:length(hours)
                angle = (pi/180)*((30) * hours(i) + (90));
                tickX = [0.9*cos(angle) cos(angle)];
                tickY = [0.9*sin(angle) sin(angle)];
                plot(tickX,tickY,'k-')
            end
            axis square
            axis off
            hold off
    end
end