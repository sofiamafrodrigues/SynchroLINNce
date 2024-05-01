function varargout = SpikeCoincidenceTextGUI(varargin)
% SPIKECOINCIDENCETEXTGUI MATLAB code for SpikeCoincidenceTextGUI.fig
%      SPIKECOINCIDENCETEXTGUI, by itself, creates a new SPIKECOINCIDENCETEXTGUI or raises the existing
%      singleton*.
%
%      H = SPIKECOINCIDENCETEXTGUI returns the handle to a new SPIKECOINCIDENCETEXTGUI or the handle to
%      the existing singleton*.
%
%      SPIKECOINCIDENCETEXTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIKECOINCIDENCETEXTGUI.M with the given input arguments.
%
%      SPIKECOINCIDENCETEXTGUI('Property','Value',...) creates a new SPIKECOINCIDENCETEXTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpikeCoincidenceTextGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpikeCoincidenceTextGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpikeCoincidenceTextGUI

% Last Modified by GUIDE v2.5 27-Dec-2018 11:24:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpikeCoincidenceTextGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpikeCoincidenceTextGUI_OutputFcn, ...
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


% --- Executes just before SpikeCoincidenceTextGUI is made visible.
function SpikeCoincidenceTextGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpikeCoincidenceTextGUI (see VARARGIN)

% Choose default command line output for SpikeCoincidenceTextGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeCoincidenceTextGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikeCoincidenceTextGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

set(gcf, 'Color', 'white');

axes(handles.axes1);
imshow('Explanation - spk coincidence.tif');
axes(handles.axes2);
imshow('LINNce - background.tif');

% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)

close(gcf);

% --- Executes on button press in TextButton.
function TextButton_Callback(hObject, eventdata, handles)

winopen('Explanation - spk coincidence.txt');
