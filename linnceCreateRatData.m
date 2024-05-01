function RatData = linnceCreateRatData(fName)

% Developed by Sofia Falco and Vinícius Cota @ 26/09/2018
% LINNce - Laboratório Interdisciplinar de Neuroengenharia e Neurociências
% Programa de Pós-Graduação em Engenharia Elétrica
% Universidade Federal de São João del-Rei - Minas Gerais - Brasil

% Inputs:
% fName = name of the struct file saved on PC, created containing the output RatData;

% Outputs:
% RatData = struct with all informations about the experiment to be study.

% Inserting the relevant datas, obteined previously in experiment =========
%==========================================================================
% Fields of the struct RatData (if not applicable, insert []):

% stGroup: literal, name of the group;
% Group: integer, number of the group, according with the order of the list. For example: 1 to CTRL group, 2 to NPS group; 
% Rat: literal, name or identification of the rat;
% Channel: literal, name of the record channel;
% Sf: integer, sampling frequency;
% Gain: integer, gain used in acquisition;
% File: literal, name of the saved record file;
% Tfb: integer, final time of the basal record, without any procedure;
% Tii: integer, initial time of the infusion;
% Tfi: integer, final time of the infusion;
% Tik: integer, initial time of the kindling;
% Tfk: integer, final time of the kindling;
% Tis: integer, initial time of the electrical stimulation;
% Tfs: integer, final time of the electrical stimulation;
% T_shake: integer, time of the first shake;
% Ti_MYO: integer, initial time of the forelimb myoclonus;
% Tf_MYO: integer, final time of the forelimb myoclonus;
% Ti_GTCS: integer, initial time of the generalized tonic clonic seizure;
% Tf_GTCS: integer, final time of the generalized tonic clonic seizure;
% Ti_Tonic: integer, initial time of the tonic phase;
% Tf_Tonic: integer, final time of the tonic phase;
% Ti_Clonic: integer, initial time of the clonic phase;
% Tf_Clonic: integer, final time of the clonic phase;
% Ti_1AD: integer, initial time of the first afterdischarge;
% Tf_1AD: integer, final time of the first afterdischarge;
% Ti_2AD: integer, initial time of the second afterdischarge;
% Tf_2AD: integer, final time of the second afterdischarge;
% Ti_3AD: integer, initial time of the third afterdischarge;
% Tf_3AD: integer, final time of the third afterdischarge;

% Test - REMMEMBER! ALL TIMES ARE EXPRESSED CONSIDERING THE FINAL OF BASAL
% If the LFP is not good to be used in the analyses, according with the user before a visual inspection or other, fill the 'File' with [];
% If the user prefers, instead of entering a total start time and end of GTCS it is possible to distinguish the times in the tonic and clonic phases

RatData(1) = struct('stGroup', 'CTRL-GTCS', 'Group', 1, 'Rat', 'r048', 'Channel', 'CX', 'Sf', 1000, 'Gain', 2000, 'File', 'r048_FIR.mat', 'Tfb', 42, ...
    'Tii', 42, 'Tfi', 207, 'Tik', [], 'Tfk', [], 'Tis', [], 'Tfs', [], 'T_shake', 118, 'Ti_MYO', 114.3, 'Tf_MYO', 142.8, 'Ti_GTCS', [], 'Tf_GTCS', [], ...
    'Ti_Tonic', 169.5, 'Tf_Tonic', 205.3, 'Ti_Clonic', 205.3, 'Tf_Clonic', 229.7, 'Ti_1AD', [], 'Tf_1AD', [], 'Ti_2AD', [], 'Tf_2AD', [], 'Ti_3AD', [], ...
    'Tf_3AD', []);
RatData(2) = struct('stGroup', 'NPS-GTCS', 'Group', 3, 'Rat', 'r093', 'Channel', 'CX', 'Sf', 1000, 'Gain', 2000, 'File', 'r093_FIR.mat', 'Tfb', 39, ...
    'Tii', 39, 'Tfi', 220.8, 'Tik', [], 'Tfk', [], 'Tis', [], 'Tfs', [], 'T_shake', 129, 'Ti_MYO', 109.5, 'Tf_MYO', 124.1, 'Ti_GTCS', [], 'Tf_GTCS', [], ...
    'Ti_Tonic', 169.6, 'Tf_Tonic', 210.8, 'Ti_Clonic', 210.8, 'Tf_Clonic', 220.8, 'Ti_1AD', [], 'Tf_1AD', [], 'Ti_2AD', [], 'Tf_2AD', [], 'Ti_3AD', [], ...
    'Tf_3AD', []);
% RatData(1) = struct('stGroup', [], 'Group', [], 'Rat', [], 'Channel', [], 'Sf', [], 'Gain', [], 'File', [], 'Tfb', [], 'Tii', [], 'Tfi', [], 'Tik', [], ...
%     'Tfk', [], 'Tis', [], 'Tfs', [], 'T_shake', [], 'Ti_MYO', [], 'Tf_MYO', [], 'Ti_GTCS', [], 'Tf_GTCS', [], 'Ti_Tonic', [], 'Tf_Tonic', [], ...
% 'Ti_Clonic', [], 'Tf_Clonic', [], 'Ti_1AD', [], 'Tf_1AD', [], 'Ti_2AD', [], 'Tf_2AD', [], 'Ti_3AD', [], 'Tf_3AD', []);

save(fName, 'RatData');
fprintf('Struct RatData, with %i inputs, was saved in %s\n', length(RatData), fName);