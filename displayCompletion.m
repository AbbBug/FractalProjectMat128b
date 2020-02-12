function linelength = displayCompletion(completion, previousLine)
    for i = 1:previousLine,
        fprintf("\b");
    end;
    linelength = 0;
    if completion < 10,
        linelength = linelength + fprintf("0%g%%: ",completion);
    else,
        linelength = linelength + fprintf("%g%%: ",completion);
    end;
    linelength = linelength + fprintf("|");
    for c=1:100,
        if(completion >= c),
            fprintf("#");
        else,
            fprintf("-");
        end;
        linelength = linelength + 1;
    end;
    linelength = linelength + fprintf("|");
end