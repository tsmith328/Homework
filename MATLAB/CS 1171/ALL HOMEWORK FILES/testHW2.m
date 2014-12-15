function hw2 = testHW2()
    %Wreckit
    w1 = wreckIt(900,5,3000);
    w2 = wreckIt(874.5,12,20000);
    w3 = wreckIt(125,25,5000);
    if w1&&~w2&&~w3
        part1 = true;
    else
        part1 = false;
    end

    %marbles
    heightC1 = 75;
    diameterC1 = 10;
    diameterMarEst1 = 3;
    estNumMarbles1 = marbles(heightC1, diameterC1, diameterMarEst1);
    heightC2 = 30;
    diameterC2 = 5;
    diameterMarEst2 = 1.5;
    estNumMarbles2 = marbles(heightC2, diameterC2, diameterMarEst2);
    if estNumMarbles1 == 417 && estNumMarbles2 == 334
        part2 = true;
    else
        part2 = false;
    end

    %odd&divis
    log1 = oddAndDivisible(35, 5, 7);
    log2 = oddAndDivisible(30, 5, 6);

    if log1&&~log2
        part3 = true;
    else
        part3 = false;
    end

    %shortCuts
    [step1,time1] = shortCuts(250,300);
    [step2,time2] = shortCuts(47,93);
    [step3,time3] = shortCuts(30,40);
    if step1==64&&step2==15&&step3==8&&time1==35.08&&time2==7.87&&time3==4.40
        part4 = true;
    else
        part4 = false;
    end

    %tripPlanner
    price1 = tripPlanner(354,702,18316741);
    price2 = tripPlanner(001,898,14313961);
    price3 = tripPlanner(288,456,17345678);

    if price1==65.40&&price2==121.60&&price3==61.80
        part5 = true;
    else
        part5 = false;
    end

    if part1&&part2&&part3&&part4&&part5
        hw2 = true;
    else
        hw2 = false;
    end
end