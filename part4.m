close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

%Question 13

% A demander: ne manque t il pas des valeurs... K R et fs?
N = 30;
d = 15;
P = 20;
N_mfcc = 20;
Fs = 44100;
x = load('data/one1.mat');
w = hamming(N);

[mfcc] = mfcc_arm(x,w,d,N_fft,N_mfcc);