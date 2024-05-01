function varargout = SpikeDetectionGUI2(varargin)
% SPIKEDETECTIONGUI2 MATLAB code for SpikeDetectionGUI2.fig
%      SPIKEDETECTIONGUI2, by itself, creates a new SPIKEDETECTIONGUI2 or raises the existing
%      singleton*.
%
%      H = SPIKEDETECTIONGUI2 returns the handle to a new SPIKEDETECTIONGUI2 or the handle to
%      the existing singleton*.
%
%      SPIKEDETECTIONGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIKEDETECTIONGUI2.M with the given input arguments.
%
%      SPIKEDETECTIONGUI2('Property','Value',...) creates a new SPIKEDETECTIONGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikeDetectionGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikeDetectionGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikeDetectionGUI2

% Last Modified by GUIDE v2.5 30-Dec-2018 19:48:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikeDetectionGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikeDetectionGUI2_OutputFcn, ...
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


% --- Executes just before SpikeDetectionGUI2 is made visible.
function SpikeDetectionGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikeDetectionGUI2 (see VARARGIN)

% Choose default command line output for SpikeDetectionGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeDetectionGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikeDetectionGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes2);
imshow('LINNce - background.tif');

% Obtaining the correct channel index, to proceed
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load(sprintf('SpkDetection_%s.mat', SubjTag));
indChannel = [];
for i = 1:ExperimentData.nChannels
    if isempty(indChannel)
        if isempty(SpkDetection(i).stChannel)
            indChannel = i;
        end
    end
end
% Saving the index to be used in the toolbox
save('indChannel', 'indChannel');

% Showing to user the actual channel pair number and the total number
set(handles.FirstTextBox, 'String', sprintf('Channel %i of %i', indChannel, ExperimentData.nChannels));

% Showing to user the actual channel name, to know what is the channel file selection
set(handles.SecondTextBox, 'String', sprintf('Selecting the %s file:', ExperimentData.ChannelData(indChannel).stChannel));

% --- Executes on button press in SelectFilebutton1.
function SelectFilebutton1_Callback(hObject, eventdata, handles)

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

% --- Executes on button press in plotbutton.
function PlotButton_Callback(hObject, eventdata, handles)

% Loading the variables and the struct
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('indChannel.mat');

% Getting the filtered record
LFPName = get(handles.LFPName, 'String');
LFP = load(ExperimentData.ChannelData(indChannel).fileAdress, sprintf('%s', LFPName));
LFP = LFP.(LFPName);
save('LFP', 'LFP');

