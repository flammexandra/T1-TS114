close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

%Question 13

% A demander: ne manque t il pas des valeurs... K R et fs?
load('data/one1.mat');
load('data/one2.mat');
N = 0.03*Fs;
d = N/2;
P = 20;
N_fft = 1024;
N_mfcc = 20;
w = hamming(N);

[mfcc1] = mfcc_arm(one1,w,d,N_fft,N_mfcc, Fs, P);

[mfcc2] = mfcc_arm(one2,w,d,N_fft,N_mfcc, Fs, P);

[mfcc_feat1] = mfcc_features(one1,w,d,N_fft, N_mfcc, Fs, P);
[mfcc_feat2] = mfcc_features(one2,w,d,N_fft, N_mfcc, Fs, P);


figure;
plot(mfcc1);

figure;
plot(mfcc2);

figure;

plot(mfcc_feat1(2:end));
figure;
plot(mfcc_feat2(2:end));
