function sorted = whichWand(wands, fName)
    if ~isfield(wands, fName)
        sorted = 'Invalid Field Name';
    else
        fieldVals = {wands.(fName)};
        if isa(fieldVals{1},'double')
            fieldVals = cell2mat(fieldVals);
        end
        [~, ind] = sort(fieldVals);
        sorted = wands(ind);
    end
end