function varargout = DigitalFilteringGUI2(varargin)
% DIGITALFILTERINGGUI2 MATLAB code for DigitalFilteringGUI2.fig
%      DIGITALFILTERINGGUI2, by itself, creates a new DIGITALFILTERINGGUI2 or raises the existing
%      singleton*.
%
%      H = DIGITALFILTERINGGUI2 returns the handle to a new DIGITALFILTERINGGUI2 or the handle to
%      the existing singleton*.
%
%      DIGITALFILTERINGGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITALFILTERINGGUI2.M with the given input arguments.
%
%      DIGITALFILTERINGGUI2('Property','Value',...) creates a new DIGITALFILTERINGGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DigitalFilteringGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DigitalFilteringGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DigitalFilteringGUI2

% Last Modified by GUIDE v2.5 10-Jan-2019 10:05:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DigitalFilteringGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @DigitalFilteringGUI2_OutputFcn, ...
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


% --- Executes just before DigitalFilteringGUI2 is made visible.
function DigitalFilteringGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DigitalFilteringGUI2 (see VARARGIN)

% Choose default command line output for DigitalFilteringGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DigitalFilteringGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DigitalFilteringGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes3);
imshow('LINNce - background.tif');

% Obtaining the correct channel index, to proceed
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('FilteredData.mat');
indChannel = [];
for i = 1:ExperimentData.nChannels
    if isempty(indChannel)
        if isempty(FilteredData.ChannelData(i).stChannel)
            indChannel = i;
        end
    end
end
% Saving this information, to be used after
save('indChannel', 'indChannel');

% Showing to user the actual channel number and the total number
set(handles.FirstTextBox, 'String', sprintf('Channel %i of %i', indChannel, ExperimentData.nChannels));
% Showing to user the actual channel name
set(handles.SecondTextBox, 'String', sprintf('Selecting the %s file:', ExperimentData.ChannelData(indChannel).stChannel));

% --- Executes on button press in FIRButton.
function FIRButton_Callback(hObject, eventdata, handles)

% Options choosed: typeFilter 0 is FIR and 1 is IIR
% If the option FIR was selected
selectTypeFilter = get(handles.FIRButton, 'Value');
if selectTypeFilter
    typeFilter = 0;
end
% Saving the type filter choosed
save('typeFilter', 'typeFilter');

% --- Executes on button press in IIRButton.
function IIRButton_Callback(hObject, eventdata, handles)

% Options choosed: typeFilter 0 is FIR and 1 is IIR
% If the option IIR was selected
selectTypeFilter = get(handles.IIRButton, 'Value');
if selectTypeFilter
    typeFilter = 1;
end
% Saving the type filter choosed
save('typeFilter', 'typeFilter');

% --- Executes on button press in SelectFileButton.
function SelectFileButton_Callback(hObject, eventdata, handles)

% Getting the channel file adress by user selection
fileAdress = uigetfile();

