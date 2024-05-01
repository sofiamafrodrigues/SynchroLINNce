function [SpkTimeStamps, SpkMaxStamps, SpkClips, SpkNumber, SpkFireRate, AvgSpkMaxStamps, MaxSpkMaxStamps, MinSpkMaxStamps, AvgDeltaT, MaxDeltaT, MinDeltaT] = linnceDetectSpk(RecordClip, AllSf, AllGain, ThresholdMax, DeltaTMin, AmpCutMin)

% Developed by Sofia Falco and Vinícius Cota @ 28/09/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
%
% Inputs:
% RecordClip = record clip to be analyzed;
% AllSf = sampling frequency;
% AllGain = AllGain used in acqusition;
% ThresholdMax = threshold of 0 to 1 for marking the spike, in relation to the maximum amplitude of a spike found in the window of 1 second (ex 0.6 (60%)); 
% DeltaTMin = time space between one spike and another, to avoid marking the same spike 2 times, due to possible variations in morphology (ex 0.1 (100 ms));
% AmpCutMin = minimum amplitude expected for the spike (ex 0.225 mV); - identified before the MIO onset, tested experimentally, to avoid some others ...
% errors in the detection.
%
% Output:
% SpkTimeStamps = time stamps of the spikes;
% SpkMaxStamps = the picks of amplitude of the spikes;
% SpkClips = patchs of the signal that correspond to each spike (80 ms);
% SpkNumber = number of found spikes on the analyzed record;
% SpkFireRate = firing average rate of the spikes;
% AvgSpkMaxStamps = average of the max spike stamps;
% MaxSpkMaxStamps = maximum of the max spike stamps;
% MinSpkMaxStamps = minimum of the max spike stamps;
% AvgDeltaT = average of the temporal distance between the spikes;
% MaxDeltaT = maximum of the temporal distance between the spikes;
% MinDeltaT = minimum of the temporal distance between the spikes.
%
%==========================================================================
%==========================================================================           

ThresholdMax = ThresholdMax/100; % Adjustment, because this variable is in percentage

size_clip = length(RecordClip);
count1 = 1;
count2 = 0;

foundUp = false;

Amp_ref(count1) = ThresholdMax*max(RecordClip(1:1000)); % The amplitude value, based in the chosen threshold
    
for j = 40:size_clip-40 % Analysing in the chosen time (saving 0.04 seconds for a spike in the first instant, to catch correctly its spike clip)

    % The threshold and the logical development were defined according with the idea of a typical spike-wave, view in the ictal activity: 
    % basal line -> signal increase -> positive pick -> signal decrease -> basal line 
    % The marking of the spike occours like this:
    % A percentage amplitude threshold is chosen and the maximum point is identified after the signal crosses this line
    
    if j < (size_clip-1000)
        if Amp_ref(count1) ~= ThresholdMax*max(RecordClip(j:j+999)) && ~foundUp
            count1 = count1+1;
            Amp_ref(count1) = ThresholdMax*max(RecordClip(j:j+999)); % The amplitude value, based in the chosen threshold
        end
    end
        
    if RecordClip(j+1) > Amp_ref(count1) && RecordClip(j) < Amp_ref(count1)
        p_start = j;
        foundUp = true;
    end
    
    if RecordClip(j+1) < Amp_ref(count1) && RecordClip(j) > Amp_ref(count1)
        foundUp = false;
        count2 = count2 + 1;
        p_end = j;

        % Marking the stamps of the spike
        % The pick of amplitude according with the found maximum in the 1-sec window and its occurring time
        SpkMaxStamps(count2) = max(RecordClip(p_start:p_end));
        SpkTimeStamps(count2) = (find(RecordClip(p_start:p_end) == SpkMaxStamps(count2))+p_start)/AllSf;

        % For corrections to the spike stamps: MaxStamp and TimeStamp
        if count2 > 1
            if SpkTimeStamps(count2) - SpkTimeStamps(count2-1) <= DeltaTMin
                if SpkMaxStamps(count2) > SpkMaxStamps(count2-1)
                    SpkMaxStamps(count2-1) = [];
                    SpkTimeStamps(count2-1) = [];
                    count2 = count2 - 1;
                else
                    SpkMaxStamps(count2) = [];
                    SpkTimeStamps(count2) = [];
                    count2 = count2 - 1;
                end
            end
        end
        if count2 > 1
            if SpkMaxStamps(count2) < AmpCutMin
                if SpkMaxStamps(count2) > SpkMaxStamps(count2-1)
                    SpkMaxStamps(count2-1) = [];
                    SpkTimeStamps(count2-1) = [];
                    count2 = count2 - 1;
                else
                    SpkMaxStamps(count2) = [];
                    SpkTimeStamps(count2) = [];
                    count2 = count2 - 1;
                end
            end
        end
%         clip = length(RecordClip((SpkTimeStamps(count2) - 0.04)*AllSf:(SpkTimeStamps(count2) + 0.039)*AllSf));
%         SpkClips(count2,1:clip) = RecordClip((SpkTimeStamps(count2) - 0.04)*AllSf:(SpkTimeStamps(count2) + 0.039)*AllSf);
        clip = 0.08*AllSf; % 80 ms of spike clip
        SpkClips(count2,1:clip) = RecordClip((SpkTimeStamps(count2)*AllSf) - clip/2:(SpkTimeStamps(count2)*AllSf) + (clip/2)-1);
    end
end   

SpkMaxStamps = SpkMaxStamps';
SpkMaxStamps = SpkMaxStamps/AllGain; % Adjustment with the AllGain
SpkTimeStamps = SpkTimeStamps';

SpkFireRate = 1/mean(diff(SpkTimeStamps));
SpkNumber = count2;
AvgSpkMaxStamps = mean(SpkMaxStamps);
MaxSpkMaxStamps = max(SpkMaxStamps);
MinSpkMaxStamps = min(SpkMaxStamps);
AvgDeltaT = mean(diff(SpkTimeStamps));
MaxDeltaT = max(diff(SpkTimeStamps));
MinDeltaT = min(diff(SpkTimeStamps));
