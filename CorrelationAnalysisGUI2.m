function varargout = CorrelationAnalysisGUI2(varargin)
% CORRELATIONANALYSISGUI2 MATLAB code for CorrelationAnalysisGUI2.fig
%      CORRELATIONANALYSISGUI2, by itself, creates a new CORRELATIONANALYSISGUI2 or raises the existing
%      singleton*.
%
%      H = CORRELATIONANALYSISGUI2 returns the handle to a new CORRELATIONANALYSISGUI2 or the handle to
%      the existing singleton*.
%
%      CORRELATIONANALYSISGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CORRELATIONANALYSISGUI2.M with the given input arguments.
%
%      CORRELATIONANALYSISGUI2('Property','Value',...) creates a new CORRELATIONANALYSISGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CorrelationAnalysisGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CorrelationAnalysisGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CorrelationAnalysisGUI2

% Last Modified by GUIDE v2.5 09-Jan-2019 15:57:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CorrelationAnalysisGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @CorrelationAnalysisGUI2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before CorrelationAnalysisGUI2 is made visible.
function CorrelationAnalysisGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CorrelationAnalysisGUI2 (see VARARGIN)

% Choose default command line output for CorrelationAnalysisGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CorrelationAnalysisGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CorrelationAnalysisGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% Obtaining the correct channel index, to proceed
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load(sprintf('CorrelationAnalysis_%s.mat', SubjTag));
indChannel = [];
for i = 1:ExperimentData.nChannels
    if isempty(indChannel)
        if isempty(CorrelationAnalysis.PairData(i).CorrCoef)
            indChannel = i;
        end
    end
end

% Correcting the indexes for the last pair of channels that will be analyzed
count_ind = 0;
if indChannel == ExperimentData.nChannels
    count_ind = 1;
    indChannel = 1;
end

% Saving to be used in the toolbox
save('indChannel', 'indChannel');
save('count_ind', 'count_ind');

% Showing to user the actual channel pair number and the total number
if count_ind % correcting if is in the last pair
    set(handles.TextBox1, 'String', sprintf('Pair of channels %i of %i', ExperimentData.nChannels, ExperimentData.nChannels));
else
    set(handles.TextBox1, 'String', sprintf('Pair of channels %i of %i', indChannel, ExperimentData.nChannels));
end

% Showing to user the actual channel 1 name, to know what is the channel file selection
set(handles.TextBoxChannel1, 'String', sprintf('Selecting the %s file:', ExperimentData.ChannelData(indChannel).stChannel));

% Showing to user the actual channel 2 name, to know what is the channel file selection, seeing the correction in the last channel pair
if count_ind
    set(handles.TextBoxChannel2, 'String', sprintf('Selecting the %s file:', ExperimentData.ChannelData(ExperimentData.nChannels).stChannel));
else
    set(handles.TextBoxChannel2, 'String', sprintf('Selecting the %s file:', ExperimentData.ChannelData(indChannel+1).stChannel)); 
end

% --- Executes on button press in FileCheckBox.
function FileCheckBox_Callback(hObject, eventdata, handles)

FileCheckBox = get(handles.FileCheckBox, 'Value'); % Getting the information: if checkbox is filled, same file to the channels
save('FileCheckBox', 'FileCheckBox');

% --- Executes on button press in SelectChannel1.
function SelectChannel1_Callback(hObject, eventdata, handles)

% Getting the channel 1 file adress by user selection
fileAdress = uigetfile();

