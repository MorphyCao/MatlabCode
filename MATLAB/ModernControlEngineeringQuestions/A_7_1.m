s = tf('s');
% closed-loop transfer function
sys = 10*(s+1)/(s+2)/(s+5);
bode(sys)

% In the absence of a zero, a second-order system with kesi>0.707 will not
% exhibit a resonance peak; however, the presence of a closed-loop zero
% will cause such a peak. In the presence of a zero, the loop is turned up
% at the zero. If the zero is smaller than both of the poles, the flat gain
% part of the bode plot will be turned up.