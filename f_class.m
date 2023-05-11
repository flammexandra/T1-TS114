function [class] = f_class(f,k,matF_train,len_train)

%This function returns class, the classified class of f

dist_f=zeros(1,len_train);

% Computation of distance between f and f_prime for each iteration
for i_f_prime=1:len_train
   f_prime=matF_train(2:12,i_f_prime);
   dist_f(i_f_prime)=norm(f-f_prime);
end

% Determination of K-Nearest Neighbors
[~, sorted_i] = sort(dist_f);
k_nearest_i = sorted_i(1:k);

class=mode(k_nearest_i);

end