function [mfcc] = mfcc(x,w,d,N_fft,N_mfcc, Fs, P)

    % This function returns the mfcc features
    K = N_fft/2 + 1; % Measurment of the restriction of the stft
    R = [0 Fs/2]; % two element vector that specifies frequency limits
    [X, f, t] = stft(x,w,d,N_fft,Fs);
    [H, f] = compute_filter_bank(P, K, R, Fs);

    X_abs = abs(X); 
   
    % Initialisation of parameters
    M=size(X_abs,2); %lenth of one column of X
    S_f=zeros(M,K);
    E=zeros(P,M);
    mfcc=zeros(N_mfcc,M);
   
    % Computation of the MF signal (stft multiply by the triangular filterbank)
    for i=1:M
        X_trans = X_abs(:,i)';
        X_cut = X_trans(1:K);
        S_f=H.*X_cut;
        for j=1:P
            E(j,i)=sum(abs(S_f(j,:)).^2);
        end
    end
    
    % Computation of the Discrete Cosine Transform
    for a=1:M
        for b=1:N_mfcc
            sum_mffc=0;
            for c=1:P
                sum_mffc=sum_mffc+log(E(c,a))*cos((pi/P)*b*(c-1/2));
            end
            mfcc(b,a)=(sqrt(2/P))*sum_mffc;
        end     
    end 
    
end