% Loading the variables and the struct
load('SubjTag.mat');
load('indChannel.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
insideFile = who('-file', sprintf('%s',fileAdress)); % Getting the file content
ExperimentData.ChannelData(indChannel).fileAdress = fileAdress; % Saving the file adress into the struct
save(sprintf('ExperimentData_%s', SubjTag), 'ExperimentData', '-append'); % Saving the updated Experiment Data struct
set(handles.Variables, 'String', insideFile); % Showing the file content
set(handles.FileAdressView, 'String', sprintf('File adress: %s', fileAdress));

% --- Executes on selection change in Variables.
function Variables_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Variables_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function LFPName_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function LFPName_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in FilterButton.
function FilterButton_Callback(hObject, eventdata, handles)

% Loading the struct and the variables
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('indChannel.mat');

% Getting the raw record
LFPName = get(handles.LFPName, 'String'); % Getting the archive name of the channel record that will be filtered, inserted by the user
LFP = load(ExperimentData.ChannelData(indChannel).fileAdress, sprintf('%s', LFPName)); % Loading the raw record
LFP = LFP.(LFPName);
save('LFP', 'LFP'); % Saving to be used by the toolbox

% To filter:
load('typeFilter.mat');
RawRecord = LFP;
AllSf = ExperimentData.ChannelData(indChannel).AllSf; % Sampling frequency
if typeFilter % typeFilter = 0/FIR or 1/IIR
    [FilteredRecord] = linnceBandPassFilterIIR(RawRecord, AllSf); % filtering
else
    [FilteredRecord] = linnceBandPassFilterFIR(RawRecord, AllSf); % filtering
end
save('FilteredRecord', 'FilteredRecord'); % Saving the filtered record to be used in the toolbox

% To plot:
axes(handles.axes1); 
cla;
AllGain = ExperimentData.ChannelData(indChannel).AllGain;
t = 1/AllSf:1/AllSf:length(LFP)/AllSf;
LFP = LFP/AllGain; % correcting by the gain
LFP = LFP*1000; % to plot in mV
plot(t, LFP); hold on; % plotting the raw record
xlim([0 max(t)]);
ylim([min(LFP) max(LFP)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)');
axes(handles.axes2);
cla;
FilteredRecord = FilteredRecord/AllGain; % correcting by the gain
FilteredRecord = FilteredRecord*1000; % to plot in mV
plot(t, FilteredRecord); hold on; % plotting the filtered record
xlim([0 max(t)]);
ylim([min(FilteredRecord) max(FilteredRecord)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)');

% --- Executes on button press in SaveCheckBox.
function SaveCheckBox_Callback(hObject, eventdata, handles)

load('SubjTag.mat');
load('indChannel.mat');
load('FilteredRecord.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));

SaveCheckBox = get(handles.SaveCheckBox, 'Value');
stChannel = ExperimentData.ChannelData(indChannel).stChannel;
if SaveCheckBox
    filtRecordName = sprintf('%s_%s_FIR', SubjTag, stChannel);
    save(filtRecordName, 'FilteredRecord');
    set(handles.Results, 'String', sprintf('The filtered record will be saved in: %s', filtRecordName)); % Showing where is saved the results   
end

function Ti_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Ti_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Tf_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Tf_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ZoomButton_Callback(hObject, eventdata, handles)

% Loading the variables and the struct
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('LFP.mat');
load('FilteredRecord.mat');
load('indChannel.mat');

% Getting the selected times for zoom
Ti = get(handles.Ti, 'String');
Ti = str2double(Ti);
Tf = get(handles.Tf, 'String');
Tf = str2double(Tf);

% To plot:
axes(handles.axes1);
cla;
AllGain = ExperimentData.ChannelData(indChannel).AllGain;
AllSf = ExperimentData.ChannelData(indChannel).AllSf;
t = 1/AllSf:1/AllSf:length(LFP)/AllSf;
LFP = LFP/AllGain; % correcting by the gain
LFP = LFP*1000; % to plot in mV
t = t(Ti*AllSf:Tf*AllSf);
LFP = LFP(Ti*AllSf:Tf*AllSf);
plot(t, LFP); hold on; % plotting the raw record with the selected zoom
xlim([min(t) max(t)]);
ylim([min(LFP) max(LFP)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)');
axes(handles.axes2);
cla;
FilteredRecord = FilteredRecord/AllGain; % correcting by the gain
FilteredRecord = FilteredRecord*1000; % to plot in mV
FilteredRecord = FilteredRecord(Ti*AllSf:Tf*AllSf);
plot(t, FilteredRecord); hold on; % plotting the filtered record with the selected zoom
xlim([min(t) max(t)]);
ylim([min(FilteredRecord) max(FilteredRecord)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)');

function ResetButton_Callback(hObject, eventdata, handles)

% Reseting the selected times for zoom
set(handles.Ti, 'String', '');
set(handles.Tf, 'String', '');

% Loading the variables and struc
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('LFP.mat');
load('FilteredRecord.mat');
load('indChannel.mat');

% To plot:
axes(handles.axes1);
cla;
AllGain = ExperimentData.ChannelData(indChannel).AllGain;
AllSf = ExperimentData.ChannelData(indChannel).AllSf;
t = 1/AllSf:1/AllSf:length(LFP)/AllSf;
LFP = LFP/AllGain; % correcting by the gain
LFP = LFP*1000; % to plot in mV
plot(t, LFP); hold on; % plotting the raw record without zoom
xlim([0 max(t)]);
ylim([min(LFP) max(LFP)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)');
axes(handles.axes2);
cla;
FilteredRecord = FilteredRecord/AllGain; % correcting by the gain
FilteredRecord = FilteredRecord*1000; % to plot in mV
plot(t, FilteredRecord); hold on; % plotting the filtered record without zoom
xlim([0 max(t)]);
ylim([min(FilteredRecord) max(FilteredRecord)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)');

% --- Executes on button press in OkButton.
function OkButton_Callback(hObject, eventdata, handles)

% Loading the variables and structs
load('SubjTag.mat');
load(sprintf('ExperimentData_%s', SubjTag));
load('indChannel.mat');
load('FilteredData.mat');

% Updating the struct to know what is the the next channel to be filtered
FilteredData.ChannelData(indChannel).stChannel = ExperimentData.ChannelData(indChannel).stChannel;
save('FilteredData', 'FilteredData');

% If we don't filtered all channels yet
if indChannel < ExperimentData.nChannels
    % Cleaning variables
    set(handles.Variables, 'String', '');
    set(handles.FIRButton, 'Value', 0);
    set(handles.IIRButton, 'Value', 0);
    set(handles.LFPName, 'String', '');
    set(handles.Results, 'String', '');
    axes(handles.axes1);
    cla;
    axes(handles.axes2);
    cla;
    set(handles.Ti, 'String', '');
    set(handles.Tf, 'String', '');
    set(handles.FileAdressView, 'String', '');
    set(handles.SaveCheckBox, 'Value', 0);
    % Repeting the process for next channel
    DigitalFilteringGUI2    
else
    % Going to main menu
    close all;
    SignalProcessingGUI
end
