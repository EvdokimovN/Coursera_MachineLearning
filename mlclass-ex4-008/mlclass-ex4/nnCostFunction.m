function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
Y = zeros(size(y,1), num_labels); %init logic matrix


% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Making logical matrix to use in cost function
train_vector = ones(1,num_labels);
for i = 1:num_labels
    train_vector(i)=i;
end
train = repmat(train_vector,size(y,1),1);

for i = 1:size(y,1)
    Y(i,:) = y(i);
end
Y_logical = [Y == train];
%-------------------------------------------------

% FeedForward-----------------Init--------------------------

S = 0;
z_2 = zeros(size(Theta1,1), size(X,1));% in our example 25x5000 (X = [5000x400])
a_2 = zeros(size(z_2));
z_3 = zeros(size(Theta2,1),size(X,1));% in our example 10x5000
a_3 = zeros(size(z_3)); % 10x5000

X = [ones(m, 1) X];

% FeedForward-----------------------------------------------
z_2 = Theta1*X';
a_2 = sigmoid(z_2');

a_2 = [ones(m, 1) a_2];

z_3 = Theta2*a_2';
a_3 = sigmoid(z_3');
Theta1_reg = Theta1(:,2:size(Theta1,2));

Theta2_reg = Theta2(:,2:size(Theta2,2));

J = (sum(sum(-Y_logical.*log(a_3) - (1 - Y_logical).*log(1 - a_3))))/m;
Reg  = (lambda/(2*m))*(sum(sum(Theta1_reg.^2))+ sum(sum(Theta2_reg.^2)));
Reg = sum(sum([zeros(size(Reg,1),1) Reg]));
J = J + Reg;

% BackPropogation------------------------------------------------
sigma_3 = (a_3 - Y_logical);

Theta1_new = Theta1(:,2:size(Theta1,2));
Theta2_new = Theta2(:,2:size(Theta2,2));
sigma_2 = (Theta2_new' * sigma_3').*sigmoidGradient(z_2);

acc_1 = sigma_2*(X); 
acc_2 = sigma_3'*(a_2);
Theta1_reg = Theta1(:,:);
Theta2_reg = Theta2(:,:);
for i = 1:size(Theta1,1)
Theta1_reg(i,1) = 0;
end
for i = 1:size(Theta2,1)
Theta2_reg(i,1) = 0;
end


Theta1_grad = acc_1/m + (lambda/m)*Theta1_reg;
Theta2_grad = acc_2/m + (lambda/m)*Theta2_reg;


%s_2_size =size(sigma_2)
%z_2_size =size(z_2)


%grad_size = size(sigmoidGradient(z_2))
%acc_1_size = size(acc_1)
%s_2_size
%X_size = size(X)
%acc_2_size = size(acc_2)
%s_3_size = size(sigma_3)
%a_2_size = size(a_2)






% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
