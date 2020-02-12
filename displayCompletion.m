function linelength = displayCompletion(completion, previousLine)
    output = '';
    linelength = 0;
    if completion < 10,
        output = append(output, num2str(completion), "%: ");
    else,
        output = append(output, num2str(completion), "%: ");
    end;
%{
output = append(output, "|");
    for c=1:100,
        if(completion >= c),
             output = append(output, "#");
        else,
            output = append(output, "-");
        end;
        linelength = linelength + 1;
    end; 
    output = append(output, "|");
    %}
    for i = 1:previousLine,
        fprintf("\b");
    end;
    linelength = fprintf('%s', output);
end