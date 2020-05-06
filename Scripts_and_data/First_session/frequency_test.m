%
% Impostazioni esperimento:
% - scalino con offset zero, ampiezza 30 e switch a T = 2000
% - generatore sinusoidale: ampiezza 20, start time 8000.
% - fine della simulazione a T = 12000
%

close all; clear; clc;

data = csvread('data.csv', 1);
start = find(data(:,1) == 8000);
t = data(start:end,1);
Q1 = data(start:end,2);
Q2 = data(start:end,3);
T1 = data(start:end,4);
T2 = data(start:end,5);
Tp = data(start:end,6);

t = t - t(1);
Tp = Tp - mean(Tp);
Q1 = Q1 - 30;
plot(t,Q1,'b',t,10*Tp,'r'); grid;


%% Modelli


mu = 4.15/30;
M1 = tf(mu,[130 1]);
M2 = tf(mu,conv([130 1],[10 1]));
M3 = tf(mu*[5 1],conv(conv([130 1],[10 1]),[2 1]));
M4 = tf(mu*[4 1],conv(conv([110 1],[12 1]),[2 1]));

%% Risposta in frequenza

m1 = 8.2/20/10; 
p1 = (60-113)/240*360;

m2 = 3.72/20/10;
p2 = (1710-1746)/120*360;

m3 = 1.36/20/10;
p3 = (2055-2076)/60*360;

%% Plot

w = logspace(-3,0);
[mM1,pM1] = bode(M1,w);
[mM2,pM2] = bode(M2,w);
[mM3,pM3] = bode(M3,w);
[mM4,pM4] = bode(M4,w);
mM1dB = 20*log10(mM1(:));
pM1   = pM1(:);
mM2dB = 20*log10(mM2(:));
pM2   = pM2(:);
mM3dB = 20*log10(mM3(:));
pM3   = pM3(:);
mM4dB = 20*log10(mM4(:));
pM4   = pM4(:);

wp   = 2*pi./[240 120 60];
mpdB = 20*log10([m1 m2 m3]);
pp   = [p1 p2 p3];

figure;
subplot(211);
semilogx(w,mM1dB,'b',w,mM2dB,'g',w,mM3dB,'r',wp,mpdB,'ok');
subplot(212);
semilogx(w,pM1,'b',w,pM2,'g',w,pM3,'r',wp,pp,'ok');
legend('primo ordine','secondo ordine','terzo ordine con zero');


figure;
subplot(211);
semilogx(w,mM3dB,'r',w,mM4dB,'b',wp,mpdB,'ok');ylabel('|G(j\omega)| [ dB ]')
subplot(212);
semilogx(w,pM3,'r',w,pM4,'b',wp,pp,'ok');ylabel('\angle G(j\omega) [ ° ]');xlabel('\omega')
legend('M3', 'M4');
