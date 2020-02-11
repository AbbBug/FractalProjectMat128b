% This is the code for question number 2. This code is slow
iterations = 50; % length of time you want to take.
left = -1.8;
right = 1.8;
bottom = -1.8;
top = 1.8;
xRes = 300;
yRes = 300;
f = 'z^2 -0.123 - 0.745i';
M = filledJulia(iterations,left,right,bottom,top,xRes,yRes, f);
image([left right], [bottom top], M),
axis xy