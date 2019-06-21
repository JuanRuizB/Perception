function varargout = Panel_Repetir_imagen(varargin)
% PANEL_REPETIR_IMAGEN MATLAB code for Panel_Repetir_imagen.fig
%      PANEL_REPETIR_IMAGEN, by itself, creates a new PANEL_REPETIR_IMAGEN or raises the existing
%      singleton*.
%
%      H = PANEL_REPETIR_IMAGEN returns the handle to a new PANEL_REPETIR_IMAGEN or the handle to
%      the existing singleton*.
%
%      PANEL_REPETIR_IMAGEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PANEL_REPETIR_IMAGEN.M with the given input arguments.
%
%      PANEL_REPETIR_IMAGEN('Property','Value',...) creates a new PANEL_REPETIR_IMAGEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Panel_Repetir_imagen_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Panel_Repetir_imagen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Panel_Repetir_imagen

% Last Modified by GUIDE v2.5 09-Jun-2019 17:00:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Panel_Repetir_imagen_OpeningFcn, ...
                   'gui_OutputFcn',  @Panel_Repetir_imagen_OutputFcn, ...
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


% --- Executes just before Panel_Repetir_imagen is made visible.
function Panel_Repetir_imagen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Panel_Repetir_imagen (see VARARGIN)

% Choose default command line output for Panel_Repetir_imagen
handles.output = hObject;

image(imread('letras.jpg'), 'Parent', handles.axes2);
mymap = [0 0 0
        1 1 1];
colormap(mymap);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Panel_Repetir_imagen wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Panel_Repetir_imagen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Si.
function Si_Callback(hObject, eventdata, handles)
% hObject    handle to Si (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close Panel_Repetir_imagen


% --- Executes on button press in No_repitelaimagen.
function No_repitelaimagen_Callback(hObject, eventdata, handles)
% hObject    handle to No_repitelaimagen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    cam = webcam();
    preview(cam);
    pause();
    closePreview(cam);
    A = snapshot(cam);
    clear('cam');
    gray = rgb2gray(A);
    bin = imbinarize(gray);
    binCuadra = quitarResto(bin);
    figure,imshow(binCuadra)
% Dilatación
    ele = strel('square',4);
    imagen_dilatada = imerode(binCuadra,ele);
    bin1 = quitarBordes(imagen_dilatada);
    imwrite(bin1,'bin.png');
close Panel_Repetir_imagen;
Panel_Repetir_imagen;

