% This is the code for question number 6. This code is slow
iterations = 100; % length of time you want to take.
left = -1.8;
right = 1.8;
bottom = -1.8;
top = 1.8;
xRes = 5000;
yRes = 5000;
c = - 1.25;
cmapFunc = @(n)(fliplr(1-hot(n)));
colormap(cmapFunc(iterations));
M = ColoredJulia(iterations,left,right,bottom,top,xRes,yRes, c);
image([left right], [bottom top], M),
axis xy