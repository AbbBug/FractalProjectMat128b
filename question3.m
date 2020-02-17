% This is the code for question number 2. This code is slow
iterations = 100; % length of time you want to take.
left = -1.8;
right = 1.8;
bottom = -1.8;
top = 1.8;
points = 1000000;
c = - 0.8 + 0.1i;
[xss, yss] = julia(iterations,left,right,bottom,top,points, c);
scatter(xss,yss, 1, 'filled')
axis xy