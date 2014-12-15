function [area, bloodPress] = heartbeat(x, y, normalPress)
    posY = abs(y);
    area = trapz(x,posY);
    if area < normalPress(1)
        bloodPress = 'Low Blood Pressure';
    elseif area < normalPress(2)
        bloodPress = 'Normal Blood Pressure';
    else
        bloodPress = 'High Blood Pressure';
    end
end