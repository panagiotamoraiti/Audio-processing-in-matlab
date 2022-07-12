function y1 = fm_synth(f0, T, Q, B, fs)
    fm = Q*f0;
    
    i = 1;
    for t = 0:1/fs:T
        if (t >= 0) && (t < 0.1*T)
            y(i) = 100*t^2;
        elseif (t >= 0.1*T) && (t < 0.95*T)
            y(i) = 1;
        elseif  (t >=0.95*T) && (t <= T) 
            y(i) = exp(-220.5*(t-0.95*T));
        end
        F2env(i) = exp(-10*t);
        y1(i) = y(i).*cos(2*pi*f0*t+B*F2env(i).*sin(2*pi*fm*t));
        i = i + 1;
    end
end