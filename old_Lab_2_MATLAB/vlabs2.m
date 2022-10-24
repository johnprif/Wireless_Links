function varargout = vlabs2(varargin)
% VLABS2 M-file for vlabs2.fig
%      VLABS2, by itself, creates a new VLABS2 or raises the existing
%      singleton*.
%
%      H = VLABS2 returns the handle to a new VLABS2 or the handle to
%      the existing singleton*.
%
%      VLABS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VLABS2.M with the given input arguments.
%
%      VLABS2('Property','Value',...) creates a new VLABS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vlabs2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vlabs2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vlabs2

% Last Modified by GUIDE v2.5 30-Nov-2010 20:15:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vlabs2_OpeningFcn, ...
                   'gui_OutputFcn',  @vlabs2_OutputFcn, ...
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


% --- Executes just before vlabs2 is made visible.
function vlabs2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vlabs2 (see VARARGIN)

% Choose default command line output for vlabs2
handles.output = hObject;
%handles=makeresizable(hObject,handles);
handles=initGUI2(hObject, handles);

handles.TSimModelHandler3DRealm=1;%TSimModelHandler('vrWorldVlab2',false,false);
x=vrworld('myworld.wrl');
%set(x, 'Description', 'VLABS2 - 3D viewer');
handles.xviewer=x;
open(x);
linesvisible(false);
handles.vrfigureobj=view(x);
%handles.agent=TSimModelHandler('rayleighAWGN',false,false);  
handles=UpdateVRandStaticTexts(hObject, handles, handles.TSimModelHandler3DRealm );
modPopmenu_Callback(handles.modPopmenu, eventdata, handles);
setcarpos( 90 );

uiwait(msgbox('The 3D viewer is intended for visual inspection of your settings only. Press OK to close the 3D viewer and proceed. You can open it again any time via the menu (3D viewer).','modal'));
close(handles.vrfigureobj);
%handles.TSimModelHandler3DRealm.pauseSimul();
%handles.TSimModelHandler3DRealm.unpauseSimul();

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vlabs2 wait for user response (see UIRESUME)
% uiwait(handles.MainFigureOfVlabs2);


% --- Outputs from this function are returned to the command line.
function varargout = vlabs2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function Losslider_Callback(hObject, eventdata, handles)
% hObject    handle to Losslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Losslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Losslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Hslider_Callback(hObject, eventdata, handles)
% hObject    handle to Hslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function Hslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Elslider_Callback(hObject, eventdata, handles)
% hObject    handle to Elslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Elslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Elslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Azslider_Callback(hObject, eventdata, handles)
% hObject    handle to Azslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Azslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Azslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Horslider_Callback(hObject, eventdata, handles)
% hObject    handle to Horslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Horslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Horslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Distslider_Callback(hObject, eventdata, handles)
% hObject    handle to Distslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Distslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Distslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Wideslider_Callback(hObject, eventdata, handles)
% hObject    handle to Wideslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Wideslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wideslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when user attempts to close MainFigureOfVlabs2.
function MainFigureOfVlabs2_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to MainFigureOfVlabs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%handles.TSimModelHandler3DRealm.close;
%delete('sl_customization.m');
%sl_refresh_customizations;

%handles.TSimModelHandler3DRealm.close();
close(vrwho);
vrclose;
delete(hObject);
%clc;



% --- Executes on slider movement.
function Speedslider_Callback(hObject, eventdata, handles)
% hObject    handle to Speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Speedslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Speedslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in Speedunitspop.
function Speedunitspop_Callback(hObject, eventdata, handles)
% hObject    handle to Speedunitspop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Speedunitspop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Speedunitspop
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Speedunitspop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Speedunitspop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Receiverantennapop.
function Receiverantennapop_Callback(hObject, eventdata, handles)
% hObject    handle to Receiverantennapop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Receiverantennapop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Receiverantennapop
           %handles.environment.Receiver=TNode;
                 i=get(handles.Receiverantennapop,'Value');
                 Vals=get(handles.Receiverantennapop,'String');
                 eval(sprintf('handles.environment.Receiver.Antenna=%s;',handles.antennaLookupTable.get(Vals{i})));
                 handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Receiverantennapop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Receiverantennapop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Powerslider_Callback(hObject, eventdata, handles)
% hObject    handle to Powerslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Powerslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Powerslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in Powerunitspop.
function Powerunitspop_Callback(hObject, eventdata, handles)
% hObject    handle to Powerunitspop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Powerunitspop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Powerunitspop
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Powerunitspop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Powerunitspop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Senderantennatypepop.
function Senderantennatypepop_Callback(hObject, eventdata, handles)
% hObject    handle to Senderantennatypepop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Senderantennatypepop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Senderantennatypepop
%           handles.environment.Sender=TNode;
%                 handles.environment.Sender.Signal=TSignal;