% Loading the variables and the struct
load('SubjTag.mat');
load('indChannel.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('FileCheckBox.mat');
insideFile = who('-file', sprintf('%s',fileAdress)); % Getting the file content
set(handles.VariablesChannel1, 'String', insideFile); % Showing the file content
set(handles.FileAdressView1, 'String', sprintf('File adress: %s', fileAdress));
ExperimentData.ChannelData(indChannel).fileAdress = fileAdress; % Saving the file adress into the struct
save(sprintf('ExperimentData_%s', SubjTag), 'ExperimentData', '-append'); % Saving the updated Experiment Data struct

if FileCheckBox % same file
    set(handles.VariablesChannel2, 'String', insideFile); % Showing the file content
    ExperimentData.ChannelData(indChannel+1).fileAdress = fileAdress;
    set(handles.FileAdressView2, 'String', sprintf('File adress: %s', fileAdress));
    save(sprintf('ExperimentData_%s', SubjTag), 'ExperimentData', '-append'); % Saving the updated Experiment Data struct
end

% Showing where the results will be saved
set(handles.Results, 'String', sprintf('The graphics will be saved automatically and the correlation results is in CorrelationAnalysis_%s', SubjTag));

% --- Executes on button press in SelectChannel2.
function SelectChannel2_Callback(hObject, eventdata, handles)

load('FileCheckBox.mat');
if FileCheckBox
else
    % Getting the channel 2 file adress by user selection
    fileAdress = uigetfile();
    % Loading the variables and the struct
    load('SubjTag.mat');
    load('indChannel.mat');
    load(sprintf('ExperimentData_%s.mat', SubjTag));
    insideFile = who('-file', sprintf('%s',fileAdress)); % Getting the file content
    set(handles.VariablesChannel2, 'String', insideFile); % Showing the file content
    ExperimentData.ChannelData(indChannel+1).fileAdress = fileAdress; % Saving the file adress into the struct
    set(handles.FileAdressView2, 'String', sprintf('File adress: %s', fileAdress));
    save(sprintf('ExperimentData_%s', SubjTag), 'ExperimentData', '-append'); % Saving the updated Experiment Data struct
end

% Showing where the results will be saved
set(handles.Results, 'String', sprintf('The graphics will be saved automatically and the correlation results is in CorrelationAnalysis_%s', SubjTag));

% --- Executes on selection change in VariablesChannel1.
function VariablesChannel1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function VariablesChannel1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in VariablesChannel2.
function VariablesChannel2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function VariablesChannel2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function LFPNameChannel1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function LFPNameChannel1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function LFPNameChannel2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function LFPNameChannel2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in OKButton.
function OKButton_Callback(hObject, eventdata, handles)

% Loading the struct and the variables
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load(sprintf('CorrelationAnalysis_%s.mat', SubjTag));
load('indChannel.mat');
load('count_ind.mat');

% Getting if the user is using filter data or not
if ~isempty(ExperimentData.typeFilter)
    UseFilteredCorr = 1;
else
    UseFilteredCorr = 0;
end

if count_ind
    % Getting the records
    LFPNameChannel1 = get(handles.LFPNameChannel1, 'String'); % Getting the channel 1 record
    Channel1 = load(ExperimentData.ChannelData(indChannel).fileAdress, sprintf('%s', LFPNameChannel1));
    Channel1 = Channel1.(LFPNameChannel1);
    save('Channel1', 'Channel1');
    LFPNameChannel2 = get(handles.LFPNameChannel2, 'String'); % Getting the channel 2 record
    Channel2 = load(ExperimentData.ChannelData(ExperimentData.nChannels).fileAdress, sprintf('%s', LFPNameChannel2));
    Channel2 = Channel2.(LFPNameChannel2);
    save('Channel2', 'Channel2');

    % Getting the channel record names, gains and the subject group
    stChannel1 = ExperimentData.ChannelData(indChannel).stChannel;
    stChannel1 = char(stChannel1); % Name of channel record 1
    Gain1 = ExperimentData.ChannelData(indChannel).AllGain; % Gain channel 1
    stChannel2 = ExperimentData.ChannelData(ExperimentData.nChannels).stChannel;
    stChannel2 = char(stChannel2); % Name of channel record 2
    Gain2 = ExperimentData.ChannelData(ExperimentData.nChannels).AllGain; % Gain channel 2    
else
    % Getting the records
    LFPNameChannel1 = get(handles.LFPNameChannel1, 'String'); % Getting the channel 1 record
    Channel1 = load(ExperimentData.ChannelData(indChannel).fileAdress, sprintf('%s', LFPNameChannel1));
    Channel1 = Channel1.(LFPNameChannel1);
    save('Channel1', 'Channel1');
    LFPNameChannel2 = get(handles.LFPNameChannel2, 'String'); % Getting the channel 2 record
    Channel2 = load(ExperimentData.ChannelData(indChannel+1).fileAdress, sprintf('%s', LFPNameChannel2));
    Channel2 = Channel2.(LFPNameChannel2);
    save('Channel2', 'Channel2');

    % Getting the channel record names, gains and the subject group
    stChannel1 = ExperimentData.ChannelData(indChannel).stChannel;
    stChannel1 = char(stChannel1); % Name of channel record 1
    Gain1 = ExperimentData.ChannelData(indChannel).AllGain; % Gain channel 1
    stChannel2 = ExperimentData.ChannelData(indChannel+1).stChannel;
    stChannel2 = char(stChannel2); % Name of channel record 2
    Gain2 = ExperimentData.ChannelData(indChannel+1).AllGain; % Gain channel 2
end

chooseplot = 1; % always plotting the results

CorrelationMatrix = eye(ExperimentData.nChannels); % initializing the correlation coefficient matrix

[correlation] = linnceCorrelationAnalysis(SubjTag,Channel1,Channel2,chooseplot,Gain1,Gain2,stChannel1,stChannel2,UseFilteredCorr); % correlation

% Getting the correct correlation coefficient (seeing the correction in the last channel pair)
if count_ind
    CorrelationAnalysis.PairData(ExperimentData.nChannels).CorrCoef = correlation(1,2);
else
    CorrelationAnalysis.PairData(indChannel).CorrCoef = correlation(1,2);
end

% Saving the updated struct
save(sprintf('CorrelationAnalysis_%s',SubjTag),'CorrelationAnalysis', '-append');

% Do the correlation to the next channel pair
if count_ind
else
    % Reseting the information
    set(handles.VariablesChannel1, 'String', '');
    set(handles.VariablesChannel2, 'String', '');
    set(handles.LFPNameChannel1, 'String', '');
    set(handles.LFPNameChannel2, 'String', ''); 
    set(handles.FileCheckBox, 'Value', 0);
    set(handles.FileAdressView1, 'String', '');
    set(handles.FileAdressView2, 'String', '');
    CorrelationAnalysisGUI2
end

% Filling the correlation coefficient matrix, with all the subject results
if count_ind % if all channel pairs were analyzed
    count1 = 0;
    for i = 1:ExperimentData.nChannels
        for j = i+1:ExperimentData.nChannels 
            count1 = count1+1;
            CorrelationMatrix(i,j) = CorrelationAnalysis.PairData(count1).CorrCoef;
            CorrelationMatrix(j,i) = CorrelationAnalysis.PairData(count1).CorrCoef;
        end
    end
    CorrelationAnalysis(1).CorrelationMatrix = CorrelationMatrix;
    save(sprintf('CorrelationAnalysis_%s',SubjTag),'CorrelationAnalysis', '-append'); % saving the updated struct
    close all;
    SignalProcessingGUI % going to main menu
end
