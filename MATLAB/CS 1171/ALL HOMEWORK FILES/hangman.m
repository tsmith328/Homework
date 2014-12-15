function board = hangman(word,letter)
    wordLow = lower(word); %for ease of comparison
    mask = wordLow == letter; %create a vector of logicals denoting where the letters are in the word
    board = 95 .* ones(1,length(word)); %95 is ASCii code for _
    board(mask) = word(mask); %Move values to board vector where mask is true (same letters)
    board = char(board);
end