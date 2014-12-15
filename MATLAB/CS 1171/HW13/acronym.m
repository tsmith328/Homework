function output = acronym(phrase)
    isCap = phrase >= 'A' & phrase <= 'Z';
    acron = zeros(1,length(phrase));
    acron = acron == 1;
    for i = 1:length(phrase)
        if isCap(i)
            if i == 1
                acron(i) = true;
            elseif phrase(i-1) == ' '
                acron(i) = true;
            end
        end
    end
    output = phrase(acron);
end