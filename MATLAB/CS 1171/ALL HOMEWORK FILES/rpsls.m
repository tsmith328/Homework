function winner = rpsls(play1, play2)
    if strcmp(play1,play2)
        winner = 'It''s a tie!';
    else
        if strcmp(play1,'rock')
            if strcmp(play2,'scissors') || strcmp(play2,'lizard')
                winner = 'Player 1 wins!';
            else
                winner = 'Player 2 wins!';
            end
        elseif strcmp(play1,'paper')
            if strcmp(play2,'rock') || strcmp(play2,'spock')
                winner = 'Player 1 wins!';
            else
                winner = 'Player 2 wins!';
            end
        elseif strcmp(play1,'scissors')
            if strcmp(play2,'paper') || strcmp(play2,'lizard')
                winner = 'Player 1 wins!';
            else
                winner = 'Player 2 wins!';
            end
        elseif strcmp(play1,'lizard')
            if strcmp(play2,'paper') || strcmp(play2,'spock')
                winner = 'Player 1 wins!';
            else
                winner = 'Player 2 wins!';
            end
        elseif strcmp(play1,'spock')
            if strcmp(play2,'rock') || strcmp(play2,'scissors')
                winner = 'Player 1 wins!';
            else
                winner = 'Player 2 wins!';
            end
        end
    end
end