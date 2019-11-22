function [sys,x0,str,ts]=han_eso(t,x,u,flag,a2,d,bet,b,T)
switch flag,
case 0, [sys,x0,str,ts] = mdlInitializeSizes;
case 2, sys = mdlUpdates(x,u,d,bet,b,T);
case 3, sys = x;
case {1, 4, 9 }, sys = [];
otherwise, error(['Unhandled flag = ',num2str(flag)]);
end;
% initialization function
function [sys,x0,str,ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 0;                        % no continuous states
sizes.NumDiscStates = 3;                        % 3 discrete states
sizes.NumOutputs = 3;                           % 3 output signals, that is, the states
sizes.NumInputs = 2;                            % two inputs
sizes.DirFeedthrough = 0;                       % states do not appear explicitly in output
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0 = [0; 0; 0]; str = []; ts = [-1 0];          % others
% updates the discrete-time states
function sys = mdlUpdates(x,u,d,bet,b,T)
e=x(1)-u(2);
sys=[x(1)+T*(x(2)-bet(1)*e);
x(2)+T*(x(3)-bet(2)*fal(e,0.5,d)+b*u(1));
x(3)-T*bet(3)*fal(e,0.25,d)];
% subfunction fal
function f=fal(e,a,d)
if abs(e)<d, f=e*d^(a-1); else, f=(abs(e))^a*sign(e); end