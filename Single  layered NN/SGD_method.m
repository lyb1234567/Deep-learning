function Weight=SGD_method(Weight,input,correct_output,row_num)
alpha=0.9;
N=4;
[m,n]=size(input);
weighted_sum=zeros(m,1);
d=zeros(m,1);
error=zeros(m,1);
output=zeros(m,1);
delta=zeros(m,1);
dWeight=zeros(m,n);
for k=1:m
    transposed_Input=input(k,:)';
    d(k)=correct_output(k);
    weighted_sum(k)=sum(Weight*transposed_Input);
    output(k)=Sigmoid(weighted_sum(k));
    error(k)=d(k)-output(k);
    delta(k)=d_sigmoid(output(k))*error(k);
    dWeight(k,:)=alpha*delta(k)*transposed_Input;
for p=1:n
  Weight(p)=Weight(p)+dWeight(row_num,p);
end
end
