function [mfcc] = mfcc_arm(x,w,d,N_fft,N_mfcc)

    [X, f, t] = stft(x,w,d,N_fft,Fs);
    [H, f] = compute_filter_bank(P, K, R, fs);
    
    L=length(H(1,:)); %Peut etre que c'est K
    M=floor(length(x)/d)-1;
    S_f=zeros(L,P);
    E=length(P,M);
    mfcc=length(N_mfcc,M);
    
    
    for i=1:M
        col_X=X(:,M)';
        col_X1=col_X(1:L);
        for j=1:P
            S_f(j,:)= col_X1.*H(j,:);
            E(j,i)=sum(abs(S_f(j,:)).*abs(S_f(j,:)));
            
        end
    end
    
    for a=1:N_mfcc
        for b=1:M
            sum_mffc=0;
            for c=1:P
                sum_mffc=sum_mffc+log(S_f(c,b))*cos((PI/p)*i(j-0.5));
            end
            mfcc(a,b)=((2/P)^1/2)*sum_mfcc;
        end     
    end 
    
end

