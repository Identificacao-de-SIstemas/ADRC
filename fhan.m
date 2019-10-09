function [output] = fhan(v1, v2, r0, h0)
d = h0*r0^2;
a0 = h0*v2;
y = v1 + a0;
a1 = sqrt(d*(d + 8*abs(y)));
a2 = a0 + sign(y)*(a1 - d)/2;
sy = (sign(y + d) - sign(y - d)) /2;
a = (a0 + y - a2)*sy + a2;
sa = (sign(a + d) - sign(a - d)) /2;
output = -r0*(a/d - sign(a))*sa - r0*sign(a);
end

