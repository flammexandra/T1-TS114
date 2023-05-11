function [rtc] = real_time_classification(x,w,d,N_fft, N_mfcc, Fs, P, matF_train, matF_test, k)

% This function performs the following tasks:
% --> record 2 seconds of signal
% --> find if there are spoken words using an energy threshold
% --> extract these words
% --> classify these words
% --> display the sign image corresponding to the classified word
% --> go back to step 1

L = length(x);

for i = 1:2:L
    x_cut = x(i:i+1);
    threshold = 0.75;

    % Use of the function succes_probability to test if a word exist in the 2 seconds of signal
    if succes_probability(matF_train, matF_test, k) > threshold
        
    end

    % Use of the energy threshold and the train classifier to extract the word 


end