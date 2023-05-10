function [X, f, t] = stft(x,w,d,N_fft,Fs)
% This function computes the stft for m = [0, d, 2d, 3d...]
% This function outputs are:
% -> X, which is a matrix of n_fft lines and M columns
%   M is the number of elements of m
%   X(i,j) is the value of the spectrogram for time t(i) and frequency f(j)
% -> f, is a column vector of the frequencies (in Hz)
% -> t, is a row vector containing the times of the beginning of the windows

% Initialisation of parameters 
N = length(w); % Length of the winded signal
L = length(x);
M = floor(L/d) - 1; % Number of frames
X = zeros(N_fft,M); % Initialisation of the TF
w = reshape(w, N, 1);

% Compution of TF
for j = 1:M
    vect_x = x((j-1)*d + 1:(j-1)*d+N); % Extraction of vectors of x 
    window = w.*vect_x; % vectors winded by window
    X(:,j) = fft(window,N_fft); % Compution of TF
end

% Expression of f and t
f = (0:Fs/N_fft:Fs);
t = (0:d/Fs:L/Fs);

end