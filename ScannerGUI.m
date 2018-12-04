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

% Last Modified by GUIDE v2.5 03-Dec-2018 13:03:06

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
%setup serial communication
% s=serial('com7','Baudrate',9600);
% s.ReadAsyncMode='manual';
% set(s,'InputBuffersize',2);
% try
%     fopen(s);
% catch err
%     fclose(instrfind);
%     textl=sprintf('Arduino port was not closed');
%     set(handles.text1,'String',textl);
% end
handles.ypos=1;
handles.col=1;
handles.Object=zeros;
v = evalin('base','Test');
handles.Test=v;
textl=sprintf('3D Scanner GUI');
set(handles.text1,'String',textl);
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
     Test=handles.Object;
     [X,Y,Z] = xyz2grid(Test(:,1),Test(:,2),Test(:,3));
     surf(X,Y,Z) 
     shading flat
     camlight

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
Test=handles.Object;
scatter3(Test(:,1),Test(:,2),Test(:,3))
axis equal
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
b_smooth = medfilt2(b,[5 5]));
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
%Recieves values from arduino and stores them in a matrix with xyz format
ypos=handles.ypos;
col=handles.col;
col2=col+4;
Object=handles.Object;
xpos=1;
for c=col:col2 
   Object(c,1)=xpos;
   Object(c,2)=ypos;
   Object(c,3)=5;  
   xpos=xpos+1;
end
handles.col=col+5;
handles.ypos=ypos+1;
handles.Object=Object;
guidata(hObject,handles);

% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
%Save the current matrix with the name in the edit box in the current
%directory
Object=handles.Object;
y = get(handles.edit1,'string');
save(char(y),'Object');
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
%Loads the file with the name in the 
y = get(handles.edit1,'string');
mess = matfile(char(y));
handles.Object = mess.Object;
guidata(hObject,handles);

% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
