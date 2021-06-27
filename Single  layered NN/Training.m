function Training(training_number)
   input=[0 0 1;
           0 1 1;
           1 0 1;
           1 1 1;
           1 1 1];
    correct_output=[0
                1
                1
                1
                1];
[m,n]=size(input);
w=2*rand(1,n)-1;
Weight=zeros(m,n);
for k=1:m
    Weight(k,:)=w;
end
for j=1:m
        for epoch=1:training_number
            Weight(j,:)=SGD_method(Weight(j,:),input,correct_output,j);
        end
end
save('Trained_Network.mat')