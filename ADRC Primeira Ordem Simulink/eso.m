function [sys, x0, str, ts] = eso(t, x, u, flag, b, kp)
    switch flag
        case 0
            [sys, x0, str, ts] = mdlInitializeSizes();
        case 2
            sys = mdlUpdates(x, u, b, kp);
        case 3
            sys = x;
        case {1, 4, 9}
            sys = [];
        otherwise
            error(['Unhanded flag = ', num2str(flag)]);
    end
end

function [sys, x0, str, ts] = mdlInitializeSizes()
    sizes = simsizes;
    sizes.NumContStates = 0;
    sizes.NumDiscStates = 2;
    sizes.NumInputs = 2;
    sizes.NumOutputs = 2;
    sizes.DirFeedthrough = 0;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes);
    x0 = [0; 0];
    str = [];
    ts = [-1 0];
end

function sys = mdlUpdates(x, u, b, kp)
    s_cl = -kp;
    s_eso = 10 * s_cl;
    l1 = -2 * s_eso;
    l2 = s_eso^2;
    sys = [l1 * (u(2) - x(1)) + x(2) + b * u(1);
            l2 * (u(2) - x(2))];
end