i=get(handles.Senderantennatypepop,'Value');
Vals=get(handles.Senderantennatypepop,'String');
eval(sprintf('handles.environment.Sender.Antenna=%s;',handles.antennaLookupTable.get(Vals{i})));
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );                 
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Senderantennatypepop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Senderantennatypepop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Freqslider_Callback(hObject, eventdata, handles)
% hObject    handle to Freqslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Freqslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Freqslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in Frequnitspop.
function Frequnitspop_Callback(hObject, eventdata, handles)
% hObject    handle to Frequnitspop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Frequnitspop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Frequnitspop
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Frequnitspop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Frequnitspop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Mediumtypepop.
function Mediumtypepop_Callback(hObject, eventdata, handles)
% hObject    handle to Mediumtypepop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Mediumtypepop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Mediumtypepop
           i=get(handles.Mediumtypepop,'Value');
           Vals=get(handles.Mediumtypepop,'String');
           eval(sprintf('handles.environment.Medium=%s;',handles.mediumLookupTable.get(Vals{i}))); 
           handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Mediumtypepop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mediumtypepop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Mediumparamsbtn.
function Mediumparamsbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Mediumparamsbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    f=figure;
    set(f, 'NumberTitle', 'off');
    set(f, 'MenuBar', 'none');
    set(f, 'Name' ,'Medium Propagation Properties');
    p = PropertySheetFactory.Create(f,'Units', 'normalized', 'Position', [0.0, 0.0, 1.0, 1.0], 'Item', handles.environment.Medium);
    uiwait(f);
    handles.environment.Medium=p.Item;        
    handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm ); 
    guidata(hObject, handles);

% --- Executes on button press in Receiverantennaparamsbtn.
function Receiverantennaparamsbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Receiverantennaparamsbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    f=figure;
    set(f, 'NumberTitle', 'off');
    set(f, 'MenuBar', 'none');
    set(f, 'Name' ,'Receiver Antenna Properties');
    p = PropertySheetFactory.Create(f,'Units', 'normalized', 'Position', [0.0, 0.0, 1.0, 1.0], 'Item', handles.environment.Receiver.Antenna);
    uiwait(f);
    handles.environment.Receiver.Antenna=p.Item;     
    handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm ); 
    guidata(hObject, handles);

% --- Executes on button press in Senderantennaparamsbtn.
function Senderantennaparamsbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Senderantennaparamsbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    f=figure;
    set(f, 'NumberTitle', 'off');
    set(f, 'MenuBar', 'none');
    set(f, 'Name' ,'Transmitter Antenna Properties');
    p = PropertySheetFactory.Create(f,'Units', 'normalized', 'Position', [0.0, 0.0, 1.0, 1.0], 'Item', handles.environment.Sender.Antenna);
    uiwait(f);
    handles.environment.Sender.Antenna=p.Item;    
    handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );     
    guidata(hObject, handles);


% --- Executes on button press in Startbtn.
function Startbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Startbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Disable all form controls while the simulation is running
Fields=fieldnames(handles);
for i=1:length(Fields)
    s1=sprintf('strcmp(get(handles.%s,''Type''),''uicontrol'')',Fields{i});
    s2=sprintf('set(handles.%s,''Enable'',''off'')',Fields{i});
    try
    if eval(s1)
        eval(s2);
    end
    catch MException
    end
end
  
  set(handles.Startbtn,'Enable','off');
  %set(handles.Stopbtn,'Enable','on');
  %set(handles.Pausebtn,'Enable','on');
  set(handles.ShowViewerBtnMenu,'Enable','off');
  set(handles.DemoPlayMenuBtn,'Enable','off');  
  
  
  drawnow;
  
  %handles.agent.close;
  %handles.agent.reload;
%  handles.TSimModelHandler3DRealm.pauseSimul();  

  % clear some memory
  global BER;
  BER=1;
  global SER;
  SER=1;
  global ImResp;
  ImResp=1;
  global ChannelTransferFunction;
  ChannelTransferFunction=1;
  
  % calculate some avg path delays and gains
  global Delays;
  global Gains;
N=handles.Nofpaths;
rms=get(handles.Delayenvpop,'String');
i=get(handles.Delayenvpop,'Value');
switch rms{i}  %mod gains by X20 8/7/2010
    case 'Indoor cells'
        a=0.01;
        b=0.05;
        Gains= -(2).*rand(1,N);
    case 'Urban macrocell'
        a=1;
        b=3;
        Gains= -(15).*rand(1,N);
    case 'Suburban macrocell'
        a=0;
        b=1;
        Gains= -(5).*rand(1,N);
    case 'Open area'
        a=0;
        b=0.2;
        Gains= -(3).*rand(1,N);
    case 'Hilly area macrocell'
        a=3;
        b=10;
        Gains= -(25).*rand(1,N);
    case 'Mobile satellite'
        a=0.04;
        b=0.05;   
        Gains= -(5).*rand(1,N);
