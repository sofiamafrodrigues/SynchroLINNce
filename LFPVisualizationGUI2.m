function varargout = LFPVisualizationGUI2(varargin)
% LFPVISUALIZATIONGUI2 MATLAB code for LFPVisualizationGUI2.fig
%      LFPVISUALIZATIONGUI2, by itself, creates a new LFPVISUALIZATIONGUI2 or raises the existing
%      singleton*.
%
%      H = LFPVISUALIZATIONGUI2 returns the handle to a new LFPVISUALIZATIONGUI2 or the handle to
%      the existing singleton*.
%
%      LFPVISUALIZATIONGUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LFPVISUALIZATIONGUI2.M with the given input arguments.
%
%      LFPVISUALIZATIONGUI2('Property','Value',...) creates a new LFPVISUALIZATIONGUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LFPVisualizationGUI2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LFPVisualizationGUI2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LFPVisualizationGUI2

% Last Modified by GUIDE v2.5 29-Dec-2018 23:39:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LFPVisualizationGUI2_OpeningFcn, ...
                   'gui_OutputFcn',  @LFPVisualizationGUI2_OutputFcn, ...
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


% --- Executes just before LFPVisualizationGUI2 is made visible.
function LFPVisualizationGUI2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LFPVisualizationGUI2 (see VARARGIN)

% Choose default command line output for LFPVisualizationGUI2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LFPVisualizationGUI2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = LFPVisualizationGUI2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Plotting the LINNce background logo
axes(handles.axes1);
imshow('LINNce - background.tif');

% Loading the struct and the variables
load('SubjTag.mat');
load(sprintf('ExperimentData_%s', SubjTag));
load('indChannel.mat');
load('count.mat');

% Showing the actual interest time number and total choosed
countExibit = count+1; % because this count starts in 0 and will be always one behind
set(handles.TextBox, 'String', sprintf('Interest time %i of %i', countExibit, ExperimentData.ChannelData(indChannel).nInterestTimes));

function LegendInterestTime_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function LegendInterestTime_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function InterestTime_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function InterestTime_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in OKButton.
function OKButton_Callback(hObject, eventdata, handles)

% Correcting the count index, because it will be always one behind to correct work
load('count.mat');
count = count+1;
save('count', 'count');

% Loading the variables and the structs
load('SubjTag.mat');
load('indChannel.mat');
load(sprintf('ExperimentData_%s', SubjTag));
load('LFP.mat');
load('FilteredPlot.mat');
load('vInterestTimes.mat');
load('sLegendInterestTimes.mat');

% Getting the legend choosed for the interest time
LegendInterestTime = get(handles.LegendInterestTime, 'String');

% Getting the interest time
InterestTime = get(handles.InterestTime, 'String');
InterestTime = str2double(InterestTime);

% Saving this informations to after plot
vInterestTimes(count, indChannel) = InterestTime;
sLegendInterestTimes(count).(ExperimentData.ChannelData(indChannel).stChannel) = LegendInterestTime;
save('vInterestTimes', 'vInterestTimes', '-append');
save('sLegendInterestTimes', 'sLegendInterestTimes', '-append');

% Adding this to the Experiment Data struct and updating the saved version
ExperimentData.ChannelData(indChannel).(LegendInterestTime) = InterestTime;
save(sprintf('ExperimentData_%s', ExperimentData.SubjTag), 'ExperimentData', '-append');

% Reseting the informations
set(handles.LegendInterestTime, 'String', '');
set(handles.InterestTime, 'String', '');

% If there is more interest times, continue filling
if count < ExperimentData.ChannelData(indChannel).nInterestTimes
    LFPVisualizationGUI2
end
if count == ExperimentData.ChannelData(indChannel).nInterestTimes
    close(gcf);
    % If there is no more interest times, continue filling Channel Data
    if indChannel < ExperimentData.nChannels
        LFPVisualizationGUI1
    else
        % If all channel data are filled
        close all;
        LFPVisualizationGUI3
    end
end
