f = [1,2;2,4;4,1;5,1;5,2;5,4;5,5;5,6]
J = linearRegCostFunction( [1 2; 1 3; 1 4; 1 5], [7;6;5;4], [0.1;0.2], 7 )
[J, grad] = linearRegCostFunction( [1 2; 1 3; 1 4; 1 5], [7;6;5;4], [0.1;0.2], 7 )
[error_train, error_val] = learningCurve( [1 2; 1 3; 1 4; 1 5], [7;6;5;4], [1 7; 1 -2;], [2; 12], 7 )
polyFeatures([1:3]', 4)
f_test = [1;4;3;2;6];
f = [f_test, f_test.^2]
f = [f, f_test.^3]
h = [1,1,1,1,-2,-2];
x = ones(1,100);
x(1)=0
x(2)=0
x(3)=0
x(4)=0
x(5)=0
conv(h,x)
[lambda_vec, error_train, error_val] = validationCurve( [1 2; 1 3; 1 4; 1 5], [7;6;5;4], [1 7; 1 -2;], [2; 12] )
