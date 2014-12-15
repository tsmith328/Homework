function table = multiTable(upperVal)
    row1 = 0:upperVal;
    col1 = row1(2:end)';
    tableInner = [];
    for j = col1
        row = [];
        for i = row1(2:end)
            element = j*i;
            row = [row element];
        end
        tableInner = [tableInner; row];
    end
    table = [row1; col1 tableInner];
end