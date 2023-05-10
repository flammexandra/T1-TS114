function [mfcc_feat] = mfcc_features(x,w,d,N_fft, N_mfcc, Fs, P)
% This function returns a vector of the averaged P mfcc features
% Computation of the average of the mfcc features
[mfcc] = mfcc_arm(x,w,d,N_fft,N_mfcc, Fs, P);
mfcc_feat=mean(mfcc,2);

end

