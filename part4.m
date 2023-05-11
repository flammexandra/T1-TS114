close all; % Resets matlab workspace
close all; % Close every open figure
clear all;

close all; % Resets matlab workspace
close all; % Close every open figure
clear all;

%% Part 4 : Feature extraction

% 4.1 Voiced/Voiceless flag and pitch

% Question 8 : code "autocorr.m"

% Question 9 : code "isvoiced.m"


% Question 10 : 
% %% Initialisation of some variables
% Load of the datas
load('data/one1.mat');   
load('data/one2.mat');
load('data/two1.mat');
load('data/two2.mat');

%% Start of your processing

% The pitch features for each frame 
one1_compute=compute(one1,Fs);
one2_compute=compute(one2,Fs);
two1_compute=compute(two1,Fs);
two2_compute=compute(two2,Fs);


%% Display of processing 



figure;
subplot(2,2,1);
plot(one1_compute(1,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(one2_compute(1,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Voiced Flag One');
legend('One1', 'One2');

subplot(2,2,2);
plot(one1_compute(2,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(one2_compute(2,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Pitch One');
legend('One1', 'One2');


subplot(2,2,3);
plot(two1_compute(1,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(two2_compute(1,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Voiced Flag Two');
legend('Two1', 'Two2');

subplot(2,2,4);
plot(two1_compute(2,:),"o","MarkerSize", 8, "LineWidth", 2);
hold on;
plot(two2_compute(2,:),"x","MarkerSize", 8, "LineWidth", 2);
title('Pitch two');
legend('Two1', 'Two2');


%4.2 MFCC

%Question 11 : code "mfcc.m"

%Question 12: code "mfcc_features.m"

%Question 13 :
%% Initialisation of some variables

load('data/one1.mat');
load('data/one2.mat');
load('data/two1.mat');
load('data/two2.mat');

N = 0.03*Fs; %duration of the window 30ms 
w = hamming(N);
d = N/2;
P = 20;
N_fft = 1024;
N_mfcc = 20;

%% Start of your processing

% mfcc coefficients for each signal 
[mfcc_one1] = mfcc(one1,w,d,N_fft,N_mfcc, Fs, P);
[mfcc_one2] = mfcc(one2,w,d,N_fft,N_mfcc, Fs, P);
[mfcc_two1] = mfcc(one2,w,d,N_fft,N_mfcc, Fs, P);
[mfcc_two2] = mfcc(one2,w,d,N_fft,N_mfcc, Fs, P);

% mfcc
[mfcc_feat_one1] = mfcc_features(one1,w,d,N_fft, N_mfcc, Fs, P);
[mfcc_feat_one2] = mfcc_features(one2,w,d,N_fft, N_mfcc, Fs, P);
[mfcc_feat_two1] = mfcc_features(two1,w,d,N_fft, N_mfcc, Fs, P);
[mfcc_feat_two2] = mfcc_features(two2,w,d,N_fft, N_mfcc, Fs, P);

%% Display of processing 

figure;
subplot(2,1,1);
plot(mfcc_feat_one1(2:end)); % We don't take in the consideration the first value :(2:end)
hold on;
plot(mfcc_feat_one2(2:end));
title('Mffc features for one');
legend('One1', 'One2');
ylabel('mffc coefficients');
xlabel('N_(mfcc)');

subplot(2,1,2);
plot(mfcc_feat_two1(2:end));
hold on;
plot(mfcc_feat_two2(2:end));
title('Mffc features for two');
legend('Two1', 'Two2');
ylabel('mffc coefficients');
xlabel('N_(mfcc)');


