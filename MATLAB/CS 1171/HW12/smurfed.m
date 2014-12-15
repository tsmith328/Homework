function smurfed(celeb)
    [cName, ext] = strtok(celeb,'.');
    newName = [cName '_smurf' ext];
    img = imread(celeb);
    imgRed = img(:,:,1);
    imgGreen = img(:,:,2);
    imgBlue = img(:,:,3);
    isRed = imgRed == 255;
    isGreen = imgGreen == 255;
    isBlue = imgBlue == 255;
    isWhite = isRed&isGreen&isBlue;
    imgRed(~isWhite) = imgRed(~isWhite) ./ 3;
    imgGreen(~isWhite) = imgGreen(~isWhite) ./ 3;
    newImg = cat(3,imgRed, imgGreen, imgBlue);
    imwrite(newImg, newName);
end