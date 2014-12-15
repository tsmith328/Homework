function hw5 = testHW5
    %ifOrSwitch
    out1 = ifOrSwitch('continuous');
    s1 = ifOrSwitch_soln('continuous');
    out2 = ifOrSwitch('many-TO-one');
    s2 = ifOrSwitch_soln('many-TO-one');
    out3 = ifOrSwitch('fancy');
    s3 = ifOrSwitch_soln('fancy');
    out4 = ifOrSwitch('Discrete');
    s4 = ifOrSwitch_soln('Discrete');
    part1 = isequal(s1,out1)&&isequal(s2,out2)&&isequal(s3,out3)&&isequal(s4,out4);
    
    %myFootball
    teams1 = 'Broncos;Seahawks';
    seasonRecord1 = [13 3 12 4];
    seasonHardness1 = 'Medium;Hard';
    victor1 = myFootball(teams1,seasonRecord1,seasonHardness1);
    s1 = myFootball_soln(teams1,seasonRecord1,seasonHardness1);

    teams2 = 'Falcons;49ers';
    seasonRecord2 = [16 0 10 6];
    seasonHardness2 = 'Medium;Easy';
    victor2 = myFootball(teams2,seasonRecord2,seasonHardness2);
    s2 = myFootball_soln(teams2,seasonRecord2,seasonHardness2);

    teams3 = 'Panthers;Packers';
    seasonRecord3 = [9 7 9 7];
    seasonHardness3 = 'Easy;Easy';
    victor3 = myFootball(teams3,seasonRecord3,seasonHardness3);
    s3 = myFootball_soln(teams3,seasonRecord3,seasonHardness3);
    part2 = isequal(s1,victor1)&&isequal(s2,victor2)&&isequal(s3,victor3);
    
    %switchCase
    a1 = switchCase('there AND back again', 'Title Case');
    s1 = switchCase_soln('there AND back again', 'Title Case');
    a2 = switchCase('What is better than UPPER or lower case?',...
    'Camel Case');
    s2 = switchCase_soln('What is better than UPPER or lower case?',...
    'Camel Case');
    a3 = switchCase('Hannah!', 'Da Vinci');
    s3 = switchCase_soln('Hannah!', 'Da Vinci');
    a4 = switchCase('Now I can talk like a REAL hacker!', '1337');
    s4 = switchCase_soln('Now I can talk like a REAL hacker!', '1337');
    part3 = isequal(a1,s1)&&isequal(a2,s2)&&isequal(a3,s3)&&isequal(s4,a4);
    
    %isLate
    [eta1, trans1, late1] = isLate('7:00 am', 'MRDC', '8:05 am');
    [etas1, transs1, lates1] = isLate_soln('7:00 am', 'MRDC', '8:05 am');
    [eta2, trans2, late2] = isLate('12:36 pm', 'New York', '5:00 pm');
    [etas2, transs2, lates2] = isLate_soln('12:36 pm', 'New York', '5:00 pm');
    [eta3, trans3, late3] = isLate('11:00 am', 'Mordor', '12:01 pm');
    [etas3, transs3, lates3] = isLate_soln('11:00 am', 'Mordor', '12:01 pm');
    eta = isequal(eta1,etas1)&&isequal(eta2,etas2)&&isequal(eta3,etas3);
    trans = isequal(trans1,transs1)&&isequal(trans2,transs2)&&isequal(trans3,transs3);
    late = isequal(late1,lates1)&&isequal(late2,lates2)&&isequal(late3,lates3);
    part4 = eta&&trans&&late;
    
    hw5 = part1&&part2&&part3&&part4;
end