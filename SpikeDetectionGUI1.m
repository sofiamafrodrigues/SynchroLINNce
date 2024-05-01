function varargout = SpikeDetectionGUI1(varargin)
% SPIKEDETECTIONGUI1 MATLAB code for SpikeDetectionGUI1.fig
%      SPIKEDETECTIONGUI1, by itself, creates a new SPIKEDETECTIONGUI1 or raises the existing
%      singleton*.
%
%      H = SPIKEDETECTIONGUI1 returns the handle to a new SPIKEDETECTIONGUI1 or the handle to
%      the existing singleton*.
%
%      SPIKEDETECTIONGUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIKEDETECTIONGUI1.M with the given input arguments.
%
%      SPIKEDETECTIONGUI1('Property','Value',...) creates a new SPIKEDETECTIONGUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikeDetectionGUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikeDetectionGUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikeDetectionGUI1

% Last Modified by GUIDE v2.5 21-Dec-2018 17:36:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikeDetectionGUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikeDetectionGUI1_OutputFcn, ...
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


% --- Executes just before SpikeDetectionGUI1 is made visible.
function SpikeDetectionGUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikeDetectionGUI1 (see VARARGIN)

% Choose default command line output for SpikeDetectionGUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeDetectionGUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% Obtaining the correct channel index, to proceed
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
indChannel = [];
for i = 1:ExperimentData.nChannels
    if isempty(indChannel)
        if isempty(ExperimentData.ChannelData(i).stChannel)
            indChannel = i;
        end
    end
end
% Saving the index to be used in the toolbox
save('indChannel', 'indChannel');

% Showing to user the actual channel number and the total number
set(handles.textbox, 'String', sprintf('Channel %i of %i', indChannel, ExperimentData.nChannels));

% --- Outputs from this function are returned to the command line.
function varargout = SpikeDetectionGUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

function stChannel_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function stChannel_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function AllSf_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function AllSf_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function AllGain_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function AllGain_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in OKbutton.
function OKbutton_Callback(hObject, eventdata, handles)

% Loading the struct and the variables
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('indChannel.mat');

% Getting the information filled by the user and filling the Experiment Data struct
stChannel = get(handles.stChannel, 'String');
AllSf = get(handles.AllSf, 'String');
AllSf = str2double(AllSf);
AllGain = get(handles.AllGain, 'String');
AllGain = str2double(AllGain);
ExperimentData.ChannelData(indChannel).stChannel = stChannel;
ExperimentData.ChannelData(indChannel).AllSf = AllSf;
ExperimentData.ChannelData(indChannel).AllGain = AllGain;

% Saving the updated struct
save(sprintf('ExperimentData_%s', ExperimentData.SubjTag), 'ExperimentData', '-append');

% Checking if exist more channels, to proceed or continue filling
if indChannel < ExperimentData.nChannels
    % Reseting just the channel information filled by the user
    set(handles.stChannel, 'String', '');
    SpikeDetectionGUI1
else
    % Proceeding to the next stage
    close all;
    SpikeDetectionGUI2
end
