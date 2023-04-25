function [X, f, t] = stft(x,w,d,N_fft,Fs)

% Initialisation of parameters 
N = length(w); % Length of the winded signal
M = floor(L/d); % Number of frames
X = zeros(N_fft:M); % Initialisation of the TF

% Compution of TF
for j = 1:M
    vect_x = x(j:j+N-1); % Extraction of vectors of x 
    window = w.*vect_x; % vectors winded by window
    X(:,j) = fft(window,N_fft); % Compution of TF
end

% Expression of f and t
f = (0:Fs/N_fft:Fs);
t = (0:d:M);

end