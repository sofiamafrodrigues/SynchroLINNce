function varargout = SpikeCoincidenceGUI(varargin)
% SPIKECOINCIDENCEGUI MATLAB code for SpikeCoincidenceGUI.fig
%      SPIKECOINCIDENCEGUI, by itself, creates a new SPIKECOINCIDENCEGUI or raises the existing
%      singleton*.
%
%      H = SPIKECOINCIDENCEGUI returns the handle to a new SPIKECOINCIDENCEGUI or the handle to
%      the existing singleton*.
%
%      SPIKECOINCIDENCEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIKECOINCIDENCEGUI.M with the given input arguments.
%
%      SPIKECOINCIDENCEGUI('Property','Value',...) creates a new SPIKECOINCIDENCEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikeCoincidenceGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikeCoincidenceGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikeCoincidenceGUI

% Last Modified by GUIDE v2.5 27-Dec-2018 11:34:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikeCoincidenceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikeCoincidenceGUI_OutputFcn, ...
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


% --- Executes just before SpikeCoincidenceGUI is made visible.
function SpikeCoincidenceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikeCoincidenceGUI (see VARARGIN)

% Choose default command line output for SpikeCoincidenceGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeCoincidenceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikeCoincidenceGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% Loading the variables and the structs and obtaining the correct index to the struct, to proceed
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load(sprintf('SpkCoincidence_%s.mat', SubjTag));
indChannel = [];
for i = 1:length(SpkCoincidence)
    if isempty(indChannel)
        if isempty(SpkCoincidence(i).Channel_ref)
            indSpkCoincidence = i;
        end
    end
end
% Saving the coincidence index
save('indSpkCoincidence', 'indSpkCoincidence');
% Showing to the user where are the results
set(handles.Results, 'String', sprintf('All graphics are saved and the results are in SpkCoincidence_%s', SubjTag));

function ReferenceChannel_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function ReferenceChannel_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ComparisionChannel_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function ComparisionChannel_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function TimeWindow_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function TimeWindow_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in TextButton.
function TextButton_Callback(hObject, eventdata, handles)

% To see how it works
SpikeCoincidenceTextGUI

% --- Executes on button press in OKButton.
function OKButton_Callback(hObject, eventdata, handles)

% Loading the structs and the variables
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load(sprintf('SpkDetection_%s.mat', SubjTag));
load(sprintf('SpkCoincidence_%s.mat', SubjTag));
load('indSpkCoincidence.mat');

% Getting the reference and the comparision channel
Channel_ref = get(handles.ReferenceChannel, 'String');
Channel_comp = get(handles.ComparisionChannel, 'String');

% Getting the time window to do the analysis
TimeWindow = get(handles.TimeWindow, 'String');
TimeWindow = str2double(TimeWindow);

% Getting the correct indexes, based on the user's choice of reference and comparision
for i = 1:ExperimentData.nChannels
    if strcmp(Channel_ref, ExperimentData.ChannelData(i).stChannel)
        indRef = i;
    end
    if strcmp(Channel_comp, ExperimentData.ChannelData(i).stChannel)
        indComp = i;
    end
end

% Getting the maximum stamps and spike time stamps of the reference and the comparision channel
SpkTimeStamps_ref = SpkDetection(indRef).SpkTimeStamps;
SpkMaxStamps_ref = SpkDetection(indRef).SpkMaxStamps;
SpkTimeStamps_comp = SpkDetection(indComp).SpkTimeStamps;
SpkMaxStamps_comp = SpkDetection(indComp).SpkMaxStamps; 

% Getting the sampling frequencies and the gains
Sf_ref = ExperimentData.ChannelData(indRef).AllSf;
Gain_ref = ExperimentData.ChannelData(indRef).AllGain;
Sf_comp = ExperimentData.ChannelData(indComp).AllSf;
Gain_comp = ExperimentData.ChannelData(indComp).AllGain;

% Getting the analysis times of the channels
TiAnalysis_ref = SpkDetection(indRef).Ti_Analysis;
TfAnalysis_ref = SpkDetection(indRef).Tf_Analysis;
TiAnalysis_comp = SpkDetection(indComp).Ti_Analysis;
TfAnalysis_comp = SpkDetection(indComp).Tf_Analysis; 

% Obtaining the reference record
fileAdress = ExperimentData.ChannelData(indRef).fileAdress;
load(fileAdress);
RecordClip_ref = FilteredRecord((TiAnalysis_ref-0.08)*Sf_ref:(TfAnalysis_ref+0.08)*Sf_ref); % Same size that was used in spike detection

% Obtaining the comparision record
fileAdress = ExperimentData.ChannelData(indComp).fileAdress;
load(fileAdress);  
RecordClip_comp = FilteredRecord((TiAnalysis_comp-0.08)*Sf_comp:(TfAnalysis_comp+0.08)*Sf_comp); % Same size that was used in spike detection

% Selecting the time of analysis, based on the reference channel but respecting the record size
if length(RecordClip_ref) < length(RecordClip_comp)
    TimeOfAnalysis = length(RecordClip_ref)/Sf_ref;
else
    TimeOfAnalysis = length(RecordClip_comp)/Sf_comp;
end

% Filling some informations in the struct
SpkCoincidence(indSpkCoincidence).Channel_ref = Channel_ref;
SpkCoincidence(indSpkCoincidence).Channel_comp = Channel_comp;
SpkCoincidence(indSpkCoincidence).TimeOfAnalysis = TimeOfAnalysis;
SpkCoincidence(indSpkCoincidence).TimeWindow = TimeWindow;

[CoincidenceRate, CoincidenceMaskRef, CoincidenceMaskComp] = linnceCoincidenceSpk(SpkTimeStamps_ref, SpkTimeStamps_comp, TimeWindow); % doing coincidence

[CTMax_ref, CMax_ref, CTMax_comp, CMax_comp, NTMax_ref, NMax_ref, NTMax_comp, NMax_comp] = linnceDataCoincidenceSpk(CoincidenceMaskRef, ...
CoincidenceMaskComp, SpkTimeStamps_ref, SpkMaxStamps_ref, SpkTimeStamps_comp, SpkMaxStamps_comp); % obtaining with the masks the coincidence data

% Filling the struct
SpkCoincidence(indSpkCoincidence).CoincidenceRate = CoincidenceRate;
SpkCoincidence(indSpkCoincidence+1).Channel_ref = []; % creating the next space in the struct field, to be filled if there is more coincidence data

% Visualizating the coincidence
linnceViewCoincidenceSpk(SubjTag, Channel_ref, Channel_comp, RecordClip_ref, RecordClip_comp, Sf_ref, Sf_comp, CTMax_ref, ...
CMax_ref, NTMax_ref, NMax_ref, CTMax_comp, CMax_comp, NTMax_comp, NMax_comp, Gain_ref, Gain_comp, TimeWindow,CoincidenceRate);

% Saving the coincidence results, updating the struct
save(sprintf('SpkCoincidence_%s', SubjTag), 'SpkCoincidence');

% Going to the next analysis
SpikeCoincidenceGUI

% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)

% If the analysis is done

% Loading the variable and the struct
load('SubjTag.mat');
load(sprintf('SpkCoincidence_%s', SubjTag));

% Saving the updated struct
SpkCoincidence = SpkCoincidence(1:length(SpkCoincidence)-1); % excluding the empty space that was not used
save(sprintf('SpkCoincidence_%s', SubjTag), 'SpkCoincidence');

% Going to the spike parameters menu
close all;
SpikeParametersGUI
