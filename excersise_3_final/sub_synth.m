function y = sub_synth(f0, T,osc_type1,fc1,osc_type2,fc2,fs)
    
    t = 0:1/fs:T;
    T0 = 1/f0;
    
    if osc_type1 == "rect"
        x1 = square(2*pi*f0*t);
    elseif osc_type1 == "triangle"
        x1 = sawtooth(2*pi*f0*t, 0.5);
    elseif osc_type1 == "sawtooth"
        x1 = sawtooth(2*pi*f0*t);
    end
    
    if osc_type2 == "rect"
        x2 = square(2*pi*f0*t);
    elseif osc_type2 == "triangle"
        x2 = sawtooth(2*pi*f0*t, 0.5);
    elseif osc_type2 == "sawtooth"
        x2 = sawtooth(2*pi*f0*t);
    end
    
    Q = 1/sqrt(2);
    k1=k_func(fc1,fs);
    k2=k_func(fc2,fs);
    
    par1=k1^2*Q+k1+Q;
    par2=k2^2*Q+k2+Q;
   
    b0_1=(k1^2*Q)/par1;
    b1_1=(2*k1^2*Q)/par1;
    b2_1=(k1^2*Q)/par1;
    a1_1=(2*Q)*(k1^2-1)/par1;
    a2_1=(k1^2*Q-k1+Q)/par1;
   
    b0_2=(k2^2*Q)/par2;
    b1_2=(2*k2^2*Q)/par2;
    b2_2=(k2^2*Q)/par2;
    a1_2=(2*Q)*(k2^2-1)/par2;
    a2_2=(k2^2*Q-k2+Q)/par2;
   
    y1 = filter([b0_1  b1_1  b2_1], [1 a1_1 a2_1], x1);
    y2 = filter([b0_2  b1_2  b2_2], [1 a1_2 a2_2], x2);
    
    y = y1 + y2;
    i=1;
    for t = 0:1/fs:T
        env(i) = (1-exp(-80*t))*exp(-5*t);
        i=i+1;
    end
    y = y.*env;
end