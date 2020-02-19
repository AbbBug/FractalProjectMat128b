% This is the code for question number 2. This code is slow
iterations = 100; % length of time you want to take.
left = -1.8;
right = 1.8;
bottom = -1.8;
top = 1.8;
points = 10000;
c = -1.25;
[xss, yss] = julia(iterations,left,right,bottom,top,points, c);
scatter(xss,yss, 1, 'filled')
axis xy
N = 0;
for i=1:2^(5),
    bottomBorder = bottom + (top-bottom)/(2^5)*(i-1);
    topBorder = bottom + (top-bottom)/(2^5)*(i);
    for j=1:2^(5),
        leftBorder = left + (right-left)/(2^5)*(j-1);
        rightBorder = left + (right-left)/(2^5)*(j);
        for k=1:points,
            x = xss(k);
            y = yss(k);
            if (leftBorder <= x && rightBorder >= x && bottomBorder <= y && topBorder >= y),
                N = N + 1;
                break;
            end;
        end;
    end;
end;
D = -log(1/N)/(5*log(2))