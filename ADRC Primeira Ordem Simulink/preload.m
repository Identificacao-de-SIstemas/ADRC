num = [1];
den = [1, 3];

ts = 4/den(2);
kp = 4/ts;
b = num * den(2);

set_param('ADRC/Kp', 'Gain', num2str(kp))
set_param('ADRC/B', 'Gain', num2str(1/b))
set_param('ADRC/Plant', 'Numerator', num2str(num))
set_param('ADRC/Plant', 'Denominator', strcat('[',num2str(den),']'))
