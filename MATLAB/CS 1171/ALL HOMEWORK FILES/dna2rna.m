function rna = dna2rna(dna)
    %Find ASCii values for each letter
    aChar = double('A');
    tChar = double('T');
    gChar = double('G');
    cChar = double('C');
    uChar = double('U');
    dnaChar = double(dna);
    
    %Creating masks (one for each letter)
    onlyA = dnaChar == aChar;
    onlyG = dnaChar == gChar;
    onlyT = dnaChar == tChar;
    onlyC = dnaChar == cChar;
    
    %Create vectors to fill with RNA letters
    rnaA = zeros(1,length(dna));
    rnaG = zeros(1,length(dna));
    rnaU = zeros(1,length(dna));
    rnaC = zeros(1,length(dna));
    
    %Fill each vector with the corresponding letter (T to A, etc.)
    rnaA(onlyT) = aChar;
    rnaG(onlyC) = gChar;
    rnaU(onlyA) = uChar;
    rnaC(onlyG) = cChar;
    
    %Sum of vectors: creates one vector with all values
    rna = rnaA + rnaG + rnaU + rnaC;
    rna = char(rna);
end