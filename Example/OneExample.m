%% In this script, the value of variable "msg" will be displayed 
% in command-line every 0.5 second.
% scPara_Ctrl is called here to modify value of msg, or do anything you
% want.
%% parameters
tool_path = '..';% where scPara_Ctrl.m is located
disp_interval = 0.5;% time interval for display message seconds
msg = '';  % initial message
prompt_str = 'The message is: '
%% path preparation
addpath(tool_path);
%% running
while ~strcmp(msg,'quit')% if you want to quit, type 'msg = quit;' in the window popping up
    fprintf([prompt_str,'%s'],msg);
    scPara_Ctrl;
    pause(0.5);
end