function linnceViewCoincidenceSpk(SubjTag, Channel_ref, Channel_comp, RecordClip_ref, RecordClip_comp, Sf_ref, Sf_comp, CTMax_ref, CMax_ref, NTMax_ref, ...
    NMax_ref, CTMax_comp, CMax_comp, NTMax_comp, NMax_comp, Gain_ref, Gain_comp, TimeWindow, CoincidenceRate)
% Developed by Sofia Falco and Vinícius Cota @ 04/10/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
% Inputs:
% SubjTag = identification of the subject in the experiment;
% Channel_ref = identification of the reference channel;
% Channel_comp = identification of the Comparison channel;
% RecordClip_ref = analyzed clip of record channel A for example, used here for reference;
% RecordClip_comp = analyzed clip of record channel B for example, used here for comparation;
% Sf_ref = sampling frequency of reference channel;
% Sf_comp = sampling frequency of comparation channel;
% CTMax_ref = coincident spike time stamps of reference channel;
% CMax_ref = coincident spike maximum stamps of reference channel;
% CTMax_comp = coincident spike time stamps of comparation channel;
% CMax_comp = coincident spike maximum stamps of comparation channel;
% NTMax_ref = not coincident spike time stamps of reference channel;
% NMax_ref = not coincident spike maximum stamps of reference channel;
% NTMax_comp = not coincident spike time stamps of comparation channel;
% NMax_comp = not coincident spike maximum stamps of comparation channel;
% Gain_ref = gain of the acquisition;
% Gain_comp = gain of the acquisition;
% TimeWindow = temporal window choosed for analysis;
% CoincidenceRate = coincidence rate between this channels.
%
%==========================================================================
%==========================================================================

ts_ref = 1/Sf_ref:1/Sf_ref:length(RecordClip_ref)/Sf_ref;
ts_comp = 1/Sf_comp:1/Sf_comp:length(RecordClip_comp)/Sf_comp;
RecordClip_ref = (RecordClip_ref/Gain_ref)*1000;
RecordClip_comp = (RecordClip_comp/Gain_comp)*1000;
figure;
plot(ts_ref,RecordClip_ref,'b'); hold on;
plot(ts_comp,RecordClip_comp,'k'); hold on;
if ~isempty(NTMax_ref)
%     NMax_ref = (NMax_ref/Gain_ref)*1000;
    NMax_ref = NMax_ref*1000;
    plot(NTMax_ref,NMax_ref,'*r'); hold on;
end
if ~isempty(NTMax_comp)
%     NMax_comp = (NMax_comp/Gain_comp)*1000;
    NMax_comp = NMax_comp*1000;
    plot(NTMax_comp,NMax_comp,'*m'); hold on;
end
if ~isempty(CTMax_ref) && ~isempty(CTMax_comp)
%     CMax_ref = (CMax_ref/Gain_ref)*1000;
%     CMax_comp = (CMax_comp/Gain_comp)*1000;
    CMax_ref = CMax_ref*1000;
    CMax_comp = CMax_comp*1000;
    plot(CTMax_ref,CMax_ref,'*g'); hold on;
    plot(CTMax_comp,CMax_comp,'*g'); hold on;
end

if ~isempty(NTMax_ref) && ~isempty(NTMax_comp) && ~isempty(CTMax_ref) && ~isempty(CTMax_comp)
    legend(sprintf('Reference channel: %s', Channel_ref), sprintf('Comparison channel: %s', Channel_comp), 'Max stamps - reference', ...
        'Max stamps - Comparison', 'Coincident max stamps', 'Location', 'Northwest'); hold off;
end

if isempty(NTMax_ref) && isempty(NTMax_comp) && ~isempty(CTMax_ref) && ~isempty(CTMax_comp)
    legend(sprintf('Reference channel: %s', Channel_ref), sprintf('Comparison channel: %s', Channel_comp), 'Coincident max stamps', 'Location', ...
        'Northwest'); hold off;
end

if ~isempty(NTMax_ref) && ~isempty(NTMax_comp) && isempty(CTMax_ref) && isempty(CTMax_comp)
    legend(sprintf('Reference channel: %s', Channel_ref), sprintf('Comparison channel: %s', Channel_comp), 'Max stamps - reference', ...
        'Max stamps - Comparison', 'Location', 'Northwest'); hold off;
end

if isempty(NTMax_ref) && ~isempty(NTMax_comp) && isempty(CTMax_ref) && isempty(CTMax_comp)
    legend(sprintf('Reference channel: %s', Channel_ref), sprintf('Comparison channel: %s', Channel_comp), 'Max stamps - Comparison', 'Location', ...
        'Northwest'); hold off;
end

if ~isempty(NTMax_ref) && isempty(NTMax_comp) && isempty(CTMax_ref) && isempty(CTMax_comp)
    legend(sprintf('Reference channel: %s', Channel_ref), sprintf('Comparison channel: %s', Channel_comp), 'Max stamps - reference', 'Location', ...
        'Northwest'); hold off;
end

Percent = '%';
TimeWindowString1 = num2str(TimeWindow);
TimeWindowString = strrep(TimeWindowString1,'.',',');
% TimeWindowString = cellstr(TimeWindowString);
note = sprintf('Coincidence rate = %s %s', num2str(CoincidenceRate), Percent);
text(max(ts_ref)-5,min(RecordClip_ref)+0.1,note);
xlabel('Time (s)'); ylabel('Amplitude (mV)');
title(sprintf('Spike coincidence in %.4f s window - %s - %s and %s', TimeWindow, SubjTag, Channel_ref, Channel_comp));
saveas(gcf, sprintf('Spike coincidence %s window - %s - %s and %s', TimeWindowString, SubjTag, Channel_ref, Channel_comp));
saveas(gcf, sprintf('Spike coincidence %s window - %s - %s and %s', TimeWindowString, SubjTag, Channel_ref, Channel_comp), 'tif');