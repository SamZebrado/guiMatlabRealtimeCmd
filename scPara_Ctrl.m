% scripts to be inserted anywhere you want to run command collected by
% guiPara_Ctrl.m

hdl_ctrl = guiPara_Ctrl('Init');% if called multiple times, only one window will be created
fprintf('Trying to Call Command "%s"\n',hdl_ctrl.getCmd())
if ~isempty(hdl_ctrl.getCmd())
    try
        eval(hdl_ctrl.getCmd())
    catch
        fprintf('Command "%s" cannot be ran\n',hdl_ctrl.getCmd())
    end
    if ~hdl_ctrl.getSubProperty('qRunEachTrial')
        hdl_ctrl.setSubProperty('Cmd','');
        fprintf('Command Cleared\n');
    end
end