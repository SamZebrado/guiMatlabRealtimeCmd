% a GUI to control specific parameters

% to be added:
%   global or persistent variables to make the controller window unique
function Out = guiPara_Ctrl(flag,varargin)
persistent PersistWindow;

Out.qJustOneTrial = true;
Out.Cmd = '';
Out.clearup = @clearup;
Out.getCmd = @()getSubProperty('Cmd');
Out.qRunEachTrial = false;
Out.setSubProperty = @setSubProperty;
Out.getSubProperty = @getSubProperty;
Out.h_figure = [];
Out.h_txt = [];
Out.h_cmd = [];
Out.h_chk_run_each_trial = [];

switch flag
    case 'Init'% Create a controller window
        if isempty(PersistWindow)
            scrsz = get(groot,'ScreenSize');
            sz = [scrsz(3)/4*0.618,scrsz(4)/2*0.618];%size
            pos = [scrsz(3)-sz(1)*2*0.618,scrsz(4)/10*0.618];% xmin ymin position, origin is at bottom-left of the screen
            pos_ = [pos sz];% xmin ymin width height
            f = figure('Position',pos_,...
                'Name','Dynamic Parameter Controller',...
                'NumberTitle','off',...
                'Visible','off',...
                'CloseRequestFcn',@CloseAndClearup...
                );% this won't open when a PTB window is on
            Out.h_figure = f;
            % text
            Out.h_txt = uicontrol('Style','text',...
                'Position',[0 sz(2)*0.9 sz(1)*0.9 20],...
                'String','Input control commands here');
            Out.h_cmd = uicontrol('Style','edit',...
                'Position',[sz(1)*0.1 sz(2)*0.85 sz(1)*0.7 20],...
                'String','',...
                'Callback',@setCmd);
            Out.h_chk_run_each_trial = uicontrol('Style','checkbox',...
                'Position',[sz(1)*0.1 sz(2)*0.78 sz(1)*0.9 20],...
                'Value',0,...
                'String','Run The Command above Once Each Trial',...
                'Callback',@setRunEachTrial...
                );
            f.Visible = 'on';
            PersistWindow = Out;
        else
            disp 'Window exists, no more creating...'
            Out = PersistWindow;
        end
    case 'AddSettings'% add specified uicontrols
        % szPara_Ctrl('AddSettings',figure_handle,uicontrol_script_name)
        
end
% callback functions
    function setRunEachTrial(objHandle,Eventdata)
        Out.qRunEachTrial = get(objHandle,'Val');
        fprintf('qRunEachTrial set as %i\n',Out.qRunEachTrial)
    end
    function setCmd(objHandle,Eventdata)
        fprintf('%s\n',get(objHandle,'String'));
        Out.Cmd = get(objHandle,'String');
        fprintf('Current Cmd:%s\n',Out.Cmd)
    end
% property controls
    function setSubProperty(Pname,Pval)
        Out.(Pname)= Pval;% this Out become different with the root handle calling this function
    end
    function O = getSubProperty(Pname)
        O = Out.(Pname);
    end
    function clearup()
        Out = [];
        Out.clearup = @clearup;
    end
    function CloseAndClearup(varargin)
        PersistWindow = []; 
        clearup();
        disp 'Persistent Data Cleared';
        delete(varargin{1});
        disp 'Window Closed';
    end
end
