function varargout = LFPVisualizationGUI(varargin)
% LFPVISUALIZATIONGUI MATLAB code for LFPVisualizationGUI.fig
%      LFPVISUALIZATIONGUI, by itself, creates a new LFPVISUALIZATIONGUI or raises the existing
%      singleton*.
%
%      H = LFPVISUALIZATIONGUI returns the handle to a new LFPVISUALIZATIONGUI or the handle to
%      the existing singleton*.
%
%      LFPVISUALIZATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LFPVISUALIZATIONGUI.M with the given input arguments.
%
%      LFPVISUALIZATIONGUI('Property','Value',...) creates a new LFPVISUALIZATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LFPVisualizationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LFPVisualizationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LFPVisualizationGUI

% Last Modified by GUIDE v2.5 29-Dec-2018 18:49:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LFPVisualizationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LFPVisualizationGUI_OutputFcn, ...
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


% --- Executes just before LFPVisualizationGUI is made visible.
function LFPVisualizationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LFPVisualizationGUI (see VARARGIN)

% Choose default command line output for LFPVisualizationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LFPVisualizationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LFPVisualizationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

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

% --- Executes on button press in OKButton.
function OKButton_Callback(hObject, eventdata, handles)

% Initializing the Experiment Data struct
ExperimentData = struct('SubjTag', [], 'stGroup', [], 'nChannels', [], 'ChannelData', [], 'ExperimentName', [], 'Madeby', [], ...
    'DateTimeExperiment', []);
ChannelData = struct('stChannel', [], 'AllSf', [], 'AllGain', [], 'nInterestTimes', [], 'indPlot', []);
ExperimentData.ChannelData = ChannelData;

% Initializing and saving the support variables (to help to plot interest times)
vInterestTimes = zeros(1, ExperimentData.nChannels);
save('vInterestTimes', 'vInterestTimes');
sLegendInterestTimes = struct([]);
save('sLegendInterestTimes', 'sLegendInterestTimes');

% Getting the informations and filling the Experiment Data
SubjTag = get(handles.SubjTag, 'String');
stGroup = get(handles.stGroup, 'String');
nChannels = get(handles.nChannels, 'String');
nChannels = str2double(nChannels);
ExperimentData.SubjTag = SubjTag;
ExperimentData.stGroup = stGroup;
ExperimentData.nChannels = nChannels;

% To help getting the correct channel index that will be analyzed
for i = 1:ExperimentData.nChannels
    ExperimentData.ChannelData(i).stChannel = [];
end

% Getting the informations and filling the Experiment Data
fileNameChoosed = get(handles.fileNameChoosed, 'String');
ExperimentData.ExperimentName = fileNameChoosed;
Madeby = get(handles.Madeby, 'String');
ExperimentData.Madeby = Madeby;
DateTimeExperiment = get(handles.DateTimeExperiment, 'String');
ExperimentData.DateTimeExperiment = DateTimeExperiment;

% Saving the Experiment Data and a variable, that will be used by the toolbox
save(sprintf('ExperimentData_%s', ExperimentData.SubjTag), 'ExperimentData');
save('SubjTag', 'SubjTag');

% Going to the next stage
LFPVisualizationGUI1
