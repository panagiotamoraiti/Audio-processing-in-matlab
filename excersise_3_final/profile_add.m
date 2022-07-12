function song = profile_add(profile_name, T, fs)

    A4 = 440.00;
    C4 = 261.63;
    D4 = 293.66;
    E4 = 329.63;
    F4 = 349.23;
    G4 = 392.00;
    
    A = add_synth(A4, T, fs, profile_name);
    C = add_synth(C4, T, fs, profile_name);
    D = add_synth(D4, T, fs, profile_name);
    E = add_synth(E4, T, fs, profile_name);
    F = add_synth(F4, T, fs, profile_name);
    G = add_synth(G4, T, fs, profile_name);
    
    T1 = 2*T;
    G1 = add_synth(G4, T1, fs, profile_name);
    C1 = add_synth(C4, T1, fs, profile_name);

    song = [C, C, G, G, A, A, G1, F, F, E, E, D, D, C1];
end