end
Delays= (1e-6)*(a+(b-a).*rand(1,N));

  
  pass_data=struct;
  
  %set simulation duration
  global globalT;
  globalT=180/handles.carspeed;
  pass_data.globalT=num2str(globalT);
  
  %set_param('rayleighAWGN', 'StartTime', num2str(0), 'StopTime', num2str(globalT));
  %set power
  %set_param('rayleighAWGN/Subsystem1/PowerGain', 'Gain', num2str(sqrt(handles.environment.Sender.Signal.P)));
  pass_data.power=num2str(sqrt(handles.environment.Sender.Signal.P));
   
  %Set prerequisites of timevary.m 
  myPulses=pulses(200,4,handles.NLOS);
  global Kvary;
  Kvary=((1-myPulses).*handles.rice);
  %figure;plot(Kvary);
  global ShadowvaryDB;
  ShadowvaryDB=-myPulses.*40; %(in dB : to 40 from 10 at 8/7/2010) 
  
  global globalSNRdb;
  globalSNRdb=handles.SNR;
  
  global globalGains;
  globalGains=Gains;
  
  global globalDelays;
  globalDelays=Delays;
  
  Dx=180/199;
  S=(180/2)+handles.Horizon;
  L=handles.DistFromRoad;
  
  global globalDoppler;
  global globalTgain;
  global globalRgain;
  global globalPgain;
  
  globalMaxDoppler=handles.carspeed*handles.environment.Sender.Signal.F/handles.environment.Medium.c;
  %set_param('rayleighAWGN/Subsystem/Multipath Rician Fading Channel','maxDopplerShift',num2str(globalMaxDoppler));
  pass_data.globalMaxDoppler=num2str(globalMaxDoppler);
  
  TotDist=zeros(1,200);
  for i=1:200
      x=(i-1)*Dx;
      
      wmega=atan(abs(S-x)/L);
      th=pi/2-wmega;
      if S<x
          th=pi-th;
      end
      globalDoppler(i)=globalMaxDoppler*cos(th);
      
      if S>x
          handles.environment.Sender.Direction=-handles.AzAntenna-wmega;
          handles.environment.Receiver.Direction=pi/2-wmega;
      else
          handles.environment.Sender.Direction=-handles.AzAntenna+wmega;
          handles.environment.Receiver.Direction=pi/2+wmega;          
      end
            
      
      Dhor=sqrt((L^2)+((S-x)^2));
      Dver=handles.environment.Sender.Height;
      
      handles.environment.Receiver.HorDistanceFromSender=Dhor;
      TotDist(i)=sqrt(Dhor*Dhor + Dver*Dver);
      myMeasurement=TVLABS2CustomMeasurement;
      [globalTgain(i) globalRgain(i) globalPgain(i)]=myMeasurement.paint1D(handles.environment);
  end
  
  %start
  %handles.agent.startSimul;
%  pass_data.randSeed=num2str(randSeed);
%  pass_data.Ps=num2str(Ps);
%  pass_data.probOfZero=num2str(probOfZero);
%  pass_data.seed_binary=num2str(seed_binary);  
%  pass_data.SymbolPeriod=num2str(SymbolPeriod);
%  pass_data.M=num2str(M);
%  pass_data.maxNumBits=num2str(maxNumBits);
%  pass_data.maxNumErr=num2str(maxNumErr);
  
  %save('c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\models\pass_data.mat','pass_data');
  
  %fileID=fopen('c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\models\pass_data.txt','w');
  %fprintf(fileID,'%s\n', pass_data.globalT);
  %fprintf(fileID,'%s\n', pass_data.power);
  %fprintf(fileID,'%s\n', pass_data.globalMaxDoppler);
  %fprintf(fileID,'%s\n', pass_data.randSeed);
  %fprintf(fileID,'%s\n', pass_data.Ps);
  %fprintf(fileID,'%s\n', pass_data.probOfZero);
  %fprintf(fileID,'%s\n', pass_data.seed_binary);
  %fprintf(fileID,'%s\n', pass_data.M);
  %fprintf(fileID,'%s\n', pass_data.SymbolPeriod);
  %fprintf(fileID,'%s\n', pass_data.maxNumBits);
  %fprintf(fileID,'%s\n', pass_data.maxNumErr);
  %fclose(fileID);
  
  %system('c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\models\rayleighAWGN.exe');
  
  %load('c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\models\BER_out.mat');
  %load('c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\models\SER_out.mat');
  %load('c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\models\ImResp_out.mat');
  %load('c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\models\rayleighAWGN.mat');
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N=handles.Nofpaths;
rms=get(handles.Delayenvpop,'String');
i=get(handles.Delayenvpop,'Value');
switch rms{i}  %mod gains by X20 8/7/2010
    case 'Indoor cells'
        a=0.01;
        b=0.05;
    case 'Urban macrocell'
        a=1;
        b=3;
    case 'Suburban macrocell'
        a=0;
        b=1;
    case 'Open area'
        a=0;
        b=0.2;
    case 'Hilly area macrocell'
        a=3;
        b=10;
    case 'Mobile satellite'
        a=0.04;
        b=0.05;   
