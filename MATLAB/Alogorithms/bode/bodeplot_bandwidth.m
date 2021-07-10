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
% 幅频，相角，和角速度信息
[mag, phase, w] = bode(sys, w);
% 最大幅频与其对应的Index
[Mp, k] = max(mag);
% 幅频转换为dB单位
resonant_peak = 20 * log10(Mp)
% 谐振频率
resonant_frequency = w(k)
% 找>=-3dB的幅频
n = 1;
while 20 * log(mag(n)) >= -3; n = n + 1;
end
% 带宽由相角来表示
bandwidth = w(n)
