function [output] = fst(error, v2, r, h)
d = r*h;
d0 = d*h;
y = error + h*v2;
a0 = sqrt(d^2 + 8*r*abs(y));
if abs(y) <= d0
    a = v2 + y/h;
else
    a = v2 + 0.5*(a0-d)*sign(y);
end
if abs(a) <= d
    output = -r*a/d;
else
    output = -r*sign(a);
end

end

