function number = marbles(height, cDiam, mDiam)
    %Estimates the number of marbles that can fit in a cylinder!
    mVol = (4/3) .* pi .* (mDiam ./ 2) .^ 3; %Volume of one marble.
    cVol = height .* pi .* (cDiam ./ 2) .^ 2; %Volume of the cylinder.
    
    number = ceil(cVol ./ mVol); %Number of marbles that will fit.
end