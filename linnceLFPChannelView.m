function linnceLFPChannelView(SubjTag, indPlot, LFP, AllGain, AllSf, FilteredPlot, vInterestTimes, sLegendInterestTimes)

% Developed by Sofia Falco and Vinícius Cota @ 08/11/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
%
% Inputs:
% LFP = subject record that will be visualized;
% AllGain = gain in the acqusition;
% AllSf = sampling frequency in acquisition.

load(sprintf('ExperimentData_%s.mat', SubjTag));

Ts = 1/AllSf:1/AllSf:length(LFP)/AllSf;
Color = [rand(1) rand(1) rand(1)]; % Generating the plot color
LFP = LFP/AllGain; % Descounting the gain
LFP = LFP*1000; % Normalizing to exibit in mV
figure;
plot(Ts, LFP, 'Color', Color, 'DisplayName', ExperimentData.ChannelData(indPlot).stChannel); hold on;
xlim([min(Ts) max(Ts)]); ylim([min(LFP) max(LFP)]);
for i = 1:ExperimentData.ChannelData(indPlot).nInterestTimes
    ColorInterestTime = [rand(1) rand(1) rand(1)];
    InterestTime = vInterestTimes(i,indPlot);
    LegendInterestTime = sLegendInterestTimes(i).(ExperimentData.ChannelData(indPlot).stChannel);
    plot([InterestTime InterestTime], [min(LFP) max(LFP)], 'Color', ColorInterestTime, 'LineStyle', '--', 'DisplayName', LegendInterestTime); hold on;
    legend('-DynamicLegend');
    legend('show');
end
xlabel('Time (s)'); ylabel('Amplitude (mV)');

if FilteredPlot  
    title(sprintf('Filtered LFP - %s - %s', SubjTag, ExperimentData.ChannelData(indPlot).stChannel));
    saveas(gcf,sprintf('Filtered LFP - %s - %s', SubjTag, ExperimentData.ChannelData(indPlot).stChannel));
    saveas(gcf,sprintf('Filtered LFP - %s - %s', SubjTag, ExperimentData.ChannelData(indPlot).stChannel),'tif');
else
    title(sprintf('LFP - %s - %s', SubjTag, ExperimentData.ChannelData(indPlot).stChannel));
    saveas(gcf,sprintf('Raw LFP - %s - %s', SubjTag, ExperimentData.ChannelData(indPlot).stChannel));
    saveas(gcf,sprintf('Raw LFP - %s - %s', SubjTag, ExperimentData.ChannelData(indPlot).stChannel),'tif');
end