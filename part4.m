close all; % Resets matlab workspace
close all; % Close every open figure
clear all;
clc; % clear the command window


%% 4.1 Voiced/Voiceless flag and pitch

% Question 10

    
%one1
load('/Users/alexandramony/Documents/TS114-project/ts114-19425/data/one1.mat');
one1_compute=compute(one1,Fs);



%one2
load('/Users/alexandramony/Documents/TS114-project/ts114-19425/data/one2.mat');
one2_compute=compute(one2,Fs);



t = tiledlayout(2,2);
nexttile
plot(one1_compute(1,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(one2_compute(1,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Voiced Flag One');
legend('One1', 'One2');

nexttile
plot(one1_compute(2,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(one2_compute(2,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Pitch One');
legend('One1', 'One2');


%two1
load('/Users/alexandramony/Documents/TS114-project/ts114-19425/data/two1.mat');
two1_compute=compute(two1,Fs);


%two2
load('/Users/alexandramony/Documents/TS114-project/ts114-19425/data/two2.mat');
two2_compute=compute(two2,Fs);

nexttile
plot(two1_compute(1,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(two2_compute(1,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Voiced Flag Two');
legend('Two1', 'Two2');

nexttile
plot(two1_compute(2,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(two2_compute(2,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Pitch two');
legend('Two1', 'Two2');


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