% To plot:
axes(handles.axes1);
cla;
AllSf = ExperimentData.ChannelData(indChannel).AllSf;
AllGain = ExperimentData.ChannelData(indChannel).AllGain;
t = 1/AllSf:1/AllSf:length(LFP)/AllSf;
LFP = LFP/AllGain; % correcting by the gain
LFP = LFP*1000; % to plot in mV
plot(t, LFP); hold on;
xlim([0 max(t)]);
ylim([min(LFP) max(LFP)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)');    

% --- Executes on button press in SpkDetectionExplanation.
function SpkDetectionExplanation_Callback(hObject, eventdata, handles)

% To see how it works
SpkDetectionTextGUI
    
function Ti_Analysis_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Ti_Analysis_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Tf_Analysis_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Tf_Analysis_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in PlotTimes.
function PlotTimes_Callback(hObject, eventdata, handles)

% Loading the struct and variables
load('LFP.mat');
load('SubjTag.mat');
load('indChannel.mat');
load(sprintf('ExperimentData_%s', SubjTag));

% Getting the analysis times
Ti_Analysis = get(handles.Ti_Analysis, 'String');
Ti_Analysis = str2double(Ti_Analysis);
Tf_Analysis = get(handles.Tf_Analysis, 'String');
Tf_Analysis = str2double(Tf_Analysis);
TimeOfAnalysis = Tf_Analysis - Ti_Analysis;
set(handles.TimeOfAnalysis, 'String', sprintf('%.2f s',TimeOfAnalysis)); % showing the analysis instant

% To plot with zoom in the analysis instant:
axes(handles.axes1);
cla;
AllSf = ExperimentData.ChannelData(indChannel).AllSf;
AllGain = ExperimentData.ChannelData(indChannel).AllGain;
t = 1/AllSf:1/AllSf:length(LFP)/AllSf;
if Ti_Analysis > 0 && Tf_Analysis < (length(LFP)/AllSf)
    t = t((Ti_Analysis - 1)*AllSf:(Tf_Analysis + 1)*AllSf);
    LFP = LFP((Ti_Analysis - 1)*AllSf:(Tf_Analysis + 1)*AllSf);
end
LFP = LFP/AllGain; % correcting by the gain
LFP = LFP*1000; % to plot in mV
plot(t, LFP); hold on;
xlim([min(t) max(t)]);
ylim([min(LFP) max(LFP)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)'); 
plot([Ti_Analysis Ti_Analysis] , [min(LFP) max(LFP)], 'r--'); hold on;
plot([Tf_Analysis Tf_Analysis] , [min(LFP) max(LFP)], 'r--'); hold on;
TimeOfAnalysis = Tf_Analysis - Ti_Analysis;
set(handles.TimeOfAnalysis, 'String', sprintf('%.2f s',TimeOfAnalysis));

% --- Executes on button press in ZoomOut.
function ZoomOut_Callback(hObject, eventdata, handles)

% Loading the variables and the struct
load('SubjTag.mat');
load('LFP.mat');
load('indChannel.mat');
load(sprintf('ExperimentData_%s', SubjTag));

% Getting the analysis times
Ti_Analysis = get(handles.Ti_Analysis, 'String');
Ti_Analysis = str2double(Ti_Analysis);
Tf_Analysis = get(handles.Tf_Analysis, 'String');
Tf_Analysis = str2double(Tf_Analysis);
TimeOfAnalysis = Tf_Analysis - Ti_Analysis;
set(handles.TimeOfAnalysis, 'String', sprintf('%.2f s',TimeOfAnalysis)); % showing the analysis instant

% Plotting again, without zoom but with selected times
axes(handles.axes1);
cla;
AllSf = ExperimentData.ChannelData(indChannel).AllSf;
AllGain = ExperimentData.ChannelData(indChannel).AllGain;
t = 1/AllSf:1/AllSf:length(LFP)/AllSf;
LFP = LFP/AllGain; % correcting by the gain
LFP = LFP*1000; % to plot in mV
plot(t, LFP); hold on;
plot([Ti_Analysis Ti_Analysis] , [min(LFP) max(LFP)], 'r--'); hold on;
plot([Tf_Analysis Tf_Analysis] , [min(LFP) max(LFP)], 'r--'); hold on;
xlim([0 max(t)]);
ylim([min(LFP) max(LFP)]);
xlabel('Time(s)'); ylabel('Amplitude (mV)'); 

function ThresholdMax_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function ThresholdMax_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DeltaTMin_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function DeltaTMin_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function AmpCutMin_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function AmpCutMin_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in OKbutton.
function OKbutton_Callback(hObject, eventdata, handles)

% Loading the structs and the variables
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load(sprintf('SpkDetection_%s.mat', SubjTag));
load('indChannel.mat');
load('LFP.mat');

% Getting the analysis times and filling the struct
Ti_Analysis = get(handles.Ti_Analysis, 'String');
Ti_Analysis = str2double(Ti_Analysis);
Tf_Analysis = get(handles.Tf_Analysis, 'String');
Tf_Analysis = str2double(Tf_Analysis);
SpkDetection(indChannel).Ti_Analysis = Ti_Analysis;
SpkDetection(indChannel).Tf_Analysis = Tf_Analysis;
TimeOfAnalysis = Tf_Analysis - Ti_Analysis;
set(handles.TimeOfAnalysis, 'String', sprintf('%.2f s',TimeOfAnalysis)); % showing the analysis instant
SpkDetection(indChannel).stChannel = ExperimentData.ChannelData(indChannel).stChannel; % channel name

% Getting the spike detection settings and filling the struct
ThresholdMax = get(handles.ThresholdMax, 'String');
ThresholdMax = str2double(ThresholdMax);
SpkDetection(indChannel).ThresholdMax = ThresholdMax;
DeltaTMin = get(handles.DeltaTMin, 'String');
DeltaTMin = str2double(DeltaTMin);
SpkDetection(indChannel).DeltaTMin = DeltaTMin;
AmpCutMin = get(handles.AmpCutMin, 'String');
AmpCutMin = str2double(AmpCutMin);
SpkDetection(indChannel).AmpCutMin = AmpCutMin;

% Data for the spike detection function
ChannelTag = SpkDetection(indChannel).stChannel; % to be used in the spike detection function
AllSf = ExperimentData.ChannelData(indChannel).AllSf; % sampling frequency
AllGain = ExperimentData.ChannelData(indChannel).AllGain; % gain 
% Selecting the filtered record in the analysis instant, seeing 80 ms before and after, because of the spike clip size
RecordClip = LFP((Ti_Analysis-0.08)*AllSf:(Tf_Analysis+0.08)*AllSf);

[SpkTimeStamps, SpkMaxStamps, SpkClips, SpkNumber, SpkFireRate, AvgSpkMaxStamps, MaxSpkMaxStamps, MinSpkMaxStamps, AvgDeltaT, MaxDeltaT, MinDeltaT] = ...
    linnceDetectSpk(RecordClip, AllSf, AllGain, ThresholdMax, DeltaTMin, AmpCutMin); % doing the spike detection

% Filling the struct with the spike detection results
SpkDetection(indChannel).SpkTimeStamps = SpkTimeStamps;
SpkDetection(indChannel).SpkMaxStamps = SpkMaxStamps;
SpkDetection(indChannel).SpkClips = SpkClips;
SpkDetection(indChannel).SpkNumber = SpkNumber;
SpkDetection(indChannel).SpkFireRate = SpkFireRate;
SpkDetection(indChannel).AvgSpkMaxStamps = AvgSpkMaxStamps;
SpkDetection(indChannel).MaxSpkMaxStamps = MaxSpkMaxStamps;
SpkDetection(indChannel).MinSpkMaxStamps = MinSpkMaxStamps;
SpkDetection(indChannel).AvgDeltaT = AvgDeltaT;
SpkDetection(indChannel).MaxDeltaT = MaxDeltaT;
SpkDetection(indChannel).MinDeltaT = MinDeltaT;

% Saving the updated struct
save(sprintf('SpkDetection_%s', ExperimentData.SubjTag), 'SpkDetection', '-append');

% Visualizing the spike detection
linnceViewSpkDetected(SpkTimeStamps, SpkMaxStamps, RecordClip, SubjTag, ChannelTag, AllSf, AllGain, ThresholdMax);

% Visualizing the spike sobreposition and the spike clip average with standart deviation
linnceViewSpk(SpkClips, SubjTag, ChannelTag, AllSf, AllGain, ThresholdMax);

% Showing a window with the spike count and the fire rate
if indChannel <= ExperimentData.nChannels
    % Reseting the information
    set(handles.Variables, 'String', '');
    set(handles.LFPName, 'String', '');
    axes(handles.axes1);
    cla;    
    set(handles.FileAdressView, 'String', '');       
    SpikeDetectionGUI3
end

% % If we have more channels to be analyzed
% if indChannel < ExperimentData.nChannels
%     % Reseting the information
%     set(handles.Variables, 'String', '');
%     set(handles.LFPName, 'String', '');
%     axes(handles.axes1);
%     cla;    
%     set(handles.FileAdressView, 'String', '');
%     SpikeDetectionGUI2
% else
%     % Going to the main menu
%     close all;
%     SpikeParametersGUI
% end
