function newCell = sortByHeader(xlsFile, header)
    [~,~,data] = xlsread(xlsFile);
    headers = data(1,:);
    for i = 1:length(headers)
        if strcmp(headers{i},header)
            col = i;
            break;
        end
    end
    if isa(data{2,col},'double')
        c = cell2mat(data(2:end,col));
        [~,ind] = sort(c,'ascend');
    else
        c = data(2:end,col);
        [~,ind] = sort(c);
    end
    ind = ind + 1;
    newCell = [headers; data(ind,:)];
end