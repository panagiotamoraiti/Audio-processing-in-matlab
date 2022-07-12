function song = profile_fm(T, fs, Q, B)

    A4 = 440.00;
    C4 = 261.63;
    D4 = 293.66;
    E4 = 329.63;
    F4 = 349.23;
    G4 = 392.00;
    
    A = fm_synth(A4, T, Q, B, fs);
    C = fm_synth(C4, T, Q, B, fs);
    D = fm_synth(D4, T, Q, B, fs);
    E = fm_synth(E4, T, Q, B, fs);
    F = fm_synth(F4, T, Q, B, fs);
    G = fm_synth(G4, T, Q, B, fs);
 
    T1 = 2*T;
    G1 = fm_synth(G4, T1, Q, B, fs);
    C1 = fm_synth(C4, T1, Q, B, fs);

    song = [C, C, G, G, A, A, G1, F, F, E, E, D, D, C1];
end