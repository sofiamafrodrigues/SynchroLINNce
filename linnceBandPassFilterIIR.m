function [FilteredRecord] = linnceBandPassFilterIIR(RawRecord, AllSf)
%
% Developed by Sofia Falco and Vinícius Cota @ 09/10/2018
% LINNce - LaboSubjTagório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
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