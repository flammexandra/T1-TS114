function [matF] = train_classifier(data,train)
% This function returns matF, a matrix contaning features
% for every element of the train set.

matF = [];
for i = 1:size(train,3)
    % Found the start index and stop index
    id_start = train(2,i);
    id_stop = train(3,i);
    % Found the last 11 MFCC coef

    N = 30;
    d = 15;
    P = 20;
    N_fft = 1024;
    N_mfcc = 20;
    [x, Fs] = data(:,id_start:id_stop);
    w = hamming(N);
    [mfcc] = mfcc_arm(x,w,d,N_fft,N_mfcc, Fs, P);

    % Add the mfcc to the matF
    matF = [matF mfcc];
end
end