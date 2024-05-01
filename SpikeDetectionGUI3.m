function varargout = SpikeDetectionGUI3(varargin)
% SPIKEDETECTIONGUI3 MATLAB code for SpikeDetectionGUI3.fig
%      SPIKEDETECTIONGUI3, by itself, creates a new SPIKEDETECTIONGUI3 or raises the existing
%      singleton*.
%
%      H = SPIKEDETECTIONGUI3 returns the handle to a new SPIKEDETECTIONGUI3 or the handle to
%      the existing singleton*.
%
%      SPIKEDETECTIONGUI3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIKEDETECTIONGUI3.M with the given input arguments.
%
%      SPIKEDETECTIONGUI3('Property','Value',...) creates a new SPIKEDETECTIONGUI3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikeDetectionGUI3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikeDetectionGUI3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikeDetectionGUI3

% Last Modified by GUIDE v2.5 09-Apr-2024 21:25:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikeDetectionGUI3_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikeDetectionGUI3_OutputFcn, ...
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


% --- Executes just before SpikeDetectionGUI3 is made visible.
function SpikeDetectionGUI3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikeDetectionGUI3 (see VARARGIN)

% Choose default command line output for SpikeDetectionGUI3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeDetectionGUI3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikeDetectionGUI3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

axes(handles.axes1);
imshow('LINNce - background.tif');

load('SubjTag.mat');
load(sprintf('SpkDetection_%s.mat', SubjTag));
load('indChannel.mat');

set(handles.ChannelResult, 'String', sprintf('Channel %s', SpkDetection(indChannel).stChannel));
set(handles.SpkNumberResult, 'String', sprintf('%.f', SpkDetection(indChannel).SpkNumber));
set(handles.SpkFireRateResult, 'String', sprintf('%.3f', SpkDetection(indChannel).SpkFireRate));
set(handles.Results, 'String', sprintf('All graphics are saved and the results are in SpkDetection_%s', SubjTag));

movegui('onscreen');

% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)

load('SubjTag.mat');
load('indChannel.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));

if indChannel < ExperimentData.nChannels
    SpikeDetectionGUI2
else
    close all;
    SpikeParametersGUI
end
