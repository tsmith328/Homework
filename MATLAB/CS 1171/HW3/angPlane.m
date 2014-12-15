function angle = angPlane(p1,p2,a)
    v1 = p1 - a;
    v2 = p2 - a;
    mag1 = (sum(v1 .^ 2)) .^ .5;
    mag2 = (sum(v2 .^ 2)) .^ .5;
    dotProd = sum(v1 .* v2);
    ac = dotProd/(mag1*mag2);
    angle = 10\round(10*acosd(ac));
end