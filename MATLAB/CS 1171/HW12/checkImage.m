function outcome = checkImage(img1, img2)
    im1 = imread(img1);
    im2 = imread(img2);
    [rows1, cols1, ~] = size(im1);
    [rows2, cols2, ~] = size(im2);
    if (rows1 == rows2 && cols1 == cols2)
        compareRed = im1(:,:,1) == im2(:,:,1);
        compareGreen = im1(:,:,2) == im2(:,:,2);
        compareBlue = im1(:,:,3) == im2(:,:,3);
        if all(compareRed & compareGreen & compareBlue)
            outcome = 'The images are the same.';
        else
            red = zeros(rows1, cols1);
            blue = zeros(rows1, cols1);
            green = zeros(rows1, cols1);
            compare = compareRed & compareGreen & compareBlue;
            red(compare) = 255;
            blue(compare) = 255;
            green(compare) = 255;
            im3 = cat(3,red,green,blue);
            [name1, ext] = strtok(img1,'.');
            name2 = strtok(img2, '.');
            img3 = [ name1 , 'VS', name2, ext];
            imwrite(im3,img3);
            outcome = 'The RGB values are different.';
        end
    else
        outcome = 'The images have different dimensions.';
    end
end