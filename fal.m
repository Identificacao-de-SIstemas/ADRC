function [ output ] = fal( e, alpha, delta )
if abs(e) > delta
    output = (abs(e)^alpha)*sign(e);
else
    output = e/delta^(1-alpha);
end

end

