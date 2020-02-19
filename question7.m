%question 7: Newton's Method on complex plane
iterations = 100;
left = -1.8;
right = 1.8;
bottom = -1.8;
top = 1.8;
xRes = 1000; %resolution has been decreased for speed processing
yRes = 1000;
n = 5; %user may change the degree of polynomial in the equation z^n -1 = 0
M = juliaNewton(iterations,left,right,bottom,top,xRes,yRes,n);
image([left, right], [bottom, top], M)
axis xy
