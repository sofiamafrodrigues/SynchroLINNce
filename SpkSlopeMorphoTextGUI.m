function varargout = SpkSlopeMorphoTextGUI(varargin)
% SPKSLOPEMORPHOTEXTGUI MATLAB code for SpkSlopeMorphoTextGUI.fig
%      SPKSLOPEMORPHOTEXTGUI, by itself, creates a new SPKSLOPEMORPHOTEXTGUI or raises the existing
%      singleton*.
%
%      H = SPKSLOPEMORPHOTEXTGUI returns the handle to a new SPKSLOPEMORPHOTEXTGUI or the handle to
%      the existing singleton*.
%
%      SPKSLOPEMORPHOTEXTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPKSLOPEMORPHOTEXTGUI.M with the given input arguments.
%
%      SPKSLOPEMORPHOTEXTGUI('Property','Value',...) creates a new SPKSLOPEMORPHOTEXTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpkSlopeMorphoTextGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpkSlopeMorphoTextGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpkSlopeMorphoTextGUI

% Last Modified by GUIDE v2.5 25-Dec-2018 19:26:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpkSlopeMorphoTextGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpkSlopeMorphoTextGUI_OutputFcn, ...
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


% --- Executes just before SpkSlopeMorphoTextGUI is made visible.
function SpkSlopeMorphoTextGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpkSlopeMorphoTextGUI (see VARARGIN)

% Choose default command line output for SpkSlopeMorphoTextGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpkSlopeMorphoTextGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpkSlopeMorphoTextGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

set(gcf, 'Color', 'white');

axes(handles.axes1);
imshow('Explanation - Spk slope morpho.tif');
axes(handles.axes2);
imshow('LINNce - background.tif');

% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)

close(gcf);


% --- Executes on button press in TextButton.
function TextButton_Callback(hObject, eventdata, handles)

winopen('Explanation - spk slope morpho.txt');
