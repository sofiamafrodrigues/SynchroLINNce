function varargout = LFPVisualizationGUI3(varargin)
% LFPVISUALIZATIONGUI3 MATLAB code for LFPVisualizationGUI3.fig
%      LFPVISUALIZATIONGUI3, by itself, creates a new LFPVISUALIZATIONGUI3 or raises the existing
%      singleton*.
%
%      H = LFPVISUALIZATIONGUI3 returns the handle to a new LFPVISUALIZATIONGUI3 or the handle to
%      the existing singleton*.
%
%      LFPVISUALIZATIONGUI3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LFPVISUALIZATIONGUI3.M with the given input arguments.
%
%      LFPVISUALIZATIONGUI3('Property','Value',...) creates a new LFPVISUALIZATIONGUI3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LFPVisualizationGUI3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LFPVisualizationGUI3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LFPVisualizationGUI3

% Last Modified by GUIDE v2.5 29-Dec-2018 21:13:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LFPVisualizationGUI3_OpeningFcn, ...
                   'gui_OutputFcn',  @LFPVisualizationGUI3_OutputFcn, ...
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


% --- Executes just before LFPVisualizationGUI3 is made visible.
function LFPVisualizationGUI3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LFPVisualizationGUI3 (see VARARGIN)

% Choose default command line output for LFPVisualizationGUI3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LFPVisualizationGUI3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LFPVisualizationGUI3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% Loading the variables and the struct and obtaining the correct channel index
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
indPlot = [];
for i = 1:ExperimentData.nChannels
    if isempty(indPlot)
        if isempty(ExperimentData.ChannelData(i).indPlot)
            indPlot = i;
        end
    end
end
% Saving the index
save('indPlot', 'indPlot');

% Showing to user the actual channel pair number and the total number
set(handles.FirstTextBox, 'String', sprintf('Channel %i of %i', indPlot, ExperimentData.nChannels));

% Showing to user the actual channel name, to know what is the channel file selection
set(handles.SecondTextBox, 'String', sprintf('Selecting the %s file:', ExperimentData.ChannelData(indPlot).stChannel));

% --- Executes on button press in FilteredPlot.
function FilteredPlot_Callback(hObject, eventdata, handles)

FilteredPlot = get(handles.FilteredPlot, 'Value');
save('FilteredPlot', 'FilteredPlot');

% --- Executes on button press in SelectFile.
function SelectFile_Callback(hObject, eventdata, handles)

% Getting the channel file adress by user selection
fileAdress = uigetfile();

% Loading the variables and the struct
load('SubjTag.mat');
load('indPlot.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
insideFile = who('-file', sprintf('%s',fileAdress)); % Getting the file content
ExperimentData.ChannelData(indPlot).fileAdress = fileAdress; % Saving the file adress into the struct
save(sprintf('ExperimentData_%s', SubjTag), 'ExperimentData', '-append'); % Saving the updated Experiment Data struct
set(handles.ListBox, 'String', insideFile); % Showing the file content
set(handles.FileAdressView, 'String', sprintf('File adress: %s', fileAdress));

% --- Executes on selection change in ListBox.
function ListBox_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function ListBox_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function LFPName_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function LFPName_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in OKButton.
function PlotButton_Callback(hObject, eventdata, handles)

% Loading the variavbles and the structs
load('SubjTag.mat');
load(sprintf('ExperimentData_%s.mat', SubjTag));
load('indPlot.mat');
load('FilteredPlot.mat');
load('vInterestTimes.mat');
load('sLegendInterestTimes.mat');

% Getting the channel record
LFPName = get(handles.LFPName, 'String');
LFP = load(ExperimentData.ChannelData(indPlot).fileAdress, sprintf('%s', LFPName));
LFP = LFP.(LFPName);
save('LFP', 'LFP');

% Indication that what channel was plotted
ExperimentData.ChannelData(indPlot).indPlot = 1; % just filled with 1 to indication
save(sprintf('ExperimentData_%s', SubjTag), 'ExperimentData', '-append'); % saving the updated struct

% Getting sampling frequency and gain
AllSf = ExperimentData.ChannelData(indPlot).AllSf;
AllGain = ExperimentData.ChannelData(indPlot).AllGain;

% Adjustment in channel record
LFP = LFP/AllGain; % correcting by the gain
LFP = LFP*1000; % to plot in mV

linnceLFPChannelView(SubjTag, indPlot, LFP, AllGain, AllSf, FilteredPlot, vInterestTimes, sLegendInterestTimes); % visualizing 

% If there is more channel records
if indPlot < ExperimentData.nChannels
    % Reseting the informations
    set(handles.ListBox, 'String', '');
    set(handles.LFPName, 'String', '');
    set(handles.FileAdressView, 'String', '');
    LFPVisualizationGUI3
end

% If the user visualized all channel records
if indPlot == ExperimentData.nChannels
    % Going to main menu
    SignalProcessingGUI
end
