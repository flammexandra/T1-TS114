close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window
clear all;

%% 5 Classification

%% 5.1 Train the classifier

%Question 14

load("data/data_1.mat");
load("data/train_1.mat");
[matF] = train_classifier(data_1,train_1,Fs);

figure;
plot(matF(:,1));

%Question 15
load("data/test_1.mat");
matF_test=train_classifier(data_1,test_1,Fs);
matF_train=train_classifier(data_1,train_1,Fs);