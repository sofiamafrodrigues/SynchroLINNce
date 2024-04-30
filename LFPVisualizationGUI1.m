function varargout = LFPVisualizationGUI1(varargin)
% LFPVISUALIZATIONGUI1 MATLAB code for LFPVisualizationGUI1.fig
%      LFPVISUALIZATIONGUI1, by itself, creates a new LFPVISUALIZATIONGUI1 or raises the existing
%      singleton*.
%
%      H = LFPVISUALIZATIONGUI1 returns the handle to a new LFPVISUALIZATIONGUI1 or the handle to
%      the existing singleton*.
%
%      LFPVISUALIZATIONGUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LFPVISUALIZATIONGUI1.M with the given input arguments.
%
%      LFPVISUALIZATIONGUI1('Property','Value',...) creates a new LFPVISUALIZATIONGUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LFPVisualizationGUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LFPVisualizationGUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LFPVisualizationGUI1

% Last Modified by GUIDE v2.5 29-Dec-2018 23:39:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LFPVisualizationGUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @LFPVisualizationGUI1_OutputFcn, ...
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


% --- Executes just before LFPVisualizationGUI1 is made visible.
function LFPVisualizationGUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LFPVisualizationGUI1 (see VARARGIN)

% Choose default command line output for LFPVisualizationGUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LFPVisualizationGUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LFPVisualizationGUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% Loading the struct and the variables and obtaining the correct channel index
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
% Saving the index
save('indChannel', 'indChannel');

% Showing to user the actual channel pair number and the total number
set(handles.textbox, 'String', sprintf('Channel %i of %i', indChannel, ExperimentData.nChannels));

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

function nInterestTimes_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function nInterestTimes_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in HaveInterestTimes.
function HaveInterestTimes_Callback(hObject, eventdata, handles)

% If the user wants to plot interest times
HaveInterestTimes = get(handles.HaveInterestTimes, 'Value');
if HaveInterestTimes
    set(handles.nInterestTimes, 'String', '');
else
    set(handles.nInterestTimes, 'String', '0');
end

% --- Executes on button press in OKButton.
function OKButton_Callback(hObject, eventdata, handles)

% Loading the struct and variables
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('indChannel.mat');

% Getting the informations and filling the Experiment Data
stChannel = get(handles.stChannel, 'String');
AllSf = get(handles.AllSf, 'String');
AllSf = str2double(AllSf);
AllGain = get(handles.AllGain, 'String');
AllGain = str2double(AllGain);
nInterestTimes = get(handles.nInterestTimes, 'String');
nInterestTimes = str2double(nInterestTimes);
ExperimentData.ChannelData(indChannel).stChannel = stChannel;
ExperimentData.ChannelData(indChannel).AllSf = AllSf;
ExperimentData.ChannelData(indChannel).AllGain = AllGain;
ExperimentData.ChannelData(indChannel).nInterestTimes = nInterestTimes;

% Saving the updated struct
save(sprintf('ExperimentData_%s', ExperimentData.SubjTag), 'ExperimentData', '-append');

% Checking if exist more channels, to proceed or continue filling
if indChannel <= ExperimentData.nChannels
    % Reseting the informations
    set(handles.stChannel, 'String', '');
    set(handles.nInterestTimes, 'String', '');
    % Initializing one needed count, to help the toolbox to know the actual interest time that will be filled
    count = 0;
    save('count', 'count');
    LFPVisualizationGUI2
end
