function [] = voice_recognition_freq(m1,m2,f1,f2,voice,freq)
    frame = 256;
    ovrlp = 0.5;
    p = 30;
    M1=frame_wind(m1,frame, ovrlp);
    M2=frame_wind(m2,frame, ovrlp);
    F1=frame_wind(f1,frame, ovrlp);
    F2=frame_wind(f2,frame, ovrlp);

    for i = 1:size(M1,2)
        [a1(:,i),G1(i)] = lpc_new(M1(:,i),p);
    end

    for i = 1:size(M2,2)
        [a2(:,i),G2(i)] = lpc_new(M2(:,i),p);
    end

    for i = 1:size(F1,2)
        [a3(:,i),G3(i)] = lpc_new(F1(:,i),p);
    end

    for i = 1:size(M2,2)
        [a4(:,i),G4(i)] = lpc_new(F2(:,i),p);
    end

    N =300;
    avg1 = (1/N).*(sum(a1(:,1:300),2));
    avg2 = (1/N).*(sum(a2(:,1:300),2));
    avg3 = (1/N).*(sum(a3(:,1:300),2));
    avg4 = (1/N).*(sum(a4(:,1:300),2));

    %avg = [avg1,avg2,avg3,avg4]; 
    euc_dist3_3 = sqrt(sum((avg3-a3(:,301:385)).^2));
    euc_dist4_3 = sqrt(sum((avg4-a3(:,301:385)).^2));
    euc_dist4_4 = sqrt(sum((avg4-a4(:,301:385)).^2));
    euc_dist3_4 = sqrt(sum((avg3-a4(:,301:385)).^2));

    euc_dist1_1 = sqrt(sum((avg1-a1(:,301:385)).^2));
    euc_dist1_2 = sqrt(sum((avg1-a2(:,301:385)).^2));
    euc_dist2_1 = sqrt(sum((avg2-a1(:,301:385)).^2));
    euc_dist2_2 = sqrt(sum((avg2-a2(:,301:385)).^2));

    threshold = 165; 

    if freq > threshold
       if voice == 3
           if sum(euc_dist3_3<euc_dist4_3)>sum(euc_dist3_3>euc_dist4_3)
               speaker = 'Speaker3 (female1)';
           else
               speaker = 'Speaker4 (female2)';
           end

       elseif voice == 4
           if sum(euc_dist4_4<euc_dist3_4)>sum(euc_dist4_4>euc_dist3_4)
               speaker = 'Speaker4 (female2)';
           else
               speaker = 'Speaker3 (female1)';
           end
       end
    else 
        if voice == 1
           if sum(euc_dist1_1<euc_dist2_1)>sum(euc_dist1_1>euc_dist2_1)
               speaker = 'Speaker1 (male1)';
           else
               speaker = 'Speaker2 (male2)';
           end

       elseif voice == 2
           if sum(euc_dist2_2<euc_dist1_2)>sum(euc_dist2_2>euc_dist1_2)
               speaker = 'Speaker2 (male2)';
           else
               speaker = 'Speaker1 (male1)';
           end
       end
    end

    fprintf('The voice %d belongs to the %s\n', voice, speaker);

