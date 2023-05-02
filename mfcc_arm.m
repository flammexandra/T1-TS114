function [mfcc] = mfcc(x,w,d,N_fft, N_{mfcc})
   
    [X, f, t] = stft(x,w,d,N_fft,Fs);
    [H, f] = compute_filter_bank( P, K, R, fs)
    
    L=length(H(1,:));
    M=floor(length(x)/d)-1;
    
    
    for i=1:M
        for j=1:P
    
            S_f= X(i,:).*H(:,j);
            E=sum(abs(S_f)*abs(S_f));
        end
    end
    
    
    
end