end


Ptx_dBW=10*log10(handles.environment.Sender.Signal.P);
Rx_powAvg_dBW=Ptx_dBW-10*log10(globalPgain)+10*log10(globalRgain)+10*log10(globalTgain)+ShadowvaryDB;
Rx_powAvg_W=10.^(0.1*Rx_powAvg_dBW);


FreqCarrier=handles.environment.Sender.Signal.F;
PeriodCarrier=2*pi*FreqCarrier;
sampleCarrier=PeriodCarrier*0.001;

t=0:sampleCarrier:4*PeriodCarrier;

totSigAmpl=zeros(1,length(t));

ImResp=[];

GGains={};
GDelays={};

KKK=[];

%figure;plot(Rx_powAvg_dBW);

showRTC=get(findobj('Tag','RTCcheck'),'Value');
hRTC=-1;
if showRTC
    hRTC=figure;
end


hProgress=figure;
for i=1:200
    
      if i==1
          figure(hProgress);
          imshow('vlcsnap1.png');
          drawnow;
      elseif i==21
          figure(hProgress);
          imshow('vlcsnap2.png');          
          drawnow;
      elseif i==41
          figure(hProgress);
          imshow('vlcsnap3.png');          
          drawnow;
      elseif i==61
          figure(hProgress);
          imshow('vlcsnap4.png');          
          drawnow;
      elseif i==81
          figure(hProgress);
          imshow('vlcsnap5.png');          
          drawnow;
      elseif i==101
          figure(hProgress);
          imshow('vlcsnap6.png');          
          drawnow;
      elseif i==121
          figure(hProgress);
          imshow('vlcsnap7.png');          
          drawnow;
      elseif i==141
          figure(hProgress);
          imshow('vlcsnap8.png');          
          drawnow;
      elseif i==171
          figure(hProgress);
          imshow('vlcsnap9.png');          
          drawnow;
      elseif i==200
          figure(hProgress);
          imshow('vlcsnap10.png');          
          drawnow;
      end
      
      x=(i-1)*(180/199);
      t=x/handles.carspeed;
      [Tgain Sgain Pgain Rgain SNRdB K Fd avPathG pathDelays carpos]=timevary(t);
      %only the gains, K, Fd and the carpos are valid.
      %setcarpos(carpos);
      
      KKK(i)=K;
      
      Dist=TotDist(i);
      
      Delays_each= sort((Dist/3e+8)*(a+(b-a).*rand(1,N)));
      GDelays{i}=Delays_each;
      
      LOSpow_W=Rx_powAvg_W(i);
      if K>1
          
          NLOSpow_W_tot=Rx_powAvg_W(i) / K;

          powNLOS_each=rand(1,N-1);
          powNLOS_each=NLOSpow_W_tot*powNLOS_each./sum(powNLOS_each);

          Amplitudes=[sqrt(LOSpow_W) sqrt(powNLOS_each) ];

      else
          powNLOS_each=rand(1,N);
          powNLOS_each=LOSpow_W*powNLOS_each./sum(powNLOS_each);
          Amplitudes= sqrt(powNLOS_each) ;
      end
      
      %stem(Delays_each, Amplitudes);ginput(1);
      GGains{i}=20*log10(Amplitudes);
      
      if showRTC
          figure(hRTC);
          stem(GDelays{i}, GGains{i});
          xlabel('Ray delays (sec)');
          ylabel('Ray power (dBW)');
          title('Real-time channel analysis');
          pause(0.05);
      end
              
      [Result, ~]=jakes_mod(FreqCarrier,Fd,Amplitudes,Delays_each);
      
      %for k=1:N
      %    totSigAmpl=totSigAmpl+Amplitudes(k)*sin(2*pi*(FreqCarrier-Fd)*(t-Delays_each(k)));
      %end
          
      ImResp=[ImResp Result];
end

%figure;plot(KKK)

HH=findobj(findobj('Tag','MainFigureOfVlabs2'),'Type','uicontrol');
for i=1:length(HH)
  set(HH(i),'enable','on');
  if strcmp(get(HH(i),'Tag'),'Pausebtn' )
      set(HH(i),'enable','off');
  end
  if strcmp(get(HH(i),'Tag'),'Stopbtn' )
      set(HH(i),'enable','off');
  end
end




  set(findobj('Tag','ShowViewerBtnMenu'),'Enable','on');
  set(findobj('Tag','DemoPlayMenuBtn'),'Enable','on');  

