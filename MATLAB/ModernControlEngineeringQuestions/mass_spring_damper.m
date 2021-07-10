s = tf('s');
wn = 1;
kesi = 0.5;

sys = 1 / (s*s + 2*kesi*wn*s + wn*wn);

bode(sys)

hold on 

kesi = 1.0;
sys1 = 1 / (s*s + 2*kesi*wn*s + wn*wn);

bode(sys1)

kesi = 1.5;
sys2 = 1 / (s*s + 2*kesi*wn*s + wn*wn);

bode(sys2)