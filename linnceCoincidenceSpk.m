function [CoincidenceRate, CoincidenceMaskRef, CoincidenceMaskComp] = linnceCoincidenceSpk(SpkTimeStamps_ref, SpkTimeStamps_comp, TimeWindow) 

% Developed by Sofia Falco and Vinícius Cota @ 04/10/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
%
% Inputs:
% SpkTimeStamps_ref = spike time stamps of the record channel A for example, used here for reference;
% SpkTimeStamps_comp = spike time stamps of the record channel B for example, used here for comparision;
% TimeWindow = time window chosen for coincidence analisys, in seconds;
%
% Outputs:
% CoincidenceRate = the coincidence rate calculated for spike coincidence, comparing channel A and B, in a temporal window choosed in TimeWindow;
% CoincidenceMaxRef = a mask created with the coincident times (positions in the vector of Time stamps) in the reference channel;
% CoincidenceMaxComp = a mask created with the coincident times (positions in the vector of Time stamps) in the comparision channel.

SpkTMax_after = SpkTimeStamps_ref + TimeWindow;
SpkTMax_before = SpkTimeStamps_ref - TimeWindow;
NumSpk_ref = length(SpkTimeStamps_ref);
NumSpk_comp = length(SpkTimeStamps_comp);

if NumSpk_ref > NumSpk_comp
    Spks = NumSpk_comp;
else
    Spks = NumSpk_ref;
end

CoincidenceMaskRef = zeros(1, NumSpk_ref);
CoincidenceMaskComp = zeros(1, NumSpk_comp);

for j = 1:Spks
    % First, finding the spike times in the comparison channel that are ahead of the time of the reference spike assessed, subtracted with TimeWindow seconds
    aux1 = find(SpkTimeStamps_comp > SpkTMax_before(j));
    % Second, finding the spike time (if there exists) that is before the time of the reference spike assessed, added with TimeWindow seconds
    aux2 = find(SpkTimeStamps_comp(aux1) < SpkTMax_after(j));
    
    if ~isempty(aux2)
        CoincidenceMaskRef(j) = 1;
        CoincidenceMaskComp(aux1(aux2)) = 1;
    end
end

NumCSpk = sum(CoincidenceMaskRef);                  
CoincidenceRate = 100*NumCSpk/NumSpk_ref;