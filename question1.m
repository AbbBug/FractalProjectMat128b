% This is the code for question number 1. This code is slow
iterations = 100; % length of time you want to take.
left = -1.8;
right = 1.8;
bottom = -1.8;
top = 1.8;
xRes = 1000;
yRes = 1000;
c = 0;
M = filledJulia(iterations,left,right,bottom,top,xRes,yRes, c);
image([left right], [bottom top], M),
axis xy