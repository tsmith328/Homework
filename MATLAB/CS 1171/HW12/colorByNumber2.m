function array = colorByNumber2(img, crayons)
    [vals, colors, ~] = xlsread(crayons);
    im = imread(img);
    redVals = vals(:,1)';
    greenVals = vals(:,2)';
    blueVals = vals(:,3)';
    colorNames = colors(2:end,1)';
    num = '1234567890';
    [fileName, numPart] = strtok(img, num);
    blockSize = str2double(strtok(numPart,'.'));
    outName = [fileName '.txt'];
    fOut = fopen(outName, 'wt');
    [r, c, ~] = size(im);
    j = 1;
    foundColors = {};
    indecies = [];
    while j <= r
        i = 1;
        thisRow = [];
        while i <= c
            pxRed = im(j,i,1);
            pxGreen = im(j,i,2);
            pxBlue = im(j,i,3);
            reds = find(redVals == pxRed);
            for k = reds
                if greenVals(k) == pxGreen && blueVals(k) == pxBlue
                    color = colorNames{k};
                    break;
                end
            end
            if ~any(ismember(foundColors,color))
                foundColors{end+1} = color;
            end
            for l = 1:length(foundColors)
                if isequal(foundColors{l},color)
                    ind = l;
                    break;
                end
            end
            thisRow = [thisRow ind];
            i = i + blockSize;
        end
        indecies = [indecies; thisRow];
        j = j + blockSize;
    end
    array = indecies;
    toWrite = [];
    for m = 1:length(foundColors)
        toWrite = [toWrite, [num2str(m) ': ' foundColors{m} '\n']];
    end
    fprintf(fOut, toWrite(1:end-2));
    fclose(fOut);
end