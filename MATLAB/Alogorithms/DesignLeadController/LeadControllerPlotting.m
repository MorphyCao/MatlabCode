%*****Unit-step responses*****
num = [4];
den = [1 2 4];
numc = [166.8 735.588];
denc = [1 20.4 203.6 735.588];
t = 0:0.02:6;
[c1,x1,t] = step(num,den,t);
[c2,x2,t] = step(numc,denc,t);
plot (t,c1,'.',t,c2,'-')
grid
title('Unit-Step Responses of Compensated and Uncompensated Systems')
xlabel('t Sec')
ylabel('Outputs')
text(0.4,1.31,'Compensated system')
text(1.55,0.88,'Uncompensated system')
%*****Unit-ramp responses*****
num1 = [4];
den1 = [1 2 4 0];
num1c = [166.8 735.588];
den1c = [1 20.4 203.6 735.588 0];
t = 0:0.02:5;
[y1,z1,t] = step(num1,den1,t);
[y2,z2,t] = step(num1c,den1c,t);
plot(t,y1,'.',t,y2,'-',t,t,'--')
grid
title('Unit-Ramp Responses of Compensated and Uncompensated Systems')
xlabel('t Sec')
ylabel('Outputs')
text(0.89,3.7,'Compensated system')
text(2.25,1.1,'Uncompensated system')