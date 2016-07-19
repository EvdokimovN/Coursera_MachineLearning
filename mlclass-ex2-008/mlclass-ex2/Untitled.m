data = load('ex2data2.txt');
X = data(:, [1, 2]); y = data(:, 3);
sigmoid(0)
z = [1, 2, 3; 1, 2 ,3;5, 6,7;1 , 4, 6]
1/2
g = 1./exp(z)
f = sigmoid(z)
y = [3; 4; 5;6]
t = [1;1;1]
log(f)
1 - f
size(log(1 - sigmoid(z)))
size(1 - y)
t'*z'
(1-y)'*log(1-sigmoid(z))
H = (theta'*X')';
m = size(z,1)
p = zeros(m,1)
size(((sigmoid(H) - y)'*X)./m)