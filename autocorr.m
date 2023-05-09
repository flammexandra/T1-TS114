function [gam_x, p] = autocorr(xi,maxP)
   % This function computes the autocorrelation estimator of equation (3)
   % for lags p = [-maxP+1, ..., 0, 1, ..., maxP-1]
   p=(-maxP+1):(maxP-1);
   % This function returns:
   % -> gam_x, which is  a vector of lenght 2*maxP-1 elements
   %     containing the autocorrelation values
   % -> p is a vector containing the different lags at which
   %     the autocorrelation is computed
   gam_x=zeros(1,2*maxP-1);
   xi_conj=conj(xi)';
   gam_x(maxP)=(1/maxP)*xi_conj*xi;
   for i = 1:maxP-1
        xi_conj=[0 xi_conj];
        xi_conj=xi_conj(1:length(xi_conj)-1);
        gam_x(maxP+i)=1/(maxP-i)*xi_conj*xi;
        gam_x(maxP-i)=conj(gam_x(maxP+i));   
   end
end