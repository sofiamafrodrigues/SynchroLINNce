function linnceViewSpkDetected(SpkTimeStamps, SpkMaxStamps, RecordClip, SubjTag, TagChannel, AllSf, AllGain, ThresholdMax)
%
% Developed by Sofia Falco and Vin�cius Cota @ 28/09/2018
% LINNce - Laborat�rio Interdisciplinar de Neuroengenharia e Neuroci�ncias
% Programa de P�s-Gradua��o em Engenharia El�trica
% Universidade Federal de S�o Jo�o del-Rei - Minas Gerais - Brasil
%
% Inputs:
% SpkTimeStamp = time stamps of the spikes;
% SpkMaxStamp = the picks of amplitude of the spikes;
% RecordClip = record clip analyzed;
% AllSf = sampling frequency;
% AllGain = Gain of the acquisition;
% ThresholdMax = threshold of the maximum amplitude in SpkDetection.
%

Percent = '%';
figure;
RecordClip = RecordClip/AllGain; % Adjustment with the Gain
RecordClip = RecordClip*1000; % Adjustment to plot in mV
SpkMaxStamps = SpkMaxStamps*1000; % Adjustment to plot in mV
ts = 1/AllSf:1/AllSf:length(RecordClip)/AllSf;
plot(ts,RecordClip); hold on;
plot(SpkTimeStamps,SpkMaxStamps,'*m');
xlabel('Time (s)'); ylabel('Amplitude (mV)');
title(sprintf('Spike activity detected - %d %s of threshold - %s - %s', ThresholdMax, Percent, SubjTag, TagChannel));
saveas(gcf, sprintf('Spike activity detected - %s - %s', SubjTag, TagChannel));
saveas(gcf, sprintf('Spike activity detected - %s - %s', SubjTag, TagChannel), 'tif');