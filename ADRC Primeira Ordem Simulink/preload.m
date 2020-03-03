num = [100];
den = [1, -5];

ts = 4 / den(2);
kp = 4 / ts;
b = num;

set_param('ADRC_14a/Kp', 'Gain', num2str(kp))
set_param('ADRC_14a/B', 'Gain', num2str(1/b))
set_param('ADRC_14a/Plant', 'Numerator', num2str(num))
set_param('ADRC_14a/Plant', 'Denominator', strcat('[',num2str(den),']'))
