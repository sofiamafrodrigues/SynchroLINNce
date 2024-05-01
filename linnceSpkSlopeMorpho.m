function [SpkSlope, SlopeUp, SlopeDown, AmpUp, AmpDown, AmpAvg] = linnceSpkSlopeMorpho(SpkClip, AllSf, AllGain)
%
% Developed by Sofia Falco and Vinícius Cota @ 27/09/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
% Input:
% SpkClip = the spike clip, with 80 ms;
% AllSf = sampling frequency;
% AllGain = gain of the record, used in acquisition.
% Output:
% SpkSlope = average slope, resulted of the derivation;
% SlopeUp = rising slope, resulted of the derivation;
% SlopeDown = dropping slope, resulted of the derivation;
% AmpUp = amplitude peak calculated based on the rising slope;
% AmpDown = amplitude peak calculated based on the dropping slope;
% AmpAvg = average amplitude, based on the slope.

SpkClip = SpkClip/AllGain; % Adjustment with the gain

peakPoint = (length(SpkClip)/2);
slope = diff(SpkClip)*AllSf;

for i = peakPoint-1:-1:1
    if slope(i) < 0
        cut_up = i;
        break
    else
        cut_up = []; % if there isn't an inversion in the spike slope
    end
end
if isempty(cut_up)
    cut_up = 1;
end
SlopeUp = mean(slope(cut_up+1:peakPoint-1));

for j = peakPoint:1:length(SpkClip)
    if slope(j) > 0
        cut_down = j;
        break
    else
        cut_down = []; % if there isn't an inversion in the spike slope
    end
end
if isempty(cut_down)
    cut_down = length(SpkClip);
end
SlopeDown = mean(slope(peakPoint:cut_down-1));

SpkSlope = mean(sum(SlopeUp) + sum(abs(SlopeDown)))/2;

AmpUp = SpkClip(peakPoint) - SpkClip(cut_up+1);
AmpDown = SpkClip(peakPoint) - SpkClip(cut_down-1);
AmpAvg = (AmpUp + AmpDown)/2;