X = [magic(3) ; sin(1:3); cos(1:3)];
y = [1; 2; 2; 1; 3];
num_labels = 3;
lambda = 0.1;
%[all_theta] = oneVsAll(X, y, num_labels, lambda)

M = (max(X,[],2))
for x = 1:5
[row,column] = find(X == M(x))
L(x) = column
end

all_theta = [1 -6 3 2; -2 4 -3 2];
X = [1 7 3; 4 5 3;  8 5 1;  4 2 1];
predictOneVsAll(all_theta, X)






