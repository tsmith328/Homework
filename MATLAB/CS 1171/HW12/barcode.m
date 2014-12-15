function barcode(name, price, img, loc)
    im = imread(img);
    [imRows, imCols, ~] = size(im);
    code = [name sprintf('$%.2f', price)];
    binCode = '';
    for i = 1:length(code)
        let = code(i);
        letCode = '';
        num = double(let);
        for j = 1:8
            letCode(end+1) = num2str(mod(num,2));
            num = floor(num/2);
        end
        letCode = fliplr(letCode);
        binCode(end+1:end+8) = letCode;
    end
    imR = im(:,:,1);
    imG = im(:,:,2);
    imB = im(:,:,3);
    imMask = zeros(imRows,imCols);
    imMask = imMask == 2;
    for k = 1:length(binCode);
        if binCode(k) == '1';
            imMask(loc(1):loc(1)+31,loc(2)+(k-1)) = true;
        end
    end
    imR(imMask) = 0;
    imG(imMask) = 0;
    imB(imMask) = 0;
    newIm = cat(3,imR,imG,imB);
    imwrite(newIm,['barcoded' img]);
end