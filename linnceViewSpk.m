function linnceViewSpk(SpkClips, SubjTag, TagChannel, AllSf, AllGain, ThresholdMax)

% Developed by Sofia Falco and Vinícius Cota @ 02/10/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
%
% Inputs:
% SpkClips = patchs of the signal that correspond to each spike (80 ms);
% SubjTag = subject tag for identification in the experiment data;
% TagChannel = identification of the record channel;
% AllSf = sampling frequency;
% AllGain = Gain of the acquisition;
% ThresholdMax = threshold of the maximum amplitude in SpkDetection.

SpkClips = SpkClips/AllGain; % Adjustment with the Gain

Percent = '%';

[NumSpk, Clip] = size(SpkClips);
SpkClips = SpkClips*1000; % Adjustment to plot in mV
ts = 1/AllSf:1/AllSf:Clip/AllSf;
figure;
for a = 1:NumSpk
    plot(ts,SpkClips(a,:)); hold on; % To plot spikes overlapping
end
xlabel('Time (s)'); ylabel('Amplitude (mV)');
title(sprintf('Superposition of spike activity - %d %s of threshold - %s - %s', ThresholdMax, Percent, SubjTag, TagChannel));
saveas(gcf, sprintf('Superposition of spike activity - %s - %s', SubjTag, TagChannel));
saveas(gcf, sprintf('Superposition of spike activity - %s - %s', SubjTag, TagChannel), 'tif');

y = mean(SpkClips);
x = 1/AllSf:1/AllSf:Clip/AllSf;
err = std(y);
xconf = [x x(end:-1:1)] ;         
yconf = [y+err y(end:-1:1)-err];
figure;
p = fill(xconf,yconf,'red'); p.FaceColor = [0.7 0.7 0.7]; p.EdgeColor = 'none'; hold on;
plot(x,y,'k','LineWidth',1.5); hold on; % To plot the average spike with the standard deviation
xlabel('Time (s)'); ylabel('Amplitude (mV)');
title(sprintf('Average and standard deviation of spike activity - %d %s of threshold - %s - %s', ThresholdMax, Percent, SubjTag, TagChannel));
saveas(gcf, sprintf('Average and standard deviation of spike activity - %s - %s', SubjTag, TagChannel));
saveas(gcf, sprintf('Average and standard deviation of spike activity - %s - %s', SubjTag, TagChannel), 'tif');