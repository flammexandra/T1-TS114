close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

load("data/data_2.mat");
load("data/train_1.mat");
[matF] = train_classifier(data_2,train_1,Fs);

figure;
plot(matF(:,1));