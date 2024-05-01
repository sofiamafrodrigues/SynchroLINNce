function [CTMax_ref, CMax_ref, CTMax_comp, CMax_comp, NTMax_ref, NMax_ref, NTMax_comp, NMax_comp] = linnceDataCoincidenceSpk(CoincidenceMaskRef, ...
    CoincidenceMaskComp, SpkTimeStamps_ref, SpkMaxStamps_ref, SpkTimeStamps_comp, SpkMaxStamps_comp) 

% Developed by Sofia Falco and Vinícius Cota @ 04/10/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
%
% Inputs:
% SpkTimeStamps_ref = spike time stamps of the record channel A for example, used here for reference;
% SpkTimeStamps_comp = spike time stamps of the record channel B for example, used here for comparision;
% SpkMaxStamps_ref = spike maximum stamps of the record channel A for example, used here for reference;
% SpkMaxStamps_comp = spike maximum stamps of the record channel B for example, used here for comparision;
% CoincidenceMaskRef = mask of the correspondent indexes of the coincident spikes in the referece channel;
% CoincidenceMaskComp = mask of the correspondent indexes of the coincident spikes in the comparision channel;
%
% Outputs:
% CTMax_ref = coincident spike time stamps of reference channel;
% CMax_ref = coincident spike maximum stamps of reference channel;
% CTMax_comp = coincident spike time stamps of comparation channel;
% CMax_comp = coincident spike maximum stamps of comparation channel;
% NTMax_ref = not coincident spike time stamps of reference channel;
% NMax_ref = not coincident spike maximum stamps of reference channel;
% NTMax_comp = not coincident spike time stamps of comparation channel;
% NMax_comp = not coincident spike maximum stamps of comparation channel;
%
%==========================================================================
%==========================================================================

count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;

CTMax_ref = zeros(1,sum(CoincidenceMaskRef));
CMax_ref = zeros(1,sum(CoincidenceMaskRef));
CTMax_comp = zeros(1,sum(CoincidenceMaskRef));
CMax_comp = zeros(1,sum(CoincidenceMaskRef));
NTMax_ref = zeros(1,length(CoincidenceMaskRef)-sum(CoincidenceMaskRef));
NMax_ref = zeros(1,length(CoincidenceMaskRef)-sum(CoincidenceMaskRef));
NTMax_comp = zeros(1,length(CoincidenceMaskRef)-sum(CoincidenceMaskRef));
NMax_comp = zeros(1,length(CoincidenceMaskRef)-sum(CoincidenceMaskRef));

for i = 1:length(CoincidenceMaskRef)
    if CoincidenceMaskRef(1,i) == 1 % Catching the coincident times and maximums in reference
        count1 = count1+1;
        CTMax_ref(count1) = SpkTimeStamps_ref(i);
        CMax_ref(count1) = SpkMaxStamps_ref(i);
    else
        count2 = count2+1; % Catching the not coincident times and maximums in reference
        NTMax_ref(count2) = SpkTimeStamps_ref(i);
        NMax_ref(count2) = SpkMaxStamps_ref(i);
    end
end
if count1 == 0
    CTMax_ref = [];
    CMax_ref = [];
end
if count2 == 0
    NTMax_ref = [];
    NMax_ref = [];
end

for j = 1:length(CoincidenceMaskComp)
    if CoincidenceMaskComp(1,j) == 1 % Catching the coincident times and maximums in comparision
        count3 = count3+1;
        CTMax_comp(count3) = SpkTimeStamps_comp(j);
        CMax_comp(count3) = SpkMaxStamps_comp(j);
    else
        count4 = count4+1; % Catching the not coincident times and maximums in comparision
        NTMax_comp(count4) = SpkTimeStamps_comp(j);
        NMax_comp(count4) = SpkMaxStamps_comp(j);
    end
end
if count3 == 0
    CTMax_comp = [];
    CMax_comp = [];
end
if count4 == 0
    NTMax_comp = [];
    NMax_comp = [];
end