function decision = ifOrSwitch(type)
%Decides which conditional to use: an if statement or a switch statement.
    string = lower(type);
    %Switch statement used because there are only 5 total cases.
    switch true
        case {strcmp(string,'discrete'), strcmp(string,'distinct'), strcmp(string,'many-to-one')}
            decision = sprintf('My data is %s, so I''ll try a switch statement.', string);
        case {strcmp(string,'range'), strcmp(string,'continuous')}
            decision = sprintf('My data is %s, so I''ll try an if statement.', string);
        otherwise
            decision = 'Unsure about my data. I''ll try an if statement.';
    end
end