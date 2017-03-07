function varargout = NN1(varargin)
% NN1 MATLAB code for NN1.fig
%      NN1, by itself, creates a new NN1 or raises the existing
%      singleton*.
%
%      H = NN1 returns the handle to a new NN1 or the handle to
%      the existing singleton*.
%
%      NN1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NN1.M with the given input arguments.
%
%      NN1('Property','Value',...) creates a new NN1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NN1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NN1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NN1

% Last Modified by GUIDE v2.5 07-Mar-2017 21:19:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NN1_OpeningFcn, ...
                   'gui_OutputFcn',  @NN1_OutputFcn, ...
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


% --- Executes just before NN1 is made visible.
function NN1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NN1 (see VARARGIN)
handles.dataset1.r = 10;
handles.dataset1.w = 6;
handles.dataset1.d = 1;
handles.dataset1.number = 1000;

[handles.dataset2.X, handles.dataset2.y] = read_dataset_2('DataSet2.txt');

handles.learning.method = 1;
handles.learning.number = 50;
handles.learning.perceptron.learning_rate = -1;
handles.learning.adaline.learning_rate = 0.001;

handles.third.train_set_size = 70;

% Choose default command line output for NN1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NN1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NN1_OutputFcn(hObject, eventdata, handles) 
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
[handles.dataset1.X, handles.dataset1.y] = ...
    moon_dataset(handles.dataset1.r, ...
    handles.dataset1.w, ...
    handles.dataset1.d, ...
    handles.dataset1.number);
[handles.dataset1.test.X, handles.dataset1.test.y] = ...
    moon_dataset(handles.dataset1.r, ...
    handles.dataset1.w, ...
    handles.dataset1.d, ...
    handles.dataset1.number);
hold off
moon_visualization(handles.dataset1.X, handles.dataset1.y)

%handles.dataset1.X = [ones(2000, 1), handles.dataset1.X];
%handles.dataset1.test.X = [ones(2000, 1), handles.dataset1.test.X];

guidata(hObject, handles);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
values = get(hObject, 'string');
index = get(hObject, 'value');
value = values(index);
handles.dataset1.d = str2double(value);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.learning.method = get(hObject, 'value');
guidata(hObject, handles);

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value = get(hObject, 'String');
handles.learning.number = str2double(value);
guidata(hObject, handles)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.learning.method
    case 1
        [handles.first.weights, ...
            handles.first.error_train, ...
            handles.first.error_test] = train_by_epoch(...
                @(X, y, w) (perceptron_learning(...
                    X, ...
                    y, ...
                    w, ...
                    handles.learning.perceptron.learning_rate)), ...
                handles.learning.number, ...
                handles.dataset1.X, ...
                handles.dataset1.y, ...
                handles.dataset1.test.X, ...
                handles.dataset1.test.y, ...
                rand(3, 1) - 0.5);
    case 2
        [handles.first.weights, ...
            handles.first.error_train, ...
            handles.first.error_test, ...
            epoch] = train_by_error(...
                @(X, y, w) (perceptron_learning(...
                    X, ...
                    y, ...
                    w, ...
                    handles.learning.perceptron.learning_rate)), ...
                handles.learning.number, ...
                handles.dataset1.X, ...
                handles.dataset1.y, ...
                handles.dataset1.test.X, ...
                handles.dataset1.test.y, ...
                rand(3, 1) - 0.5);
end

x = xlim;
y = line_weights(handles.first.weights, x);
plot(x, y);

guidata(hObject, handles)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure(1)
plot(1:(length(handles.first.error_train)), handles.first.error_train, '-o')
hold on
plot(1:(length(handles.first.error_test)), handles.first.error_test, '-o')
hold off
legend('Train Error', 'Test Error')


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.second.weights = zeros(3, 12);
handles.second.weights(:, 1) = rand(3, 1) - 0.5;

switch handles.learning.method
    case 1
        handles.second.fig_step = ceil(handles.learning.number / 12);
    case 2
        [w, err1, err2, epoch] = train_by_error(...
            @(X, y, w) (perceptron_learning(...
                X, ...
                y, ...
                w, ...
                handles.learning.perceptron.learning_rate)), ...
            handles.learning.number, ...
            handles.dataset1.X, ...
            handles.dataset1.y, ...
            handles.dataset1.test.X, ...
            handles.dataset1.test.y, ...
            handles.second.weights(:, 1));
        handles.second.fig_step = ceil(epoch / 12);
end

for i = 1:12
    [handles.second.weights(:, i+1), e1, e2] = train_by_epoch(...
        @(X, y, w) (perceptron_learning(...
            X, ...
            y, ...
            w, ...
            handles.learning.perceptron.learning_rate)), ...
        handles.second.fig_step, ...
        handles.dataset1.X, ...
        handles.dataset1.y, ...
        handles.dataset1.test.X, ...
        handles.dataset1.test.y, ...
        handles.second.weights(:, i));
