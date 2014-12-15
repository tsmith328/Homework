function howToCircle(center, radius, angle)
    th = linspace(0,2*pi,100);
    x = center(1);
    y = center(2);
    circX = radius*cos(th) + x;
    circY = radius*sin(th) + y;
    hold on
    plot(x,y,'*k')
    centerLeg = ['center of circle: (' num2str(x) ',' num2str(y) ')'];
    
    plot(circX,circY,'k')
    perimLeg = 'circle perimeter';
    
    angRad = angle * 2 * pi / 360;
    pointX = radius*cos(angRad) + x;
    pointY = radius*sin(angRad) + y;
    plot(pointX, pointY, '*m');
    pointLeg = ['(' num2str(100\round(100*pointX)) ', ' num2str(100\round(100*pointY)) ')'];
    
    c2pX = [x, pointX];
    c2pY = [y, pointY];
    plot(c2pX,c2pY,'b');
    c2pLeg = ['radius = ' num2str(radius)];
    
    horizX = [x, pointX];
    horizY = [y, y];
    plot(horizX, horizY, 'g--')
    horizLeg = 'r*cos(th)';
    
    vertX = [pointX, pointX];
    vertY = [y, pointY];
    plot(vertX, vertY, 'c--')
    vertLeg = 'r*sin(th)';
    
    arc = linspace(0,angRad,25);
    arcX = ((1/3)*(pointX - x)*cos(arc)) + x;
    arcY = (1/3)*(pointX - x)*sin(arc) + y;
    plot(arcX, arcY, 'r--');
    arcLeg = ['th = ', num2str(angle), ' degrees'];
    title('How to Circle');
    legend(centerLeg, perimLeg, pointLeg, c2pLeg, horizLeg, vertLeg, arcLeg, 'Location', 'SouthEast');
    axis equal
    hold off
end