close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

%Question 13

N = 30;
d = 15;
P = 20;
N_mfcc = 20;
x=load('/net/t/asallmone007/ts114-19425/data/one1.mat');

mfcc = mfcc_arm(x,hamming(x),d,N_fft, N_mfcc);