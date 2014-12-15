    function hw1 = testHW1
    %1
    out1 = DistForm(4,5,7,9);
    out2 = DistForm(4,3,-7,-10);
    out3 = DistForm(0,0,0,0);
    if (out1 == 5)&&(abs(out2-17.0294)<=0.0001)&&(out3 == 0)
        part1 = true;
    else
        part1 = false;
    end

    %2
    bagSize1 = 512;
    numKids1 = 22;
    [pieces1, wasted1] = candy(bagSize1, numKids1);
    bagSize2 = 300;
    numKids2 = 17;
    [pieces2, wasted2] = candy(bagSize2, numKids2);
    if pieces1==23&&pieces2==17&&wasted2==11&&wasted1==6
        part2 = true;
    else
        part2 = false;
    end

    %3
    [red1, grn1] = probability(10, 10, 20, 50);
    [red2, grn2] = probability(35, 2, 80, 0);

    if red1==40&&grn1==25&&abs(red2-18.9189)<=0.0001&&abs(grn2-5.4054)<=0.0001
        part3 = true;
    else
        part3 = false;
    end

    if part1&&part2&&part3
        hw1 = true;
    else
        hw1 = false;
    end
end