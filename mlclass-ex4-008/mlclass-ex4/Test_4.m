y = [10;10;10;10;10;10;9;9;9;9;9;9;8;8;8;8;7;7;7;6;6;6;6];
train = [1,2,3,4,5,6,7,8,9,10];
f = ones(10,10)
f = repmat(train,size(y,1),1);
for i = 1:9
    y = [zeros(size(y,1),1) y];
end
for i = 1:size(y,1)
    y(i,:) = y(i,10);
end
g = [y == f];


num_labels = 4;
nn_params = [ 1:18 ] / 10;
X = cos([1  2 ; 3  4 ; 5  6]);
y = [4; 2; 3];
train = ones(1,num_labels);
for i = 1:num_labels
    train(i)=i
end
f = repmat(train,size(y,1),1);
Y = zeros(size(y,1), num_labels);
size(Y)
for i = 1:size(y,1)
    Y(i,:) = y(i);
end
size(Y)
size(f)
g = [Y== f];


input_layer_size = 2;
hidden_layer_size = 2;
num_labels = 4;
nn_params = [ 1:18 ] / 10;
X = cos([1  2 ; 3  4 ; 5  6]);
y = [4; 2; 3];
lambda = 3;
%nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

input_layer_size = 2;
hidden_layer_size = 2;
num_labels = 4;
nn_params = [ 1:18 ] / 10;
X = cos([1  2 ; 3  4 ; 5  6]);
y = [4; 2; 3];
lambda = 4;
%nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)


sigmoidGradient(1)
size(sigmoidGradient(X))
X
row = zeros(1,size(X,2))
X = [row;X]
input_layer_size = 2;
hidden_layer_size = 2;
num_labels = 4;
nn_params = [ 1:18 ] / 10;
X = cos([1  2 ; 3  4 ; 5  6]);
y = [4; 2; 3];
lambda = 0;
[J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)

Theta2  = [1 3 2 5 4 5 8; 6 6 7 8 4 6 7]
Theta1  = [1 3; 2 , 5; 4 5; 6 6; 7 8; 4 6]
thetaVec = [Theta1(:) ; Theta2(:)]

input_layer_size = 2;
hidden_layer_size = 2;
num_labels = 4;
nn_params = [ 1:18 ] / 10;
X = cos([1  2 ; 3  4 ; 5  6]);
y = [4; 2; 3];
lambda = 3;
[J grad] = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda)