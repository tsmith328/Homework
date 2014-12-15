function stretched = stretchArr(orig, factor)
    [row,col] = size(orig);
    newRow = round(linspace(1,row,row*factor));
    newCol = round(linspace(1,col,col*factor));
    stretched = orig(newRow,newCol);
end