function [] = voice_recognition(a1,a2,voice)

    N =300;
    avg1 = (1/N).*(sum(a1(:,1:300),2));
    avg2 = (1/N).*(sum(a2(:,1:300),2));

    if voice == 1 
        euc_dist1_1 = sqrt(sum((avg1-a1(:,301:385)).^2));
        euc_dist2_1 = sqrt(sum((avg2-a1(:,301:385)).^2));
        
        distances = [euc_dist1_1; euc_dist2_1];
    elseif voice == 2
        euc_dist1_2 = sqrt(sum((avg1-a2(:,301:385)).^2));
        euc_dist2_2 = sqrt(sum((avg2-a2(:,301:385)).^2));
        distances = [euc_dist1_2; euc_dist2_2];
    end

    [m1, pos] = min(distances);
    
    number_of_speakers = 2;
    min_positions = zeros(number_of_speakers, 1);
    for i = 1:number_of_speakers
        min_positions(i) = sum(pos == i);
    end
    
    [m2, max_speaker] = max(min_positions);
    
    fprintf('The voice %d belongs to the speaker %d\n', voice, max_speaker);

