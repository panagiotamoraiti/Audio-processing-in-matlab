function Y = filter_func(X,G,a,e)
    frame = 256;
    Y = zeros(frame, size(X, 2));
    for i = 1:size(X, 2)
        Y(:,i) = filter(G(i),a(:,i),e(:,i));
    end
end