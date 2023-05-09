function [mfcc_feat] = mfcc_features(x,w,d,N_fft, N_mfcc, Fs, P)

[mfcc] = mfcc_arm(x,w,d,N_fft,N_mfcc, Fs, P);
mfcc_feat=mean(mfcc,2);

end

