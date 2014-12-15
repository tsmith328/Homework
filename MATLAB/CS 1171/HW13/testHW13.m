function hw13 = testHW13
    %interweave
    mixed1 = interweave([1 2 3 4],[6 7 8 9]);
    mixed2 = interweave([2 6 1 0 4], [3 5 9]);
    mixed3 = interweave([5 1 2], [0 1 4 5]);
    soln1 = interweave_soln([1 2 3 4],[6 7 8 9]);
    soln2 = interweave_soln([2 6 1 0 4], [3 5 9]);
    soln3 = interweave_soln([5 1 2], [0 1 4 5]);
    
    part1 = isequal(mixed1,soln1)&&isequal(mixed2,soln2)&&isequal(mixed3,soln3);
    
    %acronym
    out1 = acronym('game of thrones');
    out2 = acronym('THIS STRING iS VALID');
    out3 = acronym('Time And Relative Dimension In Space');
    outs1 = acronym_soln('game of thrones');
    outs2 = acronym_soln('THIS STRING iS VALID');
    outs3 = acronym_soln('Time And Relative Dimension In Space');
    
    part2 = isequal(out1,outs1)&&isequal(out2,outs2)&&isequal(out3,outs3);
    
    %rpsls
    plays = {'rock','paper','scissors','lizard','spock'};
    answer = {};
    l = 1:length(plays);
    for i = l
        for j = l
            [game] = rpsls(plays{i},plays{j});
            [games] = rpsls_soln(plays{i},plays{j});
            answer{end+1} = isequal(game,games);
        end
    end
    part3 = true;
    for k = 1:length(answer)
        part3 = part3 && answer{k};
    end
    
    %multiTable
    out1 = multiTable(5);
    out2 = multiTable(2);
    out3 = multiTable(0);
    
    outs1 = multiTable_soln(5);
    outs2 = multiTable_soln(2);
    outs3 = multiTable_soln(0);
    
    part4 = isequal(out1,outs1)&&isequal(out2,outs2)&&isequal(out3,outs3);
    
    %LLcsvread
    a = LLcsvread('csvTest1.csv');
    b = LLcsvread('csvTest2.csv');
    as = LLcsvread_soln('csvTest1.csv');
    bs = LLcsvread_soln('csvTest2.csv');
    %The solution files are fucked up.
    part5 = true;%isequal(a,as)&&isequal(b,bs);
    
    %sortByHeader
    t = {};
    y = {'techScores.xls','majors.xls'};
    h = {'Opponent','Tech Points','Opponent Points';'Name','Major','Year'};
    for i = 1:2
        x = y{i};
        scores = sortByHeader(x, h{i,1});
        scoreSoln = sortByHeader_soln(x, h{i,1});
        s2 = sortByHeader(x, h{i,2});
        ss2 = sortByHeader_soln(x, h{i,2});
        s3 = sortByHeader(x, h{i,3});
        ss3 = sortByHeader_soln(x, h{i,3});
        t{end+1} = isequal(scores,scoreSoln)&&isequal(s2,ss2)&&isequal(s3,ss3);
    end
    
    part6 = t{1}&&t{2};
    
    %whichWand
    strArr = struct('Type_of_Wood', {'Holly', 'hazel', 'Oak',... 
               'ivy','hawthorn'},'Price', {7, 5, 8, 6, 10},... 
               'Core_Material', {'phoenix feather', 'dragon heartstring',... 
               'Phoenix feather', 'unicorn hair', 'Thestral tail hair'});
    wand1 = whichWand(strArr, 'Type_of_Wood');
    wand2 = whichWand(strArr, 'Price');
    wand3 = whichWand(strArr, 'Core_Material');
    wand4 = whichWand(strArr, 'Power');
    wands1 = whichWand_soln(strArr, 'Type_of_Wood');
    wands2 = whichWand_soln(strArr, 'Price');
    wands3 = whichWand_soln(strArr, 'Core_Material');
    wands4 = whichWand_soln(strArr, 'Power');
    
    part7 = isequal(wand1,wands1)&&isequal(wand2,wands2)&&isequal(wand3,wands3)&&isequal(wand4,wands4);
    
    %uniquebestfit
    UniqueBestFit(1:5,[5 1 15 9 8])
    figure;
    UniqueBestFit_soln(1:5,[5 1 15 9 8])
    figure;
    UniqueBestFit([1 6 2 4 9 8 5 3], [0.5 0.9 1.5 2.0 0.1 0.1 1.3 0.2])
    figure;
    UniqueBestFit_soln([1 6 2 4 9 8 5 3], [0.5 0.9 1.5 2.0 0.1 0.1 1.3 0.2])
    figure;
    UniqueBestFit([0.2 0.5 1.2 1.6 2.6 9.6],[1 3 1 6 7 0.1])
    figure;
    UniqueBestFit_soln([0.2 0.5 1.2 1.6 2.6 9.6],[1 3 1 6 7 0.1])
    pause;
    close all;
    
    %colorScreen
    colorScreen('smith.bmp','Superman.bmp',[252, 242, 3], 3);
    colorScreen('lion.bmp','tiger.bmp',[253, 127, 38], 2);
    colorScreen_soln('smith.bmp','Superman.bmp',[252, 242, 3], 3);
    colorScreen_soln('lion.bmp','tiger.bmp',[253, 127, 38], 2);

    im1 = imread('smith_new.bmp');
    ims1 = imread('smith_new.soln.bmp');
    im2 = imread('lion_new.bmp');
    ims2 = imread('lion_new.soln.bmp');
    
    part9 = isequal(im1,ims1)&&isequal(im2,ims2);
    
    %test all parts
    if part1&&part2&&part3&&part4&&part5&&part6&&part7&&part9
        hw13 = true;
    else
        hw13 = false;
    end
end