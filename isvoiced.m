 function [voicedFlag, pitch] = isvoiced(xi,Fs)
   
   % This function the voiced/unvoiced flag and the pitch
   % This function returns:
   % -> voicedFlag = 1 if x is voiced
   %    voicedFlag = 0 if x is unvoiced
   %
   % -> pitch contains the pitch in Hz

   % Compution of maximum lag for a duration of 30ms 
    maxP=floor(0.03*Fs);
    
    voicedFlag=0;
    pitch=0;
    
    % gam_x : store autocorrelation values , p : store the corresponding
    % lags
    [gam_x,p]=autocorr(xi,maxP);
    
    gam_x_restricted=gam_x(maxP+Fs/500:maxP+Fs/50);
    
    %compute of the maximum value of gam_x_restricted and its corresponding index
    [local_max, p_star]=max(gam_x_restricted);

    if local_max >= 0.6*gam_x(maxP)
        voicedFlag=1;
        pitch=Fs/(p_star+maxP+Fs/500);
    end

end