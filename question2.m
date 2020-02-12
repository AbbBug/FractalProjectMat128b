% This is the code for question number 2. This code is slow
iterations = 100; % length of time you want to take.
left = -1.8;
right = 1.8;
bottom = -1.8;
top = 1.8;
xRes = 600;
yRes = 600;
f = 'z^2 -1.25';
M = filledJulia(iterations,left,right,bottom,top,xRes,yRes, f);
image([left right], [bottom top], M),
axis xy