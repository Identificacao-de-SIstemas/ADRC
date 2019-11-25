function [sys,x0,str,ts]=mdlInitializeSizes(h)
sizes=simsizes; %Create structure sizes
sizes.NumContStates=0;
sizes.NumDiscStates=2;
sizes.NumOutputs=2;
sizes.NumInputs=1;
sizes.DirFeedthrough=0;
sizes.NumSampleTimes=1;
sys=simsizes(sizes); % Initialization
x0=[0;0]; %Setting initial state
str=[]; %Spare variables defines as empty matrix
ts=[-1 0]; %Sampling period
end