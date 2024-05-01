function varargout = SpikeDetectionGUI(varargin)
% SpikeDetectionGUI MATLAB code for SpikeDetectionGUI.fig
%      SpikeDetectionGUI, by itself, creates a new SpikeDetectionGUI or raises the existing
%      singleton*.
%
%      H = SpikeDetectionGUI returns the handle to a new SpikeDetectionGUI or the handle to
%      the existing singleton*.
%
%      SpikeDetectionGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SpikeDetectionGUI.M with the given input arguments.
%
%      SpikeDetectionGUI('Property','Value',...) creates a new SpikeDetectionGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikeDetectionGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikeDetectionGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikeDetectionGUI

% Last Modified by GUIDE v2.5 23-Dec-2018 11:44:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikeDetectionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikeDetectionGUI_OutputFcn, ...
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


% --- Executes just before SpikeDetectionGUI is made visible.
function SpikeDetectionGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikeDetectionGUI (see VARARGIN)

% Choose default command line output for SpikeDetectionGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeDetectionGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikeDetectionGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% --- Executes on button press in GoDigitalFiltering.
function GoDigitalFiltering_Callback(hObject, eventdata, handles)

% If the user don't have filtered records to use in the analysis
GoDigitalFiltering = get(handles.GoDigitalFiltering, 'Value');
if GoDigitalFiltering
    DigitalFilteringGUI
end

function fileNameChoosed_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function fileNameChoosed_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Madeby_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function Madeby_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DateTimeExperiment_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function DateTimeExperiment_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SubjTag_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function SubjTag_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function stGroup_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function stGroup_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function nChannels_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function nChannels_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function typeFilter_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function typeFilter_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in OKButton.
function OKButton_Callback(hObject, eventdata, handles)

% Initializing the structs that will be used
ExperimentData = struct('SubjTag', [], 'stGroup', [], 'nChannels', [], 'typeFilter', [], 'ChannelData', [], 'ExperimentName', [], 'Madeby', [], ...
    'DateTimeExperiment', []);
ChannelData = struct('stChannel', [], 'AllSf', [], 'AllGain', []);
SpkDetection = struct('stChannel', [], 'SpkNumber', [], 'SpkFireRate', [], 'Ti_Analysis', [], 'Tf_Analysis', [], 'SpkTimeStamps', [], 'SpkMaxStamps', [], ...
    'SpkClips', [], 'ThresholdMax', [], 'DeltaTMin', [], 'AmpCutMin', []);
ExperimentData.ChannelData = ChannelData;

% Getting the informations and filling the Experiment Data
SubjTag = get(handles.SubjTag, 'String');
stGroup = get(handles.stGroup, 'String');
nChannels = get(handles.nChannels, 'String');
nChannels = str2double(nChannels);
typeFilter = get(handles.typeFilter, 'String');
ExperimentData.SubjTag = SubjTag;
ExperimentData.stGroup = stGroup;
ExperimentData.nChannels = nChannels;
ExperimentData.typeFilter = typeFilter;

% To help getting the correct channel index that will be analyzed
for i = 1:ExperimentData.nChannels
    ExperimentData.ChannelData(i).stChannel = [];
    SpkDetection(i).stChannel = [];
end

% Getting the informations and filling the Experiment Data
fileNameChoosed = get(handles.fileNameChoosed, 'String');
ExperimentData.ExperimentName = fileNameChoosed;
Madeby = get(handles.Madeby, 'String');
ExperimentData.Madeby = Madeby;
DateTimeExperiment = get(handles.DateTimeExperiment, 'String');
ExperimentData.DateTimeExperiment = DateTimeExperiment;

% Saving the structs and the variable that will be used in the toolbox
save(sprintf('ExperimentData_%s', ExperimentData.SubjTag), 'ExperimentData');
save(sprintf('SpkDetection_%s', ExperimentData.SubjTag), 'SpkDetection');
save('SubjTag', 'SubjTag');

% Going to the next stage
SpikeDetectionGUI1
