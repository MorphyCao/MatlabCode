clear all;
clc
t = (-2:0.001:3)' * 5;
n = randn(size(t)); % 噪声
s = sin(t);         % 信号
x = s + n;          % 带噪信号
R = cov(n);         % 测量误差协方差
Q = 200;
y = KalmanFilter(x,Q,R);
e = s - y;
figure;
subplot(211);
plot(x,'color',[0.2 0.5 0.8],'linewidth',2);hold on;
plot(y,'color',[1 0.6 0],'linewidth',2);
plot(s,'color',[1 0.9 0],'linewidth',2);
legend('观测','滤波','真值','location','Best');
axis tight
subplot(212);
plot(e,'color',[0.2 0.5 0.8]);axis tight
legend('误差','location','Best');
axis tight