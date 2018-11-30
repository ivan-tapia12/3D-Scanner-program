function varargout = ScannerGUI(varargin)
% SCANNERGUI MATLAB code for ScannerGUI.fig
%      SCANNERGUI, by itself, creates a new SCANNERGUI or raises the existing
%      singleton*.
%
%      H = SCANNERGUI returns the handle to a new SCANNERGUI or the handle to
%      the existing singleton*.
%
%      SCANNERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCANNERGUI.M with the given input arguments.
%
%      SCANNERGUI('Property','Value',...) creates a new SCANNERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ScannerGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ScannerGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ScannerGUI

% Last Modified by GUIDE v2.5 30-Nov-2018 15:18:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ScannerGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ScannerGUI_OutputFcn, ...
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


% --- Executes just before ScannerGUI is made visible.
function ScannerGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ScannerGUI (see VARARGIN)

% Choose default command line output for ScannerGUI
handles.output = hObject;
v = evalin('base','Test');
handles.Test=v;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ScannerGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ScannerGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
     Test=handles.Test;
     [X,Y,Z] = xyz2grid(Test(:,1),Test(:,2),Test(:,3));
     surf(X,Y,Z) 
     shading flat
     camlight

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
handles.l=2;
guidata(hObject, handles);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
