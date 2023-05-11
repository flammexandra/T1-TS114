function [P] = success_probability(matF_test,matF_train,k)

%This function returns P , the probability of success for the classification

len_test=length(matF_test(1,:));
len_train=length(matF_train(1,:));

% Initialisation of success counter
success=0;


for i_f=1:len_test
    % Initialisation of f value
    f=matF_test(2:12,i_f);

    % Determination of classified class
    closer=matF_train(1,f_class(f,k,matF_train,len_train));
    
    if closer==matF_test(1,i_f)
        success=success+1;
    end
    
end

P=success/len_test;
