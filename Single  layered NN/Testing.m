count=0;
mean_error=[];
for training_number=linspace(1,1000,1000)
    count=count+1;
    Training(training_number);
    load('Trained_Network.mat');
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
    output=zeros(m,1);
    weighted_sum=zeros(m,1);
    for k=1:m
        transposed_Input=input(k,:)';
        weighted_sum(k)=sum(Weight(k,:)*transposed_Input);
        output(k)=Sigmoid(weighted_sum(k));
    end
    Err=(correct_output-output);
    abs_mean_error=mean(abs(Err));
    mean_error(count)=abs_mean_error;
    disp(output)
end
y=mean_error;
x=linspace(1,1000,1000);
plot(x,y)
t=xlabel('Training number');
t.Color='red';
t=ylabel('Mean error');
t.Color='red';


   