%% Define parameters
kp = 1;
ki = 0;
k_lead = 1;
z_lead_Hz = 100;    % Zero of lead lag filter [Hz]
p_lead_Hz = 2000;   % Pole of lead lag filter [Hz]
f_range_Hz = 8000;  % Frequency range of interest [Hz] 

%% Process Data
s = tf('s');
z_lead_rad_s = z_lead_Hz * 2 * pi;  % Zero of lead lag filter [rad/s]
p_lead_rad_s = p_lead_Hz * 2 * pi;  % Pole of lead lag filter [rad/s]

%% Calulate controller = (kp + ki*s) * k_lead * (s+z_lead)/(s+p_lead)
C = (kp + ki*s) * k_lead * (s+z_lead_rad_s)/(s+p_lead_rad_s);

%% Draw Controller
f_range_rad_s = 2 * pi * (1:2:f_range_Hz);  % Frequency range of interest [rad/s] 

[mag, phase] = bode(C, f_range_rad_s);
bode(C)