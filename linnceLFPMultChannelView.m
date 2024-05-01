function linnceLFPMultChannelView(SubjTag, AllGain, AllSf, FilteredPlot, typeFilter, nChannels, stChannel)

% Developed by Sofia Falco and Vinícius Cota @ 09/11/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil
%
%
% Inputs:
% LFP = subject record that will be visualized;
% SubjTag = identification of the subject in Experiment Data;
% AllGain = gain in the acqusition;
% AllSf = sampling frequency in acquisition;
% FilteredPlot = naming if the figure will present filtered record;
% nChannels = total number of channel records for the subject;
% stChannel = strings of all channels records.

indSub = 0;
MultChannelTag = ['string1' '_' 'string2'];
for i = 1:nChannels
    % To plot in maximum 3 channels for figure
    if indSub < 3
        indSub = indSub+1;
    else
        figure;
        indSub = 1;
        MultChannelTag = ['string1' '_' 'string2'];
    end
    ChannelTag = stChannel(i);
    ChannelTag = char(ChannelTag);
    dataFormat = '.mat';
    if FilteredPlot
        fileAdress = [SubjTag '_' ChannelTag '_' typeFilter dataFormat];
        load(fileAdress);  
        LFP = FilteredRecord;
    else
        fileAdress = [SubjTag dataFormat];
        LFP = load(fileAdress,ChannelTag);
        LFP = LFP.(ChannelTag);     
    end
    Ts = 1/AllSf:1/AllSf:length(LFP)/AllSf;
    Color = [rand(1) rand(1) rand(1)]; % Generating the plot color
    LFP = LFP/AllGain; % Descounting the gain
    LFP = LFP*1000; % Normalizing to exibit in mV
    subplot(3,1,indSub);
    plot(Ts, LFP, 'Color', Color); hold on;
%     if plotInterestTimes
%         for k = 1:length(InterestTimes)
%             ColorInterestTimes = [rand(1) rand(1) rand(1)];
%             plot(InterestTimes(k,i), 'Color', ColorInterestTimes, '--'); hold on;
%             legend(LegendInterestTimes(i).Legend(k)); hold on;
%         end
%     end
    xlabel('Time (s)'); ylabel('Amplitude (mV)');
    MultChannelTag = [MultChannelTag '_' ChannelTag];
    if FilteredPlot
        title(sprintf('Filtered LFP - %s - %s', SubjTag, ChannelTag)); 
        if indSub == 3
            saveas(gcf,sprintf('Filtered LFP - %s - %s', SubjTag, MultChannelTag));
            saveas(gcf,sprintf('Filtered LFP - %s - %s', SubjTag, MultChannelTag),'tif');
        end
    else
        title(sprintf('Raw LFP - %s - %s', SubjTag, ChannelTag)); 
        if indSub == 3
            saveas(gcf,sprintf('Raw LFP - %s - %s', SubjTag, MultChannelTag));
            saveas(gcf,sprintf('Raw LFP - %s - %s', SubjTag, MultChannelTag),'tif');
        end
    end
end