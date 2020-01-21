function [sys, x0, str, ts] = ctrl(t, x, u, flag, b, kp)
    switch flag
        case 0
            [sys, x0, str, ts] = mdlInitializeSizes();
        case 3
            sys = mdlUpdates(u, b, kp);
        case {1, 2, 4, 9}
            sys = [];
        otherwise
            error(['Unhanded flag = ', num2str(flag)]);
    end
end

function [sys, x0, str, ts] = mdlInitializeSizes()
    sizes = simsizes;
    sizes.NumContStates = 0;
    sizes.NumDiscStates = 0;
    sizes.NumInputs = 3;
    sizes.NumOutputs = 1;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes);
    x0 = [];
    str = [];
    ts = [-1 0];
end

function sys = mdlUpdates(u, b, kp)
    sys = (kp * (u(1) - u(2)) - u(3)) / b;
end