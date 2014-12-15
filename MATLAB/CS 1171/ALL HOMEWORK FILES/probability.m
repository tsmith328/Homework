function [red green] = probability(nred,ngreen,pred,pgreen)
    total = nred + ngreen;
    perRed = 1 - pred ./ 100;
    perGreen = 1 - pgreen/100;
    rotRed = perRed .* nred;
    rotGreen = perGreen .* ngreen;
    red = 100 .* (rotRed ./ total);
    green = 100 .* (rotGreen ./ total);
end
