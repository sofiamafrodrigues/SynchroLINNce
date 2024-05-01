function [FilteredRecord] = linnceBandPassFilterIIR(RawRecord, AllSf)
%
% Developed by Sofia Falco and Vin�cius Cota @ 09/10/2018
% LINNce - LaboSubjTag�rio Interdisciplinar de Neuroengenharia e Neuroci�ncias
% Programa de P�s-Gradua��o em Engenharia El�trica
% Universidade Federal de S�o Jo�o del-Rei - Minas Gerais - Brasil
%
% Output:
% FilteredRecord = the raw record after the digital filtering process;
%
% Input:
% RawRecord = the raw record choosed to be filtered;
% AllSf = sampling frequency;

cf_low = 10;
cf_high = 100;
cf_low_norm = cf_low/(AllSf/2); % Normalized by Nyquist frequency
cf_high_norm = cf_high/(AllSf/2); % Normalized by Nyquist frequency

IIR_type = 'bandpass'; % Type of the infinity filter choosed
n = 5; % Order
[b,a] = butter(n,[cf_low_norm cf_high_norm],IIR_type); % Creating the IIR filter (band pass digital filter, Butterworth) 
FilteredRecord = filtfilt(b,a,RawRecord); % Using the filter