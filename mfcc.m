function [mfcc] = mfcc_arm(x,w,d,N_fft,N_mfcc, Fs, P)

    K = N_fft/2 + 1;
    R = [0 Fs/2];
    [X, f, t] = stft(x,w,d,N_fft,Fs);
    [H, f] = compute_filter_bank(P, K, R, Fs);

    X_abs = abs(X);
   
    M=size(X_abs,2);%taille de la colonne de X
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

