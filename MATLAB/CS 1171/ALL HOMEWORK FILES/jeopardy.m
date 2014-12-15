function [scores, winner] = jeopardy(board, players, clues)
    %This iiiiiis Jeopardy!
    player1 = players(1);
    player2 = players(2);
    player3 = players(3);
    score1 = 0;
    score2 = 0;
    score3 = 0;
    clueNum = 1;
    while clueNum <= length(clues)
        clue = board(clues{clueNum}(1),clues{clueNum}(2));
        answer = clue.answer;
        value = clue.value;
        answered = false;
        lookingFor = 1;
        while ~answered
            switch lookingFor
                case player1.order(clueNum)
                    if strcmpi(player1.answer(clueNum),answer)
                        score1 = score1 + value;
                        answered = true;
                    else
                        score1 = score1 - value;
                        lookingFor = lookingFor + 1;
                        continue;
                    end
                case player2.order(clueNum)
                    if strcmpi(player2.answer(clueNum),answer)
                        score2 = score2 + value;
                        answered = true;
                    else
                     
                        score2 = score2 - value;
                        lookingFor = lookingFor + 1;
                        continue;
                    end
                case player3.order(clueNum)
                    if strcmpi(player3.answer(clueNum),answer)
                        score3 = score3 + value;
                        answered = true;
                    else
                        score3 = score3 - value;
                        lookingFor = lookingFor + 1;
                        continue;
                    end
                otherwise
                    lookingFor = 1;
                    answered = true;
            end
        end
        clueNum = clueNum + 1;
    end
    players = {player1.name, player2.name, player3.name};
    earnings = [score1, score2, score3];
    [~, ind] = max(earnings);
    winner = players{ind};
    player1.earnings = score1;
    player2.earnings = score2;
    player3.earnings = score3;
    scores = [player1, player2, player3];
end