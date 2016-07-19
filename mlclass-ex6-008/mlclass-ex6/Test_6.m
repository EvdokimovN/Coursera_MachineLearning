f = [9,12; 23,15]
g = [1,4]

x1 = [3 2]; x2 = [-3 0]; sigma = 7;
sim = gaussianKernel(x1, x2, sigma)
size(f,2)
f(1,2)
min(min(f))

[row,column] = find(f(:,:) == 12);
l = 1
l(1)
a = find(g(:,:) == 3) 
a > 0
x = emailFeatures([1 2 4 4 3 6]');
x(1:7) 
f(2,:).^2