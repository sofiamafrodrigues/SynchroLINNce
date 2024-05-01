function varargout = SpkSlopeMorphoGUI(varargin)
% SPKSLOPEMORPHOGUI MATLAB code for SpkSlopeMorphoGUI.fig
%      SPKSLOPEMORPHOGUI, by itself, creates a new SPKSLOPEMORPHOGUI or raises the existing
%      singleton*.
%
%      H = SPKSLOPEMORPHOGUI returns the handle to a new SPKSLOPEMORPHOGUI or the handle to
%      the existing singleton*.
%
%      SPKSLOPEMORPHOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPKSLOPEMORPHOGUI.M with the given input arguments.
%
%      SPKSLOPEMORPHOGUI('Property','Value',...) creates a new SPKSLOPEMORPHOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SpkSlopeMorphoGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SpkSlopeMorphoGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SpkSlopeMorphoGUI

% Last Modified by GUIDE v2.5 25-Dec-2018 11:24:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SpkSlopeMorphoGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SpkSlopeMorphoGUI_OutputFcn, ...
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


% --- Executes just before SpkSlopeMorphoGUI is made visible.
function SpkSlopeMorphoGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SpkSlopeMorphoGUI (see VARARGIN)

% Choose default command line output for SpkSlopeMorphoGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpkSlopeMorphoGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpkSlopeMorphoGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% Loading the variables and the structs and obtaining the correct channel index, to proceed
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load(sprintf('SpkDetection_%s.mat', SubjTag));
load(sprintf('SpkSlopeMorpho_%s.mat', SubjTag));
indChannel = [];
for i = 1:ExperimentData.nChannels
    if isempty(indChannel)
        if isempty(SpkSlopeMorpho(i).stChannel)
            indChannel = i;
        end
    end
end
% Saving the channel index
save('indChannel', 'indChannel');

% Showing to user the actual channel pair number and the total number
set(handles.FirstTextBox, 'String', sprintf('Channel %i of %i', indChannel, ExperimentData.nChannels));

% Showing to user the actual channel name, to know what is the channel file selection
set(handles.SecondTextBox, 'String', sprintf('Calculating parameters for %s', ExperimentData.ChannelData(indChannel).stChannel));

set(handles.Results, 'String', sprintf('All the graphics will be saved and the results are in SpkSlopeMorpho_%s', SubjTag));

% Getting the channel name and filling the struct
SpkSlopeMorpho(indChannel).stChannel = ExperimentData.ChannelData(indChannel).stChannel;
ChannelTag = ExperimentData.ChannelData(indChannel).stChannel;
ChannelTag = char(ChannelTag);

% Obtaining the average spike clip
SpkSlopeMorpho(indChannel).SpkClip = mean(SpkDetection(indChannel).SpkClips);
SpkClip = SpkSlopeMorpho(indChannel).SpkClip;

% Obtaining sampling frequency and gain
AllSf = ExperimentData.ChannelData(indChannel).AllSf;
AllGain = ExperimentData.ChannelData(indChannel).AllGain;

[SpkSlope, SlopeUp, SlopeDown, AmpUp, AmpDown, AmpAvg] = linnceSpkSlopeMorpho(SpkClip, AllSf, AllGain); % doing the spike slope morphology

% Filling the struct with the results
SpkSlopeMorpho(indChannel).SpkSlope = SpkSlope;
SpkSlopeMorpho(indChannel).SlopeUp = SlopeUp;
SpkSlopeMorpho(indChannel).SlopeDown = SlopeDown;
SpkSlopeMorpho(indChannel).AmpUp = AmpUp;
SpkSlopeMorpho(indChannel).AmpDown = AmpDown;
SpkSlopeMorpho(indChannel).AmpAvg = AmpAvg;

% Showing the results to the user
set(handles.SpkSlopeResult, 'String', sprintf('%.3f V/s', SpkSlope));
set(handles.SlopeUpResult, 'String', sprintf('%.3f V/s', SlopeUp));
set(handles.SlopeDownResult, 'String', sprintf('%.3f V/s', SlopeDown));
% Adjustment and padronization in mV, just for preference
AmpAvgResult = AmpAvg*1000; 
AmpUpResult = AmpUp*1000;
AmpDownResult = AmpDown*1000;
set(handles.AmpAvgResult, 'String', sprintf('%.3f mV', AmpAvgResult));
set(handles.AmpUpResult, 'String', sprintf('%.3f mV', AmpUpResult));
set(handles.AmpDownResult, 'String', sprintf('%.3f mV', AmpDownResult));

% Visualizating the spike slope morphology
linnceViewSpkSlopeMorpho(SubjTag, ChannelTag, SpkClip, AmpUp, AmpDown, AmpAvg, AllSf, AllGain);

save(sprintf('SpkSlopeMorpho_%s', SubjTag), 'SpkSlopeMorpho');

movegui('onscreen');

% --- Executes on button press in TextButton.
function TextButton_Callback(hObject, eventdata, handles)

% To see how it works
SpkSlopeMorphoTextGUI

% --- Executes on button press in OKButton.
function OKButton_Callback(hObject, eventdata, handles)

% Loading the variables and the struct
load('indChannel.mat');
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));

% If exists more channels to be analyzed
if indChannel < ExperimentData.nChannels
    % Reseting the information
    set(handles.SpkSlopeResult, 'String', '');
    set(handles.SlopeUpResult, 'String', '');
    set(handles.SlopeDownResult, 'String', '');
    set(handles.AmpAvgResult, 'String', '');
    set(handles.AmpUpResult, 'String', '');
    set(handles.AmpDownResult, 'String', '');    
    SpkSlopeMorphoGUI
else
    % Going to the menuof spike parameters
    close all;
    SpikeParametersGUI
end
