function [a,G] = lpcs_total(X,p)
    a = zeros(p+1, size(X, 2));
    G = zeros(size(X, 2),1);
    for i = 1:size(X, 2)
        [a(:, i), G(i)] = lpc_new(X(:,i), p); % X(:,i) is a frame of X 
    end
end