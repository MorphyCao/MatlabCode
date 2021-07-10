s = tf('s');
%% Plant
G = 4 / (s*(s+2));

%% Controller
% Gc = Kc*a * (Ts+1)/(aTs+1) = K * (Ts+1)/(aTs+1)
a = 1;
T = 1;
% 1.Calculate K to satisfy the velocity contstant requirement of the system.
% The system it self is a order 1 system, so it have 0 position static
% error but finite velocity static error
K = 10;
% Gc = K * (T*s + 1) / (a*T*s + 1);

%% System
G1 = K * G;
% bode(G)
% hold on

options = bodeoptions;
options.FreqUnits = 'Hz';
% bode(G)
% hold on
% 2.1 Use decided K value to get the current phase marging of C*P
% margin(G1)  % phase margin of G1 = 17 degrees

%% Required system phase margin = 50 degrees
% Additional phase lead necessary to satisfy the relative stability 
% requirement is 33 degrees
% Note: Addition of a lead compensator modifies the magnitude currve in the
% bode diagram, the gain crossover frequency will be shifted to the right
% (as the lead compensator tilt the slope of the gain curve up)
% sin(theta_max) = (1-a)/(1+a)
% 2.2 From required phase margin to calcaulate a
theta_max = 38;  % [degrees]
a = (1-sin(theta_max/180*pi))/(1+sin(theta_max/180*pi));

%% 3.Determine the corner frequencies 1/T and 1/aT of the lead compensator
% 3.1 Maximum phase-lead angle occurs at the geometric mean of the two corner
% frequencies, or w = 1/(sqrt(a)*T)
% 3.2 The amount of the modification in the magnitude curve at w =
% 1/(sqrt(a)*T) due to the inclusion of the lead compensator is 1/sqrt(a) =
% 6.2 dB
% 3.3 Gain of G1 = -6.2 dB corresponds to w = 9 rad/s. We shall select this
% frequency to be the new gain crossover frequency.Using this 0dB cross
% frequency of the lead compensator is 1/(sqrt(a)*T); So 1/T = 4.41 and
% 1/(at) = 18.4
T = 1/4.41;

Gc = K * (T*s + 1) / (a*T*s + 1);
% bode(Gc);
% hold on

CP = Gc * G;
% nyquist(CP)
% [MAG,PHASE] = bode(CP);
% PHASE = PHASE(1,:);
% MAG = MAG(1,:);
% polar(PHASE*pi/180, MAG)
% hold on
% CL = feedback(CP, 1);
% bode(CL)

%% Step response
t = 0:0.02:6;
% c1 = step(G,t);
y1 = step(feedback(CP,1),t);
hold on
y2 = step(feedback(G1,1),t);
plot(t,y1,t,y2,'-');
grid
title('Unit-Step Response of Compensated and Uncompensated Systems')
xlabel('t Sec')
ylabel('Outputs')
legend('Compensated System', 'Uncompensated System')
%% End
% Note that the bandwidth is approximately equal to the gain crossover
% frequency. The lead compensator causes the gain cross over frequency to
% increase (lead compensator bends the gain curve of plant up). The
% increase in the cross over frequency means an increase in the bandwidth.
% This implies an increase in the bandwidth. This implies an increase in
% the speed of response.
% Note that for type 1 plant, the value of the static velocity error
% constant Kv is merely the value of the frequency corresponding to the
% intersection of the extension of the initial -20dB/decade slope line and
% the 0dB line









