for i = 1 : m
    for k = 1: num_labels
        J = J + sum(-Y_logical(i,k)'*log(a_3(i,k)) - (1 -Y_logical(i,k))'*log(1 - a_3(i,k)))/m;
        
    end
end