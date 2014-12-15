function palace = mindPalace(classes)
    %I'm not a psychopath, Anderson. I'm a high-functioning sociopath.
    myPalace = struct();
    made = [];
    for i = (1:length(classes))
        item = classes{i};
        type = class(item);
        if ismember(type,made)
            myPalace.(type) = [myPalace.(type) {item}];
        else
            myPalace = setfield(myPalace, type, {item});
            made = [made type];
        end
    end
    palace = myPalace;
end