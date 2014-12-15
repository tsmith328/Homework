function [diffEQ, intEQ] = calculus(eq)
    coeff = getCoefficients(eq);
    power = length(coeff)-1;
    diffCoeff = [];
    for i = 1:length(coeff)
        diffCoeff = [diffCoeff power*coeff(i)];
        power = power-1;
    end
    diffEQ = getEquation(diffCoeff(1:end-1));
    
    power = length(coeff);
    intCoeff = [];
    for j = 1:length(coeff)
        intCoeff = [intCoeff coeff(j)/power];
        power = power-1;
    end
    intCoeff = [intCoeff 0];
    int = getEquation(intCoeff);
    intEQ = [int(1:end) '+C'];
end