showGains=get(findobj('Tag','Fdcheck'),'Value'); %show gains..
if showGains
    figure;
    subplot(3,2,1);
    plot(0:180/199:180,10*log10(globalTgain));
    xlabel('distance - (m)');
    ylabel('dB');
    title('Transmitter Antenna Gain');

    subplot(3,2,2);
    plot(0:180/199:180,-10*log10(globalPgain));
    xlabel('distance - (m)');
    ylabel('dB');
    title('Path Loss');

    subplot(3,2,3);
    plot(0:180/199:180,10*log10(globalRgain));
    xlabel('distance - (m)');
    ylabel('dB');
    title('Receiver Antenna Gain');

    subplot(3,2,4);
    plot(0:180/199:180,ShadowvaryDB);
    xlabel('distance - (m)');
    ylabel('dB');
    title('Shadowing Losses');

    subplot(3,2,5:6);
    plot(0:180/199:180,-10*log10(globalPgain)+10*log10(globalRgain)+10*log10(globalTgain)+ShadowvaryDB);
    xlabel('distance - (m)');
    ylabel('dB');
    title('Aggregate Gains');

end

showTIR=get(findobj('Tag','TIRcheck'),'Value'); %show TIR..
showPDP=get(findobj('Tag','PDPcheck'),'Value'); %show PDP..

%figure;plot(20*log10(abs(ImResp)));
%ImResp=rand(1,100);

if showTIR
    n=length(ImResp);
    x3=0:180/(n-1):180;
    y3=20*log10(abs(ImResp));
else
    x3=1;
    y3=1;
end

PDPdata={};
PDPdata{1}=1;
PDPdata{2}=2;

if showPDP
    x2=GDelays;
    y2=GGains;
    PDPdata{1}=x2;
    PDPdata{2}=y2;
end


x1=1;
y1=1;


AWGN_dBW=-40;
SNR=20*log10(abs(ImResp)) - (AWGN_dBW);
BER=1;
SER=1;

try
    [BER,SER] = berawgn(SNR,GLmodulation,GLmodlevels);
catch
    [BER,SER] = berawgn(SNR,'pam',2);
end

BER=min(BER);
SER=min(SER);

report([1 0 showPDP showTIR], ...
           {'minimum BER (ideal threshold)' 'minimum SER (ideal threshold)' 'Average Fade Duration' 'Level Crossing Frequency'}, ...
           {BER SER 3 4}, ...
           {x1 abs(y1)},...
           PDPdata,...
           {x3 y3 globalT}  );  
  
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  set(handles.Startbtn,'Enable','on');
  %set(handles.Stopbtn,'Enable','on');
  %set(handles.Pausebtn,'Enable','on');
  set(handles.ShowViewerBtnMenu,'Enable','on');
  set(handles.DemoPlayMenuBtn,'Enable','on');  

Fields=fieldnames(handles);
for i=1:length(Fields)
    s1=sprintf('strcmp(get(handles.%s,''Type''),''uicontrol'')',Fields{i});
    s2=sprintf('set(handles.%s,''Enable'',''on'')',Fields{i});
    try
    if eval(s1)
        eval(s2);
    end
    catch MException
    end
end  
  
  guidata(hObject, handles);

% --- Executes on button press in Pausebtn.
function Pausebtn_Callback(hObject, eventdata, handles)
% hObject    handle to Pausebtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.agent.pauseSimul;
% uiwait(msgbox('Simulation Paused. Press OK to continue...','Pause','modal'));
% handles.agent.unpauseSimul;
 guidata(hObject, handles);

% --- Executes on button press in Stopbtn.
function Stopbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Stopbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% handles.agent.stopSimul;
% Fields=fieldnames(handles);
% for i=1:length(Fields)
%     s1=sprintf('strcmp(get(handles.%s,''Type''),''uicontrol'')',Fields{i});
%     s2=sprintf('set(handles.%s,''Enable'',''on'')',Fields{i});
%     try
%     if eval(s1)
%         eval(s2);
%     end
%     catch MException
%     end
% end
%   set(handles.Startbtn,'Enable','on');
%   set(handles.Stopbtn,'Enable','off');
%   set(handles.Pausebtn,'Enable','off');
%   setcarpos(90);
% handles.TSimModelHandler3DRealm.setParam('carposGain','Gain',90);  
guidata(hObject, handles);

% --- Executes on button press in Editblocksbtn.
function Editblocksbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Editblocksbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% simulink('open');
% open_system('rayleighAWGN');


% --- Executes on button press in Restoreblocksbtn.
function Restoreblocksbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Restoreblocksbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% delete('rayleighAWGN.mdl');
% copyfile('ORIGINALS/rayleighAWGN_original.mdl','rayleighAWGN.mdl');
% delete('blocks.PNG');
% copyfile('ORIGINALS/blocks.PNG','blocks.PNG');
% %Reset the block diagram
%        x=imread(strcat(handles.installPath,'\blocks.png'));
%        image(x,'Parent',handles.axes1);
%        set(handles.axes1,'XTick',[]);
%        set(handles.axes1,'YTick',[]);
%  uiwait(msgbox('The model was reset successfully','Model reset','modal'));

