# guiMatlabRealtimeCmd
Create a GUI for you to input your command, which will be the input parameter of function 'eval'.
Insert scPara_Ctrl wherever you want the command to be evaluated (but only one window will be allowed).
An Example of use this script is in folder "Example"

This is a script I created to ease parameter modification when I'm demonstrating a stimuli in a psychphysics experiment.
With it I can modify whatever variables in the same workspace where the scPara_Ctrl is called.

## Trusted input only

`scPara_Ctrl.m` passes the GUI command text to MATLAB's `eval` in the calling workspace. Commands can execute arbitrary MATLAB code, modify workspace variables, access files, and call other functions with the current MATLAB session's permissions. This is not a sandbox or an input validator. Only enter commands you understand and trust; do not paste untrusted input. The "Run The Command above Once Each Trial" option can repeat the command when the script is called again.

## Setup and example

This is a historical MATLAB desktop utility that needs a graphical MATLAB session. The required MATLAB version and platform compatibility have not been established; no MATLAB runtime or GUI validation was performed for this documentation review.

With MATLAB's current folder set to the repository root, run:

```matlab
cd Example
OneExample
```

The example adds the parent folder containing `scPara_Ctrl.m` to the MATLAB path and displays `msg` every 0.5 seconds. In the GUI, a trusted command such as `msg = 'hello';` changes that variable. Enter `msg = 'quit';` to end the example loop. For use in another script, add the folder containing `scPara_Ctrl.m` and `guiPara_Ctrl.m` to the MATLAB path before calling `scPara_Ctrl` in the workspace you intend to modify.
