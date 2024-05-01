function [FilteredRecord] = linnceBandPassFilterFIR(RawRecord, AllSf)
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

n_window = 200; % Size of the window is choosed here
filter_FIR = fir1(n_window, [cf_low_norm cf_high_norm], hanning(n_window+1)); % Creating the finity filter (band pass digital FIR filter)
FilteredRecord = filtfilt(filter_FIR,1, RawRecord); % Filtering the raw record