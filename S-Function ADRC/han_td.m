function [sys,x0,str,ts]=han_td(t,x,u,flag,r,h,T)
switch flag,
case 0, [sys,x0,str,ts] = mdlInitializeSizes(T);        % Initialization
case 2, sys = mdlUpdates(x,u,r,h,T);                    % update states
case 3, sys = x;                                        % evaluate output
case {1, 4, 9 }, sys = [];                              % unused flag s
otherwise, error(['Unhandled flag = ',num2str(flag)]);  % error handling
end;
function [sys,x0,str,ts] = mdlInitializeSizes(T)        % initialization function
sizes = simsizes;                                       % get the parameter template
sizes.NumContStates = 0;                                % no continuous state
sizes.NumDiscStates = 2;                                % two discrete states
sizes.NumOutputs = 2;                                   % two output, follows the two states
sizes.NumInputs = 1;                                    % one input signal
sizes.DirFeedthrough = 0;                               % state is not explicitly used in computing output
sizes.NumSampleTimes = 1;                               % one sampling interval
sys = simsizes(sizes);                                  % set the new template
x0 = [0; 0];                                            % set initial states to zeros
str = []; ts = [-1 0];                                  % other augments
% update the discrete-time state variables
function sys = mdlUpdates(x,u,r,h,T)                    % discrete state equation
sys=[x(1)+T*x(2); x(2)+T*fst2(x,u,r,h)];
% subfunction fst2
function f=fst2(x,u,r,h)
delta=r*h; delta0=delta*h; y0=x(1)-u+h*x(2);
a0=sqrt(delta*delta+8*r*abs(y0));
if abs(y0)<=delta0, a=x(2)+y0/h;
else, a=x(2)+0.5*(a0-delta)*sign(y0); end
if abs(a)<=delta, f= -r*a/delta; else, f= -r*sign(a);
end
