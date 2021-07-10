clear all;
close all;
% tf of plant
nump = [1];
denp = [0.5 1.5 1 0];
sysp = tf(nump, denp);
% tf of feedback system
sys = feedback(sysp, 1);
% bode plot range
w = logspace(-1, 1);
bode(sys, w)
% ��Ƶ����ǣ��ͽ��ٶ���Ϣ
[mag, phase, w] = bode(sys, w);
% ����Ƶ�����Ӧ��Index
[Mp, k] = max(mag);
% ��Ƶת��ΪdB��λ
resonant_peak = 20 * log10(Mp)
% г��Ƶ��
resonant_frequency = w(k)
% ��>=-3dB�ķ�Ƶ
n = 1;
while 20 * log(mag(n)) >= -3; n = n + 1;
end
% �������������ʾ
bandwidth = w(n)
