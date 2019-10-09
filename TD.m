function [sys,x0,str,ts]=TD(t,x,u,flag,r,h0,h)
switch flag
case 0 %initialization
[sys,x0,str,ts]=mdlInitializeSizes(h);
case 2 %update the discrete conditions
sys=mdlUpdates(x,u,r,h0,h);
case 3 %calculate the output signal
sys=mdlOutputs(x);
case {1,4,9} %don't need values
sys=[];
otherwise %error dispose
error(['unhandled flag=',num2str(flag)]);
end