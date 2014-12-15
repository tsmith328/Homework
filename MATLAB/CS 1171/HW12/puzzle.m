function fits = puzzle(image, piece1, piece2)
    img = imread(image);
    img2 = imread(piece1);
    img3 = imread(piece2);
    [rows1, cols1, ~] = size(img);
    isWhite = img==255;
    %first piece
    [rows2, cols2, ~] = size(img2);
    if (rows1==rows2)&&(cols1==cols2)
        isPieceWhite = img2 == 255;
        isTotalWhite = xor(isWhite, isPieceWhite);
        if isTotalWhite
            fits = 'The first is the right piece';
        end
    else
        %second piece
        [rows3, cols3, ~] = size(img3);
        if (rows1==rows3)&&(cols1==cols3)
            isPieceWhite = img3 == 255;
            isTotalWhite = xor(isWhite, isPieceWhite);
            if isTotalWhite
                fits = 'The second is the right piece';
            else
                fits = 'None of the pieces fit';
            end
        else
            fits = 'None of the pieces fit';
        end
    end
end