% --- Executes on slider movement.
function SNRslider_Callback(hObject, eventdata, handles)
% hObject    handle to SNRslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function SNRslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SNRslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in SNRviewbtn.
function SNRviewbtn_Callback(hObject, eventdata, handles)
% hObject    handle to SNRviewbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

C=handles.environment.Sender.Signal.P;
K=handles.rice;
%s=sqrt(C/(K+1));
[Result, t]=jakes(handles.environment.Sender.Signal.F,handles.carspeed,1,K);

figure;
subplot(2,1,1);
plot(t,20.*log10(abs(awgn(Result,handles.SNR))),'b');
xlabel('Time (s)');
ylabel('Signal relative to mean (dB)');
% Eb/No(dB) = S/N(dB) + 10*LOG(BW(Hz) / BitRate(Hz)), assuming 50Hz BW..
title(sprintf('Indicative rice fading for k=%d and AWGN with Eb/No=%3.1f (QAM-16-3/4)',K,handles.SNR));

subplot(2,1,2);
EbNo = 8:2:20;
M = 16; % Use 16 QAM
L = 1; % Start without diversity
ber = berfading(EbNo,'qam',M,L);
semilogy(EbNo,ber);
text(18.5, 0.02, sprintf('L=%d', L))
hold on
% Loop over diversity order, L, 2 to 20
for L=2:20
    ber = berfading(EbNo,'qam',M,L,handles.rice);
    semilogy(EbNo,ber);
end
text(18.5, 1e-11, sprintf('L=%d', L))
title(sprintf('QAM-16 over fading channel with rice factor=%d and diversity order L=1..20',handles.rice));
xlabel('E_b/N_o (dB)')
ylabel('BER')
grid on

% --- Executes on slider movement.
function Riceslider_Callback(hObject, eventdata, handles)
% hObject    handle to Riceslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Riceslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Riceslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in Delayenvpop.
function Delayenvpop_Callback(hObject, eventdata, handles)
% hObject    handle to Delayenvpop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Delayenvpop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Delayenvpop


% --- Executes during object creation, after setting all properties.
function Delayenvpop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Delayenvpop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function Nofpathsslider_Callback(hObject, eventdata, handles)
% hObject    handle to Nofpathsslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Nofpathsslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Nofpathsslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Ricepdfviewbtn.
function Ricepdfviewbtn_Callback(hObject, eventdata, handles)
% hObject    handle to Ricepdfviewbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
K=handles.rice;

x = linspace(0, 4, 100);
figure; 

ha=subplot(2,1,1);
hold on;
grid on;
colors={'k','r'};
i=1;
C=1;
for k=[0 K]
    
    s=sqrt(C/(k+1));
    v=s*sqrt(2*k);
    y=ricepdf(x, v, s);
    
    plot(x,y,colors{i});
    i=i+1;
end
xlabel('Fading Amplitute (V)');
ylabel('Probability Density');
set(ha,'YLim',[0 2.5]);
title(sprintf('Indicative Rice p.d.f for k=0, %d with constant signal power',K));
legend('k=0',sprintf('k=%d',K));

subplot(2,1,2);
grid on;
hold on;

i=1;
for k=[0 K]
   [Result, t]=jakes(handles.environment.Sender.Signal.F,handles.carspeed,1,k);
   plot(t,20.*log10(abs(Result)),colors{i});
   i=i+1;
end
xlabel('Time (s)');
ylabel('Signal relative to mean (dB)');
title({'Indicative time series of rice fading', sprintf('for k=0, %d - for constant signal power',K)});
legend('k=0',sprintf('k=%d',K));

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BERcheck.
function BERcheck_Callback(hObject, eventdata, handles)
% hObject    handle to BERcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of BERcheck


% --- Executes on button press in SERcheck.
function SERcheck_Callback(hObject, eventdata, handles)
% hObject    handle to SERcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SERcheck


% --- Executes on button press in Fdcheck.
function Fdcheck_Callback(hObject, eventdata, handles)
% hObject    handle to Fdcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Fdcheck


% --- Executes on button press in TIRcheck.
function TIRcheck_Callback(hObject, eventdata, handles)
% hObject    handle to TIRcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TIRcheck


% --- Executes on button press in Transfercheck.
function Transfercheck_Callback(hObject, eventdata, handles)
% hObject    handle to Transfercheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Transfercheck


