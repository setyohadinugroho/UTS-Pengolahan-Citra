function varargout = UTS_GUI_Pengolah_Citra(varargin)
% UTS_GUI_PENGOLAH_CITRA MATLAB code for UTS_GUI_Pengolah_Citra.fig
%      UTS_GUI_PENGOLAH_CITRA, by itself, creates a new UTS_GUI_PENGOLAH_CITRA or raises the existing
%      singleton*.
%
%      H = UTS_GUI_PENGOLAH_CITRA returns the handle to a new UTS_GUI_PENGOLAH_CITRA or the handle to
%      the existing singleton*.
%
%      UTS_GUI_PENGOLAH_CITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTS_GUI_PENGOLAH_CITRA.M with the given input arguments.
%
%      UTS_GUI_PENGOLAH_CITRA('Property','Value',...) creates a new UTS_GUI_PENGOLAH_CITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UTS_GUI_Pengolah_Citra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UTS_GUI_Pengolah_Citra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UTS_GUI_Pengolah_Citra

% Last Modified by GUIDE v2.5 06-May-2021 23:07:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UTS_GUI_Pengolah_Citra_OpeningFcn, ...
                   'gui_OutputFcn',  @UTS_GUI_Pengolah_Citra_OutputFcn, ...
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


% --- Executes just before UTS_GUI_Pengolah_Citra is made visible.
function UTS_GUI_Pengolah_Citra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UTS_GUI_Pengolah_Citra (see VARARGIN)

% Choose default command line output for UTS_GUI_Pengolah_Citra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UTS_GUI_Pengolah_Citra wait for user response (see UIRESUME)
% uiwait(handles.figure1);
buat_axes = axes('unit', 'normalized', 'position', [0 0  1 1]);
set(buat_axes, 'handlevisibility', 'off', 'visible', 'off')

% --- Outputs from this function are returned to the command line.
function varargout = UTS_GUI_Pengolah_Citra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.png;*.jpg;*.tif','Files of type (*.png,*.jpg,*.tif)');
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    [~,~,m] = size(Img);
    if m == 3
        axes(handles.axes1)
        imshow(Img)
    else
        msgbox('Silahkan pilih Citra RGB')
    end
else
    return;
end
handles.Img = Img;
guidata(hObject,handles);
 
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',1)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

% Menampilkan gambar RGB yg sudah dipilih
Img = handles.Img;
axes(handles.axes2)
imshow(Img)
title('Citra RGB')
ax = gca;
ax.FontSize = 8;

R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

% Menampilkan histogram RGB
axes(handles.axes3)
cla('reset')
h = histogram(R(:));
h.FaceColor = [1 0 0];
xlim([0 255])
grid on
hold on
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255])

h = histogram(B(:));
h.FaceColor = [0 0 1];
xlim([0 255])
hold off
title('Histogram')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',1)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

% Untuk merubah gambar RGB menjadi layer Red
Red_Channel = cat(3,R,G*0,B*0);
axes(handles.axes2)
cla('reset')
imshow(Red_Channel)
title('Citra Layer Red')
ax = gca;
ax.FontSize = 8;

% Menampilkan Histogram layer Red
axes(handles.axes3)
cla('reset')
h = histogram(R(:));
h.FaceColor = [1 0 0];
xlim([0 255])
grid on
title('Histogram')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',1)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

% Untuk merubah gambar RGB menjadi layer Green
Green_Channel = cat(3,R*0,G,B*0);
axes(handles.axes2)
cla('reset')
imshow(Green_Channel)
title('Citra Layer Green')
ax = gca;
ax.FontSize = 8;

% Menampilkan Histogram layer Green
axes(handles.axes3)
cla('reset')
h = histogram(G(:));
h.FaceColor = [0 1 0];
xlim([0 255])
grid on
title('Histogram')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',1)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;
R = Img(:,:,1);
G = Img(:,:,2);
B = Img(:,:,3);

% Untuk merubah gambar RGB menjadi layer Blue
Blue_Channel = cat(3,R*0,G*0,B);
axes(handles.axes2)
cla('reset')
imshow(Blue_Channel)
title('Citra Layer Blue')
ax = gca;
ax.FontSize = 8;

