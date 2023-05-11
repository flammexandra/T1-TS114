function [Cm] = cm(matF_test,k,matF_train)

%This function returns the confusion matrix (Cm)

len_train=length(matF_train(1,:));
Cm=zeros(31);

for class=0:30
    proba=zeros(31,1);
    
    % Selection of test features of the right class
    tab_i_f=find(matF_test(1,:)==class);

    nb_f=length(tab_i_f)-1;

    for i_f=1:nb_f
        f=matF_test(2:12,tab_i_f(i_f));
        
        % Determination of classified class
        i_f_classified=f_class(f,k,matF_train,len_train);
        f_classified=matF_train(1,i_f_classified);
        
        proba(f_classified+1)=proba(f_classified+1)+1;
        
    end

    Cm(:,class+1)=proba/nb_f;

end

end