function song = profile_sub(T, fs, osc_type1, fc1, osc_type2, fc2)

    A4 = 440.00;
    C4 = 261.63;
    D4 = 293.66;
    E4 = 329.63;
    F4 = 349.23;
    G4 = 392.00;
    
    A = sub_synth(A4, T, osc_type1, fc1, osc_type2, fc2, fs);
    C = sub_synth(C4, T, osc_type1, fc1, osc_type2, fc2, fs);
    D = sub_synth(D4, T, osc_type1, fc1, osc_type2, fc2, fs);
    E = sub_synth(E4, T, osc_type1, fc1, osc_type2, fc2, fs);
    F = sub_synth(F4, T, osc_type1, fc1, osc_type2, fc2, fs);
    G = sub_synth(G4, T, osc_type1, fc1, osc_type2, fc2, fs);
 
    G1 = sub_synth(G4, 2*T, osc_type1, fc1, osc_type2, fc2, fs);
    C1 = sub_synth(C4, 2*T, osc_type1, fc1, osc_type2, fc2, fs);

    song = [C, C, G, G, A, A, G1, F, F, E, E, D, D, C1];
end