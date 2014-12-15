function [bestSong, bestScore] = favoriteSongs(song1, song2, song3, scores)
    file = fopen(scores,'r');
    score1 = 0;
    score2 = 0;
    score3 = 0;
    line = fgetl(file);
    while ~feof(file)
        [song, rawScore] = strtok(line,':');
        score = str2num(rawScore(3:end));
        switch song
            case song1
                score1 = score1 + score;
            case song2
                score2 = score2 + score;
            case song3
                score3 = score3 + score;
        end
        line = fgetl(file);
    end
    
    if (score1 > score2) && (score1 > score3)
        bestSong = song1;
        bestScore = score1;
        fclose(file);
        return;
    elseif score2 > score3
        bestSong = song2;
        bestScore = score2;
        fclose(file);
        return;
    else
        bestSong = song3;
        bestScore = score3;
    end
    fclose(file);
end