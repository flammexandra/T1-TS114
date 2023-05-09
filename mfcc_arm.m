function [mfcc] = mfcc_arm(x,w,d,N_fft,N_mfcc, Fs, P)

    K = N_fft/2 + 1;
    R = [0 Fs/2];
    [X, f, t] = stft(x,w,d,N_fft,Fs);
    [H, f] = compute_filter_bank(P, K, R, Fs);

    X_abs = abs(X);
   
    M=floor(length(x)/d)-1;
    S_f=zeros(M,K);
    E=zeros(P,M);
    mfcc=zeros(N_mfcc,M);
    
    
    for i=1:M
        % col_X=X(1:K,i)';
        % col_X1=col_X(1:K);
        % for j=1:P
        %     S_f(j,:)= col_X1.*H(j,:);
        %     E(j,i)=sum(abs(S_f(j,:)).*abs(S_f(j,:)));
        % 
        % end
        X_trans = X_abs(:,i)';
        X_cut = X_trans(1:K);
        S_f=H.*X_cut;
        for j=1:P
            E(j,i)=sum(abs(S_f(j,:)).^2);
        end
    end

    figure;
    plot(S_f);

    E
    

    for a=1:N_mfcc
        for b=1:M
            sum_mffc=0;
            for c=1:P
                sum_mffc=sum_mffc+log(E(a,b))*cos((pi/P)*b*(a-1/2));
            end
            mfcc(a,b)=((2/P)^1/2)*sum_mffc;
        end     
    end 
    
end

