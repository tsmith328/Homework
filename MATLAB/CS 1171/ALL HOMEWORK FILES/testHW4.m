function hw4 = testHW4
    %hangman
    board1 = hangman('HELLOworld', 'l');
    board2 = hangman('jazz', 'e');
    b1 = hangman_soln('HELLOworld','l');
    b2 = hangman_soln('jazz','e');
    part1 = isequal(board1,b1)&&isequal(board2,b2);
    
    %dna2rna
    rna1 = dna2rna('ATAGTACCGGTTACTGAAAATTGTTG');
    s1 = dna2rna_soln('ATAGTACCGGTTACTGAAAATTGTTG');
    rna2 = dna2rna('ATGATGGTCAGTAACGGGGCAAT');
    s2 = dna2rna_soln('ATGATGGTCAGTAACGGGGCAAT');
    part2 = isequal(rna1,s1)&&isequal(rna2,s2);
    
    %extrema
    v1 = extrema('y=25x^2+0x+10');
    v2 = extrema('y=500x^2+1000x+12');
    v3 = extrema('y=11x^2+484x+2');
    s1 = extrema_soln('y=25x^2+0x+10');
    s2 = extrema_soln('y=500x^2+1000x+12');
    s3 = extrema_soln('y=11x^2+484x+2');
    part3 = isequal(v1,s1)&&isequal(v2,s2)&&isequal(v3,s3);
    
    %caesar
    c1 = caesar('Thank you Mario!', 4);
    s1 = caesar_soln('Thank you Mario!', 4);
    c2 = caesar('Iba vby Wypujlzz pz pu huvaoly jhzasl!', -7);
    s2 = caesar_soln('Iba vby Wypujlzz pz pu huvaoly jhzasl!', -7);
    c3 = caesar('Uh, why isn''t this cipher working?', -26);
    s3 = caesar_soln('Uh, why isn''t this cipher working?', -26);
    c4 = caesar('uggcf://jjj.lbhghor.pbz/jngpu?i=9LsJE438jxt', 65);
    s4 = caesar_soln('uggcf://jjj.lbhghor.pbz/jngpu?i=9LsJE438jxt', 65);
    part4 = isequal(c1,s1)&&isequal(c2,s2)&&isequal(c3,s3)&&isequal(c4,s4);

    %zoinks
    suspect1 = 'The Hotel Manager';
    clue1 = 'Daemon Ritus';
    scrap1 = ['a le h';'ke fd ';'zyq  b';' ner i'];
    guilt1 = zoinks(suspect1,clue1,scrap1);
    g1 = guilt1 == true;

    suspect2 = 'Police Man';
    clue2 = 'footprints';
    scrap2 = ['jkopeld';'doclkse';'qqqfcre';'xiopple'];
    guilt2 = zoinks(suspect2,clue2,scrap2);
    g2 = guilt2 == false;

    suspect3 = 'Headless Horseman';
    clue3 = 'Plane Ticket';
    scrap3 = ['    ';'    ';'    ';'    '];
    guilt3 = zoinks(suspect3,clue3,scrap3);
    g3 = guilt3 == true;
    part5 = g1&&g2&&g3;
    
    hw4 = part1&&part2&&part3&&part5;%&&part4;
end