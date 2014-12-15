function compareExtrap(x, y, domain)
    hold on
    minD = min(x)-domain;
    maxD = max(x)+domain;
    extrapDomain = linspace(minD,maxD);
    plot(x,y,'b*')
    
    intY = interp1(x,y,extrapDomain, 'linear', 'extrap');
    plot(extrapDomain,intY,'g-')
    
    splineY = spline(x,y,extrapDomain);
    plot(extrapDomain,splineY,'r-')
    
    polyC = polyfit(x,y,3);
    polyY = polyval(polyC,extrapDomain);
    plot(extrapDomain,polyY,'k-')
    hold off
end