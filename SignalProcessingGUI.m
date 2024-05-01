function varargout = SignalProcessingGUI(varargin)
% SIGNALPROCESSINGGUI MATLAB code for SignalProcessingGUI.fig
%      SIGNALPROCESSINGGUI, by itself, creates a new SIGNALPROCESSINGGUI or raises the existing
%      singleton*.
%
%      H = SIGNALPROCESSINGGUI returns the handle to a new SIGNALPROCESSINGGUI or the handle to
%      the existing singleton*.
%
%      SIGNALPROCESSINGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGNALPROCESSINGGUI.M with the given input arguments.
%
%      SIGNALPROCESSINGGUI('Property','Value',...) creates a new SIGNALPROCESSINGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SignalProcessingGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SignalProcessingGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SignalProcessingGUI

% Last Modified by GUIDE v2.5 30-Dec-2018 18:17:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SignalProcessingGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SignalProcessingGUI_OutputFcn, ...
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


% --- Executes just before SignalProcessingGUI is made visible.
function SignalProcessingGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SignalProcessingGUI (see VARARGIN)

% Choose default command line output for SignalProcessingGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SignalProcessingGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = SignalProcessingGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

set(gcf, 'Color', 'white');

axes(handles.axes1);
imshow('logo - LINNce.tif');
axes(handles.axes2);
imshow('logo ufsj.tif');
axes(handles.axes3);
imshow('brain.png');

% --- Executes on button press in DigitalFilteringBotton.
function DigitalFilteringBotton_Callback(hObject, eventdata, handles)

DigitalFilteringGUI

% --- Executes on button press in CorrelationAnalysisBotton.
function CorrelationAnalysisBotton_Callback(hObject, eventdata, handles)

CorrelationAnalysisGUI

% --- Executes on button press in SpkDetectionBotton.
function SpkDetectionBotton_Callback(hObject, eventdata, handles)

SpikeDetectionGUI

% --- Executes on button press in LFPVisualizationBottom.
function LFPVisualizationBottom_Callback(hObject, eventdata, handles)

LFPVisualizationGUI

% --- Executes on button press in ExitBottom.
function ExitBottom_Callback(hObject, eventdata, handles)

close all;
