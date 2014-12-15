function modified = switchCase(phrase, howTo)
    %Modifies the unput string in one of four ways.
    switch howTo
        case 'Title Case'
            title = lower(phrase);
            words = strread(title,'%s')';
            modified = '';
            for i = 1:length(words)
                firstLett = words{i}(1);
                firstLett = upper(firstLett);
                words{i}(1) = firstLett;
                modified = [modified words{i} ' '];
            end
            modified(end) = '';
        case 'Camel Case'
            title = lower(phrase);
            words = strread(title,'%s')';
            modified = words{1};
            for i = 2:length(words)
                words{i}(1) = upper(words{i}(1));
                modified = [modified words{i}];
            end
        case 'Da Vinci'
            modified = phrase(end:-1:1);
            
        case '1337'
            %Create masks for the letters:
            mask1 = phrase == 'l' | phrase == 'L';
            mask2 = phrase == 'z' | phrase == 'Z';
            mask3 = phrase == 'e' | phrase == 'E';
            mask4 = phrase == 'a' | phrase == 'A';
            mask5 = phrase == 's' | phrase == 'S';
            mask6 = phrase == 'g' | phrase == 'G';
            mask7 = phrase == 't' | phrase == 'T';
            mask8 = phrase == 'b' | phrase == 'B';
            mask9 = phrase == 'j' | phrase == 'J';
            mask0 = phrase == 'o' | phrase == 'O';
            
            %Assign to each applicable letter its corresponding "leetter":
            phrase(mask1) = '1';
            phrase(mask2) = '2';
            phrase(mask3) = '3';
            phrase(mask4) = '4';
            phrase(mask5) = '5';
            phrase(mask6) = '6';
            phrase(mask7) = '7';
            phrase(mask8) = '8';
            phrase(mask9) = '9';
            phrase(mask0) = '0';
            
            modified = phrase;
    end
end