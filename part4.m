close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

%Question 13

% A demander: ne manque t il pas des valeurs... K R et fs?
load('data/one1.mat');
N = 0.03*Fs;
d = N/2;
P = 20;
N_fft = 1024;
N_mfcc = 20;
w = hamming(N);

[mfcc] = mfcc_arm(one1,w,d,N_fft,N_mfcc, Fs, P);

mfcc

figure;
plot(mfcc);