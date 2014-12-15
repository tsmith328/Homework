function drop = polarVortex(highs)
    highVect = highs';
    highVect = highVect(:);
    numMask = ~(highVect >=0) & ~(highVect <0);
    highVect = highVect(~numMask);
    drops = diff(highVect);
    [~,ind] = min(drops);
    drop = [ind,ind+1];
end