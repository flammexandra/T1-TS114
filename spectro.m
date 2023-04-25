function [Sx, f, t] = spectro(x,w,d,N_fft,Fs)

% Call of fonction sft to have the results
[X, f, t] = stft(x,w,d,N_fft,Fs);
N = length(w);

% Compution of STFT (spectogram)
Sx = (1/N)*(abs(X).*abs(X));

end