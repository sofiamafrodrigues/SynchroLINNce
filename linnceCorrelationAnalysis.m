function [correlation] = linnceCorrelationAnalysis(SubjTag,Channel1,Channel2,chooseplot,Gain1,Gain2,stChannel1,stChannel2,UseFilteredCorr)
% Developed by Sofia Falco and Vinícius Cota @ 15/10/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
% Inputs:
% SubjTag = identification tag in Experiment;
% Channel1 = channel record 1;
% Channel2 = channel record 2;
% chooseplot = 0 or 1, if the user wants to see the correlation between these two channels;
% Gain1 = gain of the Channel 1;
% Gain2 = gain of the Channel 2;
% stChannel1 = tag for identification of the channel 1;
% stChannel2 = tag for identification of the channel 2;
% UseFilteredCorr = defining to title, if was used filtered records;
% Output:
% correlation = matrix of correlation coefficients.

Channel1 = Channel1/Gain1;
Channel2 = Channel2/Gain2;
correlation = corrcoef(Channel1,Channel2);
if chooseplot
    figure;
    Channel1 = Channel1*1000; % Converting the scale to mV
    Channel2 = Channel2*1000;
    plot(Channel1,Channel2,'.');
    note = sprintf('coefficient = %s', num2str(correlation(2,1)));
    text(0,0,note);
    note = sprintf('Channels in comparision: %s and %s', stChannel1, stChannel2);
    legend(note, 'Location', 'Northwest');
    xlabel('Amplitude (mV)'); ylabel('Amplitude (mV)');
    ChannelTag = [stChannel1 ' and ' stChannel2];
    if UseFilteredCorr
        title(sprintf('Correlation analysis with filtered LFPs - %s - %s', SubjTag, ChannelTag));
        saveas(gcf, sprintf('Correlation analysis with filtered LFPs - %s - %s', SubjTag, ChannelTag));
        saveas(gcf, sprintf('Correlation analysis with filtered LFPs - %s - %s', SubjTag, ChannelTag), 'tif');
    else
        title(sprintf('Correlation analysis - %s - %s', SubjTag, ChannelTag));
        saveas(gcf, sprintf('Correlation analysis - %s - %s', SubjTag, ChannelTag));
        saveas(gcf, sprintf('Correlation analysis - %s - %s', SubjTag, ChannelTag), 'tif');        
    end
end