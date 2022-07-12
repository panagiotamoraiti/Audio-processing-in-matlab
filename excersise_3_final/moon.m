function song = moon(fs, T)
    t = 0:1/fs:T;
    t1 = 0:1/fs:2*T;

    A4 = 440.00;
    C4 = 261.63;
    D4 = 293.66;
    E4 = 329.63;
    F4 = 349.23;
    G4 = 392.00;

    A = sin(2*pi*A4*t);
    C = sin(2*pi*C4*t);
    D = sin(2*pi*D4*t);
    E = sin(2*pi*E4*t);
    F = sin(2*pi*F4*t);
    G = sin(2*pi*G4*t);
    
    G1 = sin(2*pi*G4*t1);
    C1 = sin(2*pi*C4*t1);

    song= [C, C, G, G, A, A, G1, F, F, E, E, D, D, C1];

end