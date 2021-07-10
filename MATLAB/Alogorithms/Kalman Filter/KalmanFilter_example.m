clear all;
clc
t = (-2:0.001:3)' * 5;
n = randn(size(t)); % ����
s = sin(t);         % �ź�
x = s + n;          % �����ź�
R = cov(n);         % �������Э����
Q = 200;
y = KalmanFilter(x,Q,R);
e = s - y;
figure;
subplot(211);
plot(x,'color',[0.2 0.5 0.8],'linewidth',2);hold on;
plot(y,'color',[1 0.6 0],'linewidth',2);
plot(s,'color',[1 0.9 0],'linewidth',2);
legend('�۲�','�˲�','��ֵ','location','Best');
axis tight
subplot(212);
plot(e,'color',[0.2 0.5 0.8]);axis tight
legend('���','location','Best');
axis tight