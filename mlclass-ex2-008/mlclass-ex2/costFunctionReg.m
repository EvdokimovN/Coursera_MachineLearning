function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
S = 0;
H = 0;
F = 0;
T = 0;
g = 0;
L = 0;
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
g = theta(2:size(theta),1);
H = (theta'*X')';
theta(1) = 0;
S = sum(-y'*log(sigmoid(H)) - (1 - y)'*log(1 - sigmoid(H)));
T = sum(g.^2);
J = S/m + (lambda*T)/(2*m);
L = (lambda*theta)./m;
grad = (((sigmoid(H) - y)'*X))./m + L' ;




% =============================================================

end