% Menampilkan Histogram layer Blue
axes(handles.axes3)
cla('reset')
h = histogram(B(:));
h.FaceColor = [0 0 1];
xlim([0 255])
grid on
title('Histogram')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',1)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;

% Untuk merubah gambar RGB menjadi Grayscale
Gray = rgb2gray(Img);
axes(handles.axes2)
cla('reset')
imshow(Gray)
title('Citra Grayscale')
ax = gca;
ax.FontSize = 8;

% Menampilkan Histogram Citra Grayscale
axes(handles.axes3)
cla('reset')
h = histogram(Gray(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram')
ax = gca;
ax.FontSize = 8;

handles.Gray = Gray;
guidata(hObject,handles)

% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',1)

Img = handles.Img;

% Untuk merubah gambar RGB menjadi Grayscale 
Gray = rgb2gray(Img);
 
axes(handles.axes2)
cla('reset')
imshow(Gray)
title('Citra Grayscale')
ax = gca;
ax.FontSize = 8;

% Untuk merubah Graysacle menjadi BIner 
thresh = graythresh(Gray);
bw = im2bw(Gray,thresh);

axes(handles.axes3)
cla('reset')
imshow(bw)
title('Citra Biner')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',1)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;
Gray = rgb2gray(Img);
I_adjust = histeq(Gray);

axes(handles.axes1)
cla('reset')
imshow(Gray)
title('Sebelum Perataan Kontras')
ax = gca;
ax.FontSize = 8;

axes(handles.axes2)
cla('reset')
imshow(I_adjust)
title('Hasil Perataan Kontras')
ax = gca;
ax.FontSize = 8;

axes(handles.axes3)
h = histogram(I_adjust(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram Hasil Perataan')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',1)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;
Gray = rgb2gray(Img);
I_adjust = imadjust(Gray,[40/255 204/255],[0/255 255/255]);

axes(handles.axes1)
cla('reset')
imshow(Gray)
title('Sebelum Penambahan Kontras')
ax = gca;
ax.FontSize = 8;

axes(handles.axes2)
cla('reset')
imshow(I_adjust)
title('Hasil Penambahan Kontras')
ax = gca;
ax.FontSize = 8;

axes(handles.axes3)
h = histogram(I_adjust(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram Hasil Penambahan')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',1)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;
Gray = rgb2gray(Img);
I_adjust = imadjust(Gray,[0 0.2],[0.5 1]);

axes(handles.axes1)
cla('reset')
imshow(Gray)
title('Sebelum Penurunan Kontras')
ax = gca;
ax.FontSize = 8;

axes(handles.axes2)
cla('reset')
imshow(I_adjust)
title('Hasil Penurunan Kontras')
ax = gca;
ax.FontSize = 8;

axes(handles.axes3)
h = histogram(I_adjust(:));
h.FaceColor = [0.5 0.5 0.5];
xlim([0 255])
grid on
title('Histogram Hasil Penurunan')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',1)
set(handles.radiobutton10,'Value',0)

Img = handles.Img;
Gray = rgb2gray(Img);
I_adjust=imnoise(Gray,'salt & pepper',0.02);
I_Med=medfilt2(I_adjust,[3 3]);

axes(handles.axes1)
cla('reset')
imshow(Gray)
title('Citra Asal dalam Grayscale')
ax = gca;
ax.FontSize = 8;

axes(handles.axes2)
cla('reset')
imshow(I_adjust)
title('Penambahan Noise Salt & Paper')
ax = gca;
ax.FontSize = 8;
 
axes(handles.axes3)
cla('reset')
imshow(I_Med)
title('Hasil Median Filter 3x3')
ax = gca;
ax.FontSize = 8;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
set(handles.radiobutton7,'Value',0)
set(handles.radiobutton8,'Value',0)
set(handles.radiobutton9,'Value',0)
set(handles.radiobutton10,'Value',0)
axes(handles.axes1); cla reset;
axes(handles.axes2); cla reset; 
axes(handles.axes3); cla reset;
