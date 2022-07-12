function y = add_synth(f0, T, fs, profile_name)
    load(profile_name);
    N = length(A);
    i = 1;
    for t = 0:1/fs:T
        k = 1:N;
        y(i) = sum(A.*cos(2*pi*k*f0*t));
        env(i) = (1-exp(-80*t))*exp(-5*t);
        i = i + 1;
    end
    y = y.*env;
end