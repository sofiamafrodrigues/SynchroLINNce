function linnceViewSpkSlopeMorpho(SubjTag, ChannelTag, SpkClip, AmpUp, AmpDown, AmpAvg, AllSf, AllGain)
%
% Developed by Sofia Falco and Vinícius Cota @ 05/10/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
% Input:
% SubjTag = identification of the subject, in the experiment;
% ChannelTag = channel identification;
% SpkClip = the spike clip, with 80 ms;
% AmpUp = amplitude peak calculated based on the rising slope;
% AmpDown = amplitude peak calculated based on the dropping slope;
% AmpAvg = average amplitude, based on the slope;
% AllSf = sampling frequency;
% AllGain = gain of the record, used in acquisition.

SpkClip = SpkClip/AllGain; % Adjustment with the gain
ts = 1/AllSf:1/AllSf:length(SpkClip)/AllSf;
SpkClip = SpkClip*1000; % Adjustment to plot in mV
AmpUp = AmpUp*1000;
AmpDown = AmpDown*1000;
AmpAvg = AmpAvg*1000;
peakPoint = (length(SpkClip)/2);
figure;
plot(ts, SpkClip, 'k'); hold on;
plot(ts(peakPoint),SpkClip(peakPoint),'*r');
xlabel('Time (s)'); ylabel('Amplitude (mV)'); 
note1 = sprintf('AmpUp = %.2f', AmpUp);
note2 = sprintf('AmpAvg = %.2f', AmpAvg);
note3 = sprintf('AmpDown = %.2f', AmpDown);
text(ts(peakPoint-2)+0.001,SpkClip(peakPoint-2),note1);
text(ts(peakPoint-2)+0.001,SpkClip(peakPoint-2)-0.04,note2);
text(ts(peakPoint-2)+0.001,SpkClip(peakPoint-2)-0.07,note3);
title(sprintf('Morphology analysis - %s - %s', SubjTag, ChannelTag));
saveas(gcf, sprintf('Morphology analysis - %s - %s', SubjTag, ChannelTag));
saveas(gcf, sprintf('Morphology analysis - %s - %s', SubjTag, ChannelTag), 'tif');