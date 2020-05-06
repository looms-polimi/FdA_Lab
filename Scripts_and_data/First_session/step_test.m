%
% Impostazioni esperimento:
% - scalino con offset zero, ampiezza 30 e switch a T = 2000
% - fine della simulazione a T = 3000
%

close all; clear; clc;

data = csvread('data.csv', 1);
t  = data(:,1);
Q1 = data(:,2);
Q2 = data(:,3);
T1 = data(:,4);
T2 = data(:,5);
Tp = data(:,6);

dex = find(diff(Q1));
t  = t(dex:end)-t(dex);
Tp = Tp(dex:end)-Tp(dex);
Q1 = Q1(dex:end)-Q1(dex);
plot(t,Tp); grid;

%% Rimozione deriva temperatura aria

Tp = Tp - t*1.025/1000;
figure; plot(t, Tp); grid

%% Modello a un polo

mu = 4.15/30;
T  = 650/5;
M1 = tf(mu,[T 1]);
figure; plot(t,Tp,'b',t,30*step(M1,t),'r'); grid;

%dopo varie prove 
M1=tf(4.15/30,[130 1]);

%% Modello a due poli

T1 = 130;
T2 = 10;
M2 = tf(mu,conv([T1 1],[T2 1]));
%figure; plot(t,Tp,'b',t,30*step(M2,t),'r'); grid;

%% Modello tre poli e uno zero

T1 = 130;
T2 = 10;
T3 = 2;
Z1 = 5;
M3 = tf(mu*[Z1 1],conv(conv([T1 1],[T2 1]),[T3 1]));
figure; plot(t,Tp,'b',t,30*step(M3,t),'r'); grid;
