function varargout = SpikeParametersGUI(varargin)
% SPIKEPARAMETERSGUI MATLAB code for SpikeParametersGUI.fig
%      SPIKEPARAMETERSGUI, by itself, creates a new SPIKEPARAMETERSGUI or raises the existing
%      singleton*.
%
%      H = SPIKEPARAMETERSGUI returns the handle to a new SPIKEPARAMETERSGUI or the handle to
%      the existing singleton*.
%
%      SPIKEPARAMETERSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIKEPARAMETERSGUI.M with the given input arguments.
%
%      SPIKEPARAMETERSGUI('Property','Value',...) creates a new SPIKEPARAMETERSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikeParametersGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikeParametersGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikeParametersGUI

% Last Modified by GUIDE v2.5 25-Dec-2018 10:18:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikeParametersGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikeParametersGUI_OutputFcn, ...
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


% --- Executes just before SpikeParametersGUI is made visible.
function SpikeParametersGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikeParametersGUI (see VARARGIN)

% Choose default command line output for SpikeParametersGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeParametersGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikeParametersGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% --- Executes on button press in MorphoButton.
function MorphoButton_Callback(hObject, eventdata, handles)

% Loading the variables and the struct
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));

% Initializing the struct that will contain the results of spike slope morphology
SpkSlopeMorpho = struct('stChannel', [], 'SpkClip', [], 'SpkSlope', [], 'SlopeUp', [], 'SlopeDown', [], 'AmpUp', [], 'AmpDown', [], 'AmpAvg', []);
for i = 1:ExperimentData.nChannels
    SpkSlopeMorpho(i).stChannel = [];
end

% Saving the struct
save(sprintf('SpkSlopeMorpho_%s', SubjTag), 'SpkSlopeMorpho');

% Proceeding to spike slope morphology
close all;
SpkSlopeMorphoGUI

% --- Executes on button press in CoincidenceButton.
function CoincidenceButton_Callback(hObject, eventdata, handles)

% Loading the variables and the struct
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));

% Initializing the struct that will contain the results of spike coincidence
SpkCoincidence = struct('Channel_ref', [], 'Channel_comp', [], 'TimeWindow', [], 'CoincidenceRate', [], 'TimeOfAnalysis', []);

% Saving the struct
save(sprintf('SpkCoincidence_%s', SubjTag), 'SpkCoincidence');

% Proceeding to spike coincidence
close all;
SpikeCoincidenceGUI

% --- Executes on button press in SignalButton.
function SignalButton_Callback(hObject, eventdata, handles)

% Going to main menu
close all;
SignalProcessingGUI
