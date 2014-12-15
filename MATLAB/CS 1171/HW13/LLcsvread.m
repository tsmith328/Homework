function cellArr = LLcsvread(csvFile)
    file = fopen(csvFile, 'r');
    line = fgetl(file);
    lines = {};
    lines{end+1} = {line};
    commas = 0;
    cellArr = {};
    while ~isequal(line,-1)
        if length(find(line==',')) > commas
            commas = length(find(line==','));
        end
        line = fgetl(file);
        lines{end+1} = {line};
    end
    lines = lines(1:end-1);
    for i = 1:length(lines)
        lineCell = {};
        j = 1;
        while j <= commas
            j = j+1;
            if isempty(lines{i})
                lineCell{end+1} = [];
            else
                if strcmp(',',lines{i}(1))
                    lineCell{end+1} = '';
                    lines{i} = lines{i}(2:end);
                else
                    [word, rest] = strtok(lines{i},',');
                    lineCell{end+1} = word;
                    if strcmp(class(rest),'cell')
                        r = rest{1};
                    else
                        r = rest;
                    end
                    lines{i} = r(2:end);
                end
            end
        end
        cellArr = [cellArr;lineCell];
    end
end