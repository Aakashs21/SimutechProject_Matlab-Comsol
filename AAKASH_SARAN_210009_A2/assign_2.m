A=zeros(20,20);
B=zeros(20,1);

for i=2:20
    B(i,1)=-0.209;
end  
B(1,1) = -1950.209;

for i=2:1:19
   A(i,i-1)=20.5-i;
   A(i,i)=2*(i) - 40.008;
   A(i,i+1)=19.5-(i);
   
end
A(1,1)=2*(1) - 40.008;
A(1,2)=19.5-(1);
A(20,19)=1;
A(20,20)=-1.008;

A
B
maxerr = 1e-5;
T = zeros(1,size(A,1));
err1 = inf;
itr = 0;
while all(err1>maxerr)
    T_old = T;
    for i = 1:size(A,1)
        sum = 0;
        for j = 1:i-1
            sum = sum + A(i,j)*T(j);
        end
        for j=i+1:size(A,1)
        sum = sum+A(i,j)*T_old(j);
        end
        T(i) = (1/A(i,i)) * (B(i) - sum);
    end
    itr = itr + 1;
    y(itr,:) = T;
    err1 = abs(T_old-T);
end
for i=1:1:20
    fprintf("T_%d is %d.\n",i,T(i));
end
x=0.01:0.01:0.2;
plot(x,T)