% --- Executes on button press in PDPcheck.
function PDPcheck_Callback(hObject, eventdata, handles)
% hObject    handle to PDPcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PDPcheck


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in RTCcheck.
function RTCcheck_Callback(hObject, eventdata, handles)
% hObject    handle to RTCcheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RTCcheck

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=handles.Nofpaths;
rms=get(handles.Delayenvpop,'String');
i=get(handles.Delayenvpop,'Value');
switch rms{i}
    case 'Indoor cells'
        a=0.01;
        b=0.05;
        Gains= -(2).*rand(1,N);
    case 'Urban macrocell'
        a=1;
        b=3;
        Gains= -(15).*rand(1,N);
    case 'Suburban macrocell'
        a=0;
        b=1;
        Gains= -(5).*rand(1,N);
    case 'Open area'
        a=0;
        b=0.2;
        Gains= -(3).*rand(1,N);
    case 'Hilly area macrocell'
        a=3;
        b=10;
        Gains= -(25).*rand(1,N);
    case 'Mobile satellite'
        a=0.04;
        b=0.05;   
        Gains= -(5).*rand(1,N);
end
Delays= (1e-6)*(a+(b-a).*rand(1,N));

CC=handles.environment.Sender.Signal.P;
k=handles.rice;
figure; 

h1=subplot(2,1,1);
set(h1,'NextPlot','add');
grid on;
for i=1:N
   C=10^(0.1*(10*log10(CC)+Gains(i))); 
   s=sqrt(C/(k+1));
   [Result, t]=jakes(handles.environment.Sender.Signal.F,handles.carspeed,1,k);
   plot3(ones(1,length(t)).*Delays(i)*1e+9,t,Gains(i)+20.*log10(abs(Result)));
end
ylabel('Time (s)');
zlabel('Signal relative to mean (dB)');
xlabel('Relative Delay (ns)');
title(sprintf('Time-variant impulse response - secondary paths only'));
view([-18 32]);

subplot(2,1,2);
stem(Delays*1e+9, abs(Gains));
ylabel('Signal relative to mean (dB)');
xlabel('Relative Delay (ns)');
title(sprintf('Power-delay profile - secondary paths only'));


% --- Executes during object creation, after setting all properties.
function MainFigureOfVlabs2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MainFigureOfVlabs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function DemoMenuBtn_Callback(hObject, eventdata, handles)
% hObject    handle to DemoMenuBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function DemoPlayMenuBtn_Callback(hObject, eventdata, handles)
% hObject    handle to DemoPlayMenuBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  %Set prerequisites of timevary.m 
  myPulses=pulses(200,4,handles.NLOS);
  global Kvary;
  Kvary=(1-myPulses).*handles.rice;
  
  global ShadowvaryDB;
  ShadowvaryDB=-myPulses.*40; %(in dB from 10 to 40 at 8/7/2010) 
  
  global globalSNRdb;
  globalSNRdb=handles.SNR;
    
  Dx=180/199;
  S=(180/2)+handles.Horizon;
  L=handles.DistFromRoad;
  
  global globalDoppler;
  global globalTgain;
  global globalRgain;
  global globalPgain;
  
  globalMaxDoppler=handles.carspeed*handles.environment.Sender.Signal.F/handles.environment.Medium.c;
  
  for i=1:200
      x=(i-1)*Dx;
      
      wmega=atan(abs(S-x)/L);
      th=pi/2-wmega;
      if S<x
          th=pi-th;
      end
      globalDoppler(i)=globalMaxDoppler*cos(th);
      
      if S>x
          handles.environment.Sender.Direction=-handles.AzAntenna-wmega;
          handles.environment.Receiver.Direction=pi/2-wmega;
      else
          handles.environment.Sender.Direction=-handles.AzAntenna+wmega;
          handles.environment.Receiver.Direction=pi/2+wmega;          
      end
            
      handles.environment.Receiver.HorDistanceFromSender=sqrt((L^2)+((S-x)^2));
      myMeasurement=TVLABS2CustomMeasurement;
      [globalTgain(i) globalRgain(i) globalPgain(i)]=myMeasurement.paint1D(handles.environment);
  end
   
%if ~isvalid(handles.vrfigureobj)
%   handles.vrfigureobj=view(handles.xviewer);
%end
%linesvisible(true);

set(handles.MainFigureOfVlabs2,'Visible','off');
%oldview=get(handles.vrfigureobj,'Viewpoint');
%set(handles.vrfigureobj,'Viewpoint','Demo View');

h=figure;
set(h,'CloseRequestFc','');
h1=subplot(3,1,1);
set(h1,'NextPlot','add');
y=-log10(globalPgain)+log10(globalRgain)+log10(globalTgain)-ShadowvaryDB;
plot(h1, y);
H1=plot(h1,[1 1],[min(y) max(y)],'r');
set(h1,'XTick',[]);
xlabel('Distance traveled');
ylabel({'Aggregate gains','minus shadowing - DB'});
title('Gain variation due to Antennas, Path Loss and Shadowing');

h2=subplot(3,1,2);
C=handles.environment.Sender.Signal.P;
K=handles.rice;
i=1;
for k=[0 K]
   s=sqrt(C/(k+1));
   [Result, t]=jakes(handles.environment.Sender.Signal.F,handles.carspeed,s,k);
   Y{i}=20.*log10(abs(Result));
   i=i+1;
