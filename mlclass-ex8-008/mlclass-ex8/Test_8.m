X = sin(magic(4));
X = X(:,1:3);
[mu sigma2] = estimateGaussian(X)
[epsilon F1] = selectThreshold([1 0 0 1 1]', [0.1 0.2 0.3 0.4 0.5]')
g = [ 4, 4, 5; 1, 5,6; 9,5,3]
r = [1 0 0; 0 1 0; 1 0 1]
k =  r.*g
params = [ 1:14 ] / 10;
Y = magic(4);
Y = Y(:,1:3);
R = [1 0 1; 1 1 1; 0 0 1; 1 1 0];
num_users = 3;
num_movies = 4;
num_features = 2;
lambda = 0;
[J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, num_features, lambda)
g(1,3)