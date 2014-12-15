function ticTacToe(game)
    winner = getWinner(game);
    if strcmp(winner, 'tie')
        win = 'Cat''s game.';
    else
        win = ['Player ' winner ' wins!'];
    end
    plotTicTacToeGrid(2,2)
    hold on
    for i = 1:3
        for j = 1:3
            if game(i,j) == 'X'
                x1 = [j-0.3, j+0.3];
                x2 = [j-0.3, j+0.3];
                y1 = [(4-i)+0.3, (4-i)-0.3];
                y2 = [(4-i)-0.3, (4-i)+0.3];
                plot(x1,y1,'k-')
                plot(x2,y2,'k-')
            elseif game(i,j) == 'O'
                th = linspace(0,2*pi);
                circX = 0.3*cos(th) + j;
                circY = 0.3*sin(th) + (4-i);
                plot(circX,circY,'r-')
            end
        end
    end
    axis off
    title(win)
    hold off
end