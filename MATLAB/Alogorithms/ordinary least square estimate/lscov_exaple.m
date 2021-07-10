clear all;
clc;
x1 = [.2 .5 .6 .8 1.0 1.1]';
x2 = [.1 .3 .4 .9 1.1 1.4]';
X = [ones(size(x1)) x1 x2];

y = [.17 .26 .28 .23 .27 .34]';

a = X\y

[b, se_b, mse] = lscov(X,y)