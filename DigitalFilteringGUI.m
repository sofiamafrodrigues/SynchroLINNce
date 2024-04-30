function varargout = DigitalFilteringGUI(varargin)
% DIGITALFILTERINGGUI MATLAB code for DigitalFilteringGUI.fig
%      DIGITALFILTERINGGUI, by itself, creates a new DIGITALFILTERINGGUI or raises the existing
%      singleton*.
%
%      H = DIGITALFILTERINGGUI returns the handle to a new DIGITALFILTERINGGUI or the handle to
%      the existing singleton*.
%
%      DIGITALFILTERINGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIGITALFILTERINGGUI.M with the given input arguments.
%
%      DIGITALFILTERINGGUI('Property','Value',...) creates a new DIGITALFILTERINGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DigitalFilteringGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DigitalFilteringGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DigitalFilteringGUI

% Last Modified by GUIDE v2.5 30-Dec-2018 18:47:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DigitalFilteringGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DigitalFilteringGUI_OutputFcn, ...
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


% --- Executes just before DigitalFilteringGUI is made visible.
function DigitalFilteringGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DigitalFilteringGUI (see VARARGIN)

% Choose default command line output for DigitalFilteringGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DigitalFilteringGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DigitalFilteringGUI_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in OkButton.
function OkButton_Callback(hObject, eventdata, handles)

% Initializing the Experiment Data struct
ExperimentData = struct('SubjTag', [], 'stGroup', [], 'nChannels', [], 'ChannelData', [], 'ExperimentName', [], 'Madeby', [], ...
    'DateTimeExperiment', []);
ChannelData = struct('stChannel', [], 'AllSf', [], 'AllGain', []);
ExperimentData.ChannelData = ChannelData;

% Initializing the Filtered Data struct, just for GUI control, to choose what channel will be filtered
FilteredData = struct('SubjTag', [], 'ChannelData', []);
ChannelFilteredData = struct('stChannel', []);
FilteredData.ChannelData = ChannelFilteredData;

% Getting the information filled by the user and adjusting the data in number type
SubjTag = get(handles.SubjTag, 'String');
stGroup = get(handles.stGroup, 'String');
nChannels = get(handles.nChannels, 'String');
nChannels = str2double(nChannels);

% Filling the Experiment Data struct
ExperimentData.SubjTag = SubjTag;
ExperimentData.stGroup = stGroup;
ExperimentData.nChannels = nChannels;
for i = 1:ExperimentData.nChannels
    % Here we just preallocate the space in the struct, that will be filled in next stages
    ExperimentData.ChannelData(i).stChannel = [];
    % This will be filled as the channels are filtered (control struct)
    FilteredData.ChannelData(i).stChannel = [];
end

% Getting the information filled by the user and filling the Experiment Data struct
fileNameChoosed = get(handles.fileNameChoosed, 'String');
ExperimentData.ExperimentName = fileNameChoosed;
Madeby = get(handles.Madeby, 'String');
ExperimentData.Madeby = Madeby;
DateTimeExperiment = get(handles.DateTimeExperiment, 'String');
ExperimentData.DateTimeExperiment = DateTimeExperiment;

% Saving the structs and a variable that will be used in next stages
save(sprintf('ExperimentData_%s', ExperimentData.SubjTag), 'ExperimentData');
save('FilteredData', 'FilteredData');
save('SubjTag', 'SubjTag');

% Reseting the information filled
set(handles.fileNameChoosed, 'String', '');
set(handles.Madeby, 'String', '');
set(handles.DateTimeExperiment, 'String', '');
set(handles.SubjTag, 'String', '')
set(handles.stGroup, 'String', '')
set(handles.nChannels, 'String', '')

% Going to the next stage
DigitalFilteringGUI1
