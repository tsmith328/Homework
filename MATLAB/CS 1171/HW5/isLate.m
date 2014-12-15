function [earliest, mode, late] = isLate(currentTime, destination, timeToArr)
    time = getNumTime(currentTime);
    h = time(1);
    m = time(2);
    [readyTime, traffic] = getTimeEffects(time);
    m = m + readyTime;
    driveTime = timeToArrive(destination,traffic,'Driving');
    walkTime = timeToArrive(destination,traffic,'Walking');
    addH = 0;
    while m >= 60
        m = m - 60;
        addH = addH + 1;
    end
    h = addH + h;

    if compareTimes(drivingTime,walkingTime)
        mode = 'Driving';
        earliest = drivingTime;
    else
        mode = 'Walking';
        earliest = walkingTime;
    end
    
end

function time = getNumTime(strTime)
    [strH, rest] = strtok(strTime,':');
    [strM, half] = strtok(rest(2:end),' ');
    h = str2num(strH);
    m = str2num(strM);
    if strcmp(half(2:end),'pm')
        h = h + 12;
    end
    time = [h,m];
end