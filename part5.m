close all; % Resets matlab workspace
close all; % Close every open figure
clc; % clear the command window

%% 5 Classification
%% 5.1 Train the classifier
%% Question 14
%% Initialisation of some variables

load("data/data_1.mat");
load("data/train_1.mat");

load("data/data_2.mat");
load("data/train_2.mat");

%% Start of processing

matF_train_1 = train_classifier(data_1,train_1,Fs);
matF_train_2 = train_classifier(data_2,train_2,Fs);


%% Test the classifier
%% Question 15
%% Initialisation of some variables

load("data/test_1.mat");
load("data/test_2.mat");

%% Start of processing

% Optimized Nearest Neighbors for test 1
k_test1=2;

matF_test_1 = train_classifier(data_1,test_1,Fs);

% Success probability
p_1=success_probability(matF_test_1,matF_train_1,k_test1);


% Optimized Nearest Neighbors for test 2
k_test2=3;

matF_test_2 = train_classifier(data_2,test_2,Fs);

% Success probability
p_2=success_probability(matF_test_2,matF_train_2,k_test2);


%% Question 16
%% Start of processing

% Computation of the confusion matrix
Cm_test1=cm(matF_test_1,k_test1,matF_train_1);
Cm_test2=cm(matF_test_2,k_test2,matF_train_2);

%% Display of the processing 

figure;
subplot(2,1,1);
imagesc(Cm_test1);
title("Confusion matrix with success probaility (test1)");
xlabel("real class");
ylabel("classified class");


subplot(2,1,2);
imagesc(Cm_test2);
title("Confusion matrix with success probaility (test2)")
xlabel("real class");
ylabel("classified class");








