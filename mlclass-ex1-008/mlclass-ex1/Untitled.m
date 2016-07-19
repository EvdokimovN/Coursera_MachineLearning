h = zeros(10,1)
H = 0

x = [11 2; 21 3; 12 89; 3 4]
theta = [2;2]
H = (theta'*x')'
y = [6 ;4 ;3;1]
S = sum((H - y) .^ 2)
J = H - y


E = sum(J' * x)
G = x([1:4],2)
F =((theta'*x')'-y)
L = sum(F' * G)
mu = zeros(1, size(x, 2))
g = size(x)
g(1)
mean(x([1:4],2))
((x([1:4],2)) - mean(x([1:4],2)))/std((x([1:4],2)))

x = [11 2; 21 3; 12 89; 3 4]
g = size(x)
mean(x(:,1))
std(x(:,1))
(x(1,1) - mean(x(:,1)))/std(x(:,1))
(x(2,1) - mean(x(:,1)))/std(x(:,1))
x(2,1)
for i = 1:g(2)
    mu(1, i) = mean(x(:,i));
    sigma(1, i) = std(x(:,i));
    x(:,i) = ((x([1:g(1)],i)) - mean(x([1:g(1)],i)))/std((x([1:g(1)],i)));
end
x
S = []
S(1) = 4
S(2) = 5
S
S(1)