end
xlabel('Time (s)');
ylabel('Signal relative to mean (dB)');
title(sprintf('Time series of rice fading for k=0, %d - signal power is constant',K));



IM=imread('demotext.png');
h3=subplot(3,1,3);
subimage(IM);
set(h3,'XTick',[]);
set(h3,'YTick',[]);

%!"c:\I.H.U. Virtual Labs on WCM and WSN\vlabs2\fade_demo.mp4" &
for t=90:-1:-90
    I=round(1+((90-t)*length(y)/180));
    if I>length(y)
        I=length(y);
    end
    set(H1,'XData',ones(size(get(H1,'XData'))).*I);
    if myPulses(I)<=(max(myPulses)/2);
        plot(h2, Y{2});
        xlabel(h2,'time');
        ylabel(h2,'Signal Power - DB');
        title(h2,'LOS fading effect');
        set(h2,'XTick',[]);
    else
        plot(h2, Y{1});        
        xlabel(h2,'time');
        ylabel(h2,'Signal Power - DB');
        title(h2,'NLOS fading effect');
        set(h2,'XTick',[]);
    end
    
drawlines(t);
drawnow;
end

uiwait(msgbox('Demo completed. Press OK to go back to the LAB.'));
try
delete(h);
catch MException
end
set(handles.MainFigureOfVlabs2,'Visible','on');
%drawlines(90);
%linesvisible(false);
%set(handles.vrfigureobj,'Viewpoint',oldview);
guidata(hObject, handles);


% --------------------------------------------------------------------
function ShowViewerBtnMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ShowViewerBtnMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=UpdateVRandStaticTexts(hObject,  handles, handles.TSimModelHandler3DRealm );

if ~isvalid(handles.vrfigureobj)
   handles.vrfigureobj=view(handles.xviewer);
end

uiwait(msgbox('Inspect the 3D view and press "OK" to return to the LAB.','modal'));
close(handles.vrfigureobj);

guidata(hObject, handles);


% --- Executes on selection change in modPopmenu.
function modPopmenu_Callback(hObject, eventdata, handles)
% hObject    handle to modPopmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns modPopmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from modPopmenu
global GLmodulation;
global GLmodlevels;

contents = cellstr(get(hObject,'String')); 

switch contents{get(hObject,'Value')}
    case 'PSK-2'
      GLmodulation='psk';
      GLmodlevels=2;
    case 'PSK-16'
      GLmodulation='psk';
      GLmodlevels=16;        
    case 'PSK-64'
      GLmodulation='psk';
      GLmodlevels=64;        
    case 'OQPSK-4'
      GLmodulation='oqpsk';
      GLmodlevels=4;        
    case 'DPSK-2'
      GLmodulation='dpsk';
      GLmodlevels=2;        
    case 'DPSK-16'
      GLmodulation='dpsk';
      GLmodlevels=16;        
    case 'DPSK-64'
      GLmodulation='dpsk';
      GLmodlevels=64;        
    case 'PAM-2'
      GLmodulation='pam';
      GLmodlevels=2;        
    case 'PAM-16'
      GLmodulation='pam';
      GLmodlevels=16;        
    case 'PAM-64'
      GLmodulation='pam';
      GLmodlevels=64;        
    case 'QAM-2'
      GLmodulation='qam';
      GLmodlevels=2;        
    case 'QAM-16'    
      GLmodulation='qam';
      GLmodlevels=16;        
end


% --- Executes during object creation, after setting all properties.
function modPopmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to modPopmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when MainFigureOfVlabs2 is resized.
function MainFigureOfVlabs2_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to MainFigureOfVlabs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject,handles);
drawnow;
try
    handles.originalPosFig;
catch MException
           guidata(hObject,handles);
           return;
end

newPos=get(hObject,'Position');
p=newPos./handles.originalPosFig;
p(1)=p(3);
p(2)=p(4);

for i=1:length(handles.originalPosComp)
    pos=handles.originalPosComp{i};
    h=handles.originalHandles{i};
       try
           if h~=hObject
           set(h,'Position',pos.*p);
           end
       catch MException
           continue;
        %do nothing
       end
       
       if handles.originalFontSize{i}~=-1
           factor=min(p(1:2));
           if min(p(1:2))>1
               factor=1;
           end
           if handles.originalFontSize{i}*factor<6
                set(h,'FontSize',6);
           else
                set(h,'FontSize',handles.originalFontSize{i}*factor);
           end
       end
end

guidata(hObject,handles);


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpdlg({'Created for the', 'International Hellenic University,','Greece, November 2010,','','by C.Liaskos and G.Koutitas,','(cliaskos@csd.auth.gr, g.koutitas@ihu.edu.gr)' },'About')
