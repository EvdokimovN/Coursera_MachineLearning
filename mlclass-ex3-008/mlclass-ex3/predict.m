function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
z_2 = zeros(size(Theta1,1), size(X,1));
a_2 = zeros(size(z_2));
z_3 = zeros(size(Theta2,1),size(X,1));
a_3 = zeros(size(z_3));

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
X = [ones(m, 1) X];
z_2 = Theta1*X';
a_2 = sigmoid(z_2)';

a_2 = [ones(m, 1) a_2];

z_3 = Theta2*a_2';
a_3 = sigmoid(z_3)';

M = (max(a_3,[],2));

for x = 1:size(a_3,1)
[row,column] = find(a_3(x,:) == M(x));
p(x) = column;
end
p;

 







% =========================================================================


end
