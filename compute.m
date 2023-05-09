function [x_compute] = compute(x,Fs)

    maxP=floor(0.03*Fs);
    nb_xi_extracted=floor(length(x)/maxP);
    x_compute=zeros(2,nb_xi_extracted);
    for i=1:(nb_xi_extracted)
        
        [voicedFlag_i,pitch_i]=isvoiced(x((i-1)*maxP+1:i*maxP),Fs);
        x_compute(1,i)=voicedFlag_i;
        x_compute(2,i)=pitch_i;
    
    end
end