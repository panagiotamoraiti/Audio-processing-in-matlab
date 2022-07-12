function e = calculate_error(X,a)
    frame = 256;
    e = zeros(frame, size(X, 2));
    for i = 1:size(X, 2)
        e(:,i) = filter(a(:,i),1,X(:,i));
    end
end