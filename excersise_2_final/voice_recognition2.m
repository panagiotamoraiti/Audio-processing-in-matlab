function [] = voice_recognition2(a1,a2,a3,a4,voice)

    N =300;
    avg1 = (1/N).*(sum(a1(:,1:300),2));
    avg2 = (1/N).*(sum(a2(:,1:300),2));
    avg3 = (1/N).*(sum(a3(:,1:300),2));
    avg4 = (1/N).*(sum(a4(:,1:300),2));

    if voice == 1
        euc_dist1_1 = sqrt(sum((avg1-a1(:,301:385)).^2));
        euc_dist2_1 = sqrt(sum((avg2-a1(:,301:385)).^2));
        euc_dist3_1 = sqrt(sum((avg3-a1(:,301:385)).^2));
        euc_dist4_1 = sqrt(sum((avg4-a1(:,301:385)).^2));
        
        A = {euc_dist1_1, euc_dist2_1, euc_dist3_1, euc_dist4_1};
        distances = cat(1,A{:});
        
    elseif voice == 2
        euc_dist1_2 = sqrt(sum((avg1-a2(:,301:385)).^2));
        euc_dist2_2 = sqrt(sum((avg2-a2(:,301:385)).^2));
        euc_dist3_2 = sqrt(sum((avg3-a2(:,301:385)).^2));
        euc_dist4_2 = sqrt(sum((avg4-a2(:,301:385)).^2));
        
        B = {euc_dist1_2, euc_dist2_2, euc_dist3_2, euc_dist4_2};
        distances = cat(1,B{:});
        
    elseif voice == 3
        euc_dist1_3 = sqrt(sum((avg1-a3(:,301:385)).^2));
        euc_dist2_3 = sqrt(sum((avg2-a3(:,301:385)).^2));
        euc_dist3_3 = sqrt(sum((avg3-a3(:,301:385)).^2));
        euc_dist4_3 = sqrt(sum((avg4-a3(:,301:385)).^2));
        
        C = {euc_dist1_3, euc_dist2_3, euc_dist3_3, euc_dist4_3};
        distances = cat(1,C{:});
        
    elseif voice == 4
        euc_dist1_4 = sqrt(sum((avg1-a4(:,301:385)).^2));
        euc_dist2_4 = sqrt(sum((avg2-a4(:,301:385)).^2));
        euc_dist3_4 = sqrt(sum((avg3-a4(:,301:385)).^2));
        euc_dist4_4 = sqrt(sum((avg4-a4(:,301:385)).^2));
        
        D = {euc_dist1_4, euc_dist2_4, euc_dist3_4, euc_dist4_4};
        distances = cat(1,D{:});
    end
    
    [m1, pos] = min(distances);
    
    number_of_speakers = 4;
    min_positions = zeros(number_of_speakers, 1);
    for i = 1:number_of_speakers
        min_positions(i) = sum(pos == i);
    end
    
    [m2, max_speaker] = max(min_positions);
    
    fprintf('The voice %d belongs to the speaker %d\n', voice, max_speaker);

