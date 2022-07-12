function [y1,y2] = voice_morphing(X1,X2)
    ovrlp = 0.25;
    
    [a1,G1] = lpcs_total(X1,20);
    [a2,G2] = lpcs_total(X2,20);

    e1 = calculate_error(X1,a1);
    e2 = calculate_error(X2,a2);

    Y1 = filter_func(X1,G2,a2,e1);
    y1 = frame_recon (Y1, ovrlp);

    Y2 = filter_func(X2,G1,a1,e2);
    y2 = frame_recon (Y2, ovrlp);
end