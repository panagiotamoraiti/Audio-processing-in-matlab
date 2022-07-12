function [] = voice_recognition3(a1,a2,a3,a4,voice)

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
        
        distances1 = [euc_dist1_1; euc_dist2_1];
        distances2 = [euc_dist3_1; euc_dist4_1];
        
    elseif voice == 2
        euc_dist1_2 = sqrt(sum((avg1-a2(:,301:385)).^2));
        euc_dist2_2 = sqrt(sum((avg2-a2(:,301:385)).^2));
        euc_dist3_2 = sqrt(sum((avg3-a2(:,301:385)).^2));
        euc_dist4_2 = sqrt(sum((avg4-a2(:,301:385)).^2));
        
        distances1 = [euc_dist1_2; euc_dist2_2];      
        distances2 = [euc_dist3_2; euc_dist4_2];
        
    elseif voice == 3
        euc_dist1_3 = sqrt(sum((avg1-a3(:,301:385)).^2));
        euc_dist2_3 = sqrt(sum((avg2-a3(:,301:385)).^2));
        euc_dist3_3 = sqrt(sum((avg3-a3(:,301:385)).^2));
        euc_dist4_3 = sqrt(sum((avg4-a3(:,301:385)).^2));
        
        distances1 = [euc_dist1_3; euc_dist2_3];
        distances2 = [euc_dist3_3; euc_dist4_3];

        
    elseif voice == 4
        euc_dist1_4 = sqrt(sum((avg1-a4(:,301:385)).^2));
        euc_dist2_4 = sqrt(sum((avg2-a4(:,301:385)).^2));
        euc_dist3_4 = sqrt(sum((avg3-a4(:,301:385)).^2));
        euc_dist4_4 = sqrt(sum((avg4-a4(:,301:385)).^2));
        
        D1 = {euc_dist1_4, euc_dist2_4};
        distances1 = cat(1,D1{:});
        
        D2 = {euc_dist3_4, euc_dist4_4};
        distances2 = cat(1,D2{:});
    end
    
    [m1, pos1] = min(distances1);
    [m2, pos2] = min(distances2);
    
    number_of_speakers = 2;
    min_positions1 = zeros(number_of_speakers, 1);
    min_positions2 = zeros(number_of_speakers, 1);
    for i = 1:number_of_speakers
        min_positions1(i) = sum(pos1 == i);
        min_positions2(i) = sum(pos2 == i);
    end
    
    [m3, max_speaker1] = max(min_positions1);
    [m3, max_speaker2] = max(min_positions2);
%   ---------------------------------------------------------------------------- 
    
    if voice == 1
        z = NaN(size(euc_dist1_1));
        if max_speaker1 == 1 && max_speaker2 == 1
            distances1 = [euc_dist1_1; z; euc_dist3_1; z];
        elseif max_speaker1 == 1 && max_speaker2 == 2
            distances1 = [euc_dist1_1; z; z; euc_dist4_1];
        elseif max_speaker1 == 2 && max_speaker2 == 1
            distances1 = [z; euc_dist2_1; euc_dist3_1; z];
        elseif max_speaker1 == 2 && max_speaker2 == 2
            distances1 = [z; euc_dist2_1; z; euc_dist4_1];
        end

    elseif voice == 2
        z = NaN(size(euc_dist1_2));
        if max_speaker1 == 1 && max_speaker2 == 1
            distances1 = [euc_dist1_2; z; euc_dist3_2; z];
        elseif max_speaker1 == 1 && max_speaker2 == 2
            distances1 = [euc_dist1_2; z; z; euc_dist4_2];
        elseif max_speaker1 == 2 && max_speaker2 == 1
            distances1 = [z; euc_dist2_2; euc_dist3_2; z];
        elseif max_speaker1 == 2 && max_speaker2 == 2
            distances1 = [z; euc_dist2_2; z; euc_dist4_2];
        end
        
    elseif voice == 3
        z = NaN(size(euc_dist1_3));
        if max_speaker1 == 1 && max_speaker2 == 1
            distances1 = [euc_dist1_3; z; euc_dist3_3; z];
        elseif max_speaker1 == 1 && max_speaker2 == 2
            distances1 = [euc_dist1_3; z; z; euc_dist4_3];
        elseif max_speaker1 == 2 && max_speaker2 == 1
            distances1 = [z; euc_dist2_3; euc_dist3_3; z];
        elseif max_speaker1 == 2 && max_speaker2 == 2
            distances1 = [z; euc_dist2_3; z; euc_dist4_3];
        end
        
    elseif voice == 4
        z = NaN(size(euc_dist1_4));
        if max_speaker1 == 1 && max_speaker2 == 1
            distances1 = [euc_dist1_4; z; euc_dist3_4; z];
        elseif max_speaker1 == 1 && max_speaker2 == 2
            distances1 = [euc_dist1_4; z; z; euc_dist4_4];
        elseif max_speaker1 == 2 && max_speaker2 == 1
            distances1 = [z; euc_dist2_4; euc_dist3_4; z];
        elseif max_speaker1 == 2 && max_speaker2 == 2
            distances1 = [z; euc_dist2_4; z; euc_dist4_4];
        end
    end
    
    [m1, pos] = min(distances1);
    
    number_of_speakers = 4;
    min_positions = zeros(number_of_speakers, 1);
    
    for i = max_speaker1
        min_positions(i) = sum(pos == i);
    end
    
    if max_speaker2 == 1
        max_speaker2 = 3;
    elseif max_speaker2 == 2
        max_speaker2 = 4;
    end
    
    for i = max_speaker2
        min_positions(i) = sum(pos == i);
    end
    
    [m2, max_speaker] = max(min_positions);
    
    fprintf('The voice %d belongs to the speaker %d\n', voice, max_speaker);