end

x = xlim;
y = line_weights(handles.second.weights(:, 13), x);
plot(x, y);

guidata(hObject, handles)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure(1)
for i = 1:12
    subplot(3, 4, i)
    moon_visualization(handles.dataset1.X, handles.dataset1.y)
    x = xlim;
    xlim([-20 30]) % TODO
    y = line_weights(handles.second.weights(:, i + 1), x);
    plot(x, y);
    title(sprintf('Epoch: %d', i*handles.second.fig_step))
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uiputfile('*.txt','Save Weights of Second Question as');
w = handles.second.weights;
save(sprintf('%s%s', path, file), 'w', '-ascii')

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.txt','Load Weights of Second Question as');
sprintf('%s%s', path, file)
handles.second.weights = load(sprintf('%s%s', path, file), '-ascii');

x = xlim;
y = line_weights(handles.second.weights(:, 13), x);
plot(x, y);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uiputfile('*.txt','Save Weights of First Question as');
w = handles.first.weights;
save(sprintf('%s%s', path, file), 'w', '-ascii')


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.txt','Load Weights of First Question as');
sprintf('%s%s', path, file)
handles.first.weights = load(sprintf('%s%s', path, file), '-ascii')

x = xlim;
y = line_weights(handles.first.weights, x);
plot(x, y);



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.dataset1.r = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
handles.dataset1.w = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
handles.dataset1.d = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
handles.dataset1.number = str2double(get(hObject,'String'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.third.perceptron.w = zeros(5, 3);
train_index = rand(size(handles.dataset2.y, 1), 1) < ...
    handles.third.train_set_size / 100;

for i = 1:3
    y = 2 * (handles.dataset2.y == i) - 1;
    switch handles.learning.method
        case 1
            [handles.third.perceptron.w(:, i), ...
                handles.third.perceptron.error_train, ...
                handles.third.perceptron.error_test] = train_by_epoch(...
                    @(X, y, w) (perceptron_learning(...
                        X, ...
                        y, ...
                        w, ...
                        handles.learning.perceptron.learning_rate)), ...
                    handles.learning.number, ...
                    handles.dataset2.X(train_index, :), ...
                    y(train_index), ...
                    handles.dataset2.X(~train_index, :), ...
                    y(~train_index), ...
                    rand(5, 1) - 1);
            [handles.third.adaline.w(:, i), ...
                handles.third.adaline.error_train, ...
                handles.third.adaline.error_test] = train_by_epoch(...
                    @(X, y, w) (adaline_learning(...
                        X, ...
                        y, ...
                        w, ...
                        handles.learning.adaline.learning_rate)), ...
                    handles.learning.number, ...
                    handles.dataset2.X(train_index, :), ...
                    y(train_index), ...
                    handles.dataset2.X(~train_index, :), ...
                    y(~train_index), ...
                    rand(5, 1) - 1);
        case 2
            [handles.third.perceptron.w(:, i), ...
                handles.third.perceptron.error_train, ...
                handles.third.perceptron.error_test, ...
                handles.third.perceptron.epoch] = train_by_error(...
                    @(X, y, w) (perceptron_learning(...
                        X, ...
                        y, ...
                        w, ...
                        handles.learning.perceptron.learning_rate)), ...
                    handles.learning.number, ...
                    handles.dataset2.X(train_index, :), ...
                    y(train_index), ...
                    handles.dataset2.X(~train_index, :), ...
                    y(~train_index), ...
                    rand(5, 1) - 1);
            [handles.third.adaline.w(:, i), ...
                handles.third.adaline.error_train, ...
                handles.third.adaline.error_test, ...
                handles.third.adaline.epoch] = train_by_error(...
                    @(X, y, w) (adaline_learning(...
                        X, ...
                        y, ...
                        w, ...
                        handles.learning.adaline.learning_rate)), ...
                    handles.learning.number, ...
                    handles.dataset2.X(train_index, :), ...
                    y(train_index), ...
                    handles.dataset2.X(~train_index, :), ...
                    y(~train_index), ...
                    rand(5, 1) - 1);
    end
end

guidata(hObject, handles)

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off
x = 1:(max(size(handles.third.perceptron.error_train, 1), ...
    size(handles.third.perceptron.error_train, 1)));
plot(x, handles.third.perceptron.error_train, '-o')
hold on
plot(x, handles.third.perceptron.error_test, '-o')
plot(x, handles.third.adaline.error_train, '-o')
plot(x, handles.third.adaline.error_test, '-o')

legend('Perceptron: Train Error', ...
    'Perceptron: Test Error', ...
    'Adaline: Train Error', ...
    'Adaline: Test Error')





function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
handles.third.train_set_size = str2double(get(hObject,'String'));
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
handles.learning.adaline.learning_rate = str2double(get(hObject,'String'));
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
handles.learning.perceptron.learning_rate = str2double(get(hObject,'String'));
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
