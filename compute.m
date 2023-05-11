function [x_compute] = compute(x,Fs)

    % Computation of the maximum pitch for the duration of 30ms
    maxP=floor(0.03*Fs);
    
    % Computation of the number of pitch periods that fit in the length of x
    nb_xi_extracted=floor(length(x)/maxP);
    
    %Store the voicing flag and pitch period for each segment
    x_compute=zeros(2,nb_xi_extracted);
   
    %Iteration for each segment of x 
    for i=1:(nb_xi_extracted)
        
        [voicedFlag_i,pitch_i]=isvoiced(x((i-1)*maxP+1:i*maxP),Fs);
        x_compute(1,i)=voicedFlag_i;
        x_compute(2,i)=pitch_i;
    
    end
end