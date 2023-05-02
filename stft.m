function [X, f, t] = stft(x,w,d,N_fft,Fs)

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