function [matF] = train_classifier(data,train,Fs)
% This function returns matF, a matrix contaning features
% for every element of the train set.

    N = 0.03*Fs;
    d = N/2;
    P = 20;
    N_fft = 1024;
    N_mfcc = 12;
    
    w = hamming(N);

matF = zeros(N_mfcc, size(train,2));
L = length(train(1,:));
for i = 1:L
    % Found the start index and stop index
    start = train(2,i);
    stop = train(3,i);

    % Found the last 11 MFCC coef
    x = data(start:stop);
    [mfcc] = mfcc_features(x,w,d,N_fft,N_mfcc, Fs, P);

    % Add the mfcc to the matF
    matF(1,i) = train(1,i);
    matF(2:end, i) = mfcc(2:end);
end
end