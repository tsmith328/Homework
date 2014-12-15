function guilty = zoinks(name, clue, paper)
    shift = mod(length(name),10);
    clueVal = clueCipher(clue,shift);
    paper = paper(paper ~= ' ');
    paperAvg = char(floor(mean(double(paper))));
    guilty = key(paperAvg) & clueVal > 5;
end