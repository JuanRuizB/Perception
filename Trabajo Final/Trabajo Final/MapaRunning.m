function varargout = MapaRunning(varargin)
global direccionActual;
global MAPA;
global codMAPA;
global posSalida;

% MAPARUNNING MATLAB code for MapaRunning.fig
%      MAPARUNNING, by itself, creates a new MAPARUNNING or raises the existing
%      singleton*.
%
%      H = MAPARUNNING returns the handle to a new MAPARUNNING or the handle to
%      the existing singleton*.
%
%      MAPARUNNING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAPARUNNING.M with the given input arguments.
%
%      MAPARUNNING('Property','Value',...) creates a new MAPARUNNING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MapaRunning_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MapaRunning_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MapaRunning

% Last Modified by GUIDE v2.5 16-Jun-2019 14:50:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MapaRunning_OpeningFcn, ...
                   'gui_OutputFcn',  @MapaRunning_OutputFcn, ...
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



% --- Executes just before MapaRunning is made visible.
function MapaRunning_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MapaRunning (see VARARGIN)

% Choose default command line output for MapaRunning
handles.output = hObject;

if nargin<4 || ~isstruct(varargin{1})
    handles.UserData = 'No Input Provided';
else
    handles.UserData = varargin{1};
end

set(handles.edit1,'String','D');

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes MapaRunning wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MapaRunning_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
imshow(handles.UserData.mapa);
varargout{1} = handles.output;

% --- Executes on button press in ACTIONbutton.
function ACTIONbutton_Callback(hObject, eventdata, handles)
global direccionActual;
global MAPA;
global codMAPA;
global posSalida;

if isempty(MAPA) && isempty(codMAPA)
    direccionActual = handles.edit1;
    MAPA = handles.UserData.mapa;
    codMAPA = handles.UserData.codmapa;
    posSalida = find(codMAPA=='S');
    [posSalida(1),posSalida(2)]=ind2sub(size(codMAPA),posSalida);
end
% hObject    handle to ACTIONbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

direccionFutura = reconocedorAH;
[MAPA,codMAPA] = RunMapa(MAPA,handles.UserData.indexPers,handles.UserData.indexFondo,codMAPA,direccionActual,direccionFutura);
imshow(MAPA);
if(direccionFutura ~= 'F')
    direccionActual = direccionFutura;
    set(handles.edit1,'String',direccionActual);
end
posPersonaje = find(codMAPA=='P');
[posPersonaje(1),posPersonaje(2)]=ind2sub(size(codMAPA),posPersonaje);
if(isequal(posPersonaje,posSalida))
    msgbox("Felicidades. Has ganado");
end



% --- Executes on button press in STOPButton.
function STOPButton_Callback(hObject, eventdata, handles)
% hObject    handle to STOPButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq;



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

