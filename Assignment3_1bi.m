a = [10^-1,10^-9]; %set up values for alpha
syms x2 %using x as a symblic varible
A = [1+x2,1;1,1-x2]; %defining A using the symbolic varible x2 for later substitution
n=2;               
b=[3+2*x2;3-x2];               %editing the column vector to match the question
L = eye(2);                    %2x2 identity matrix
P=eye(n);        %2x2 matrix for permutation matrix P
B2 = [A b];                    %augment matrix                         

for i2 = 1:2 %using for loop this will itterate over alpha as that changes the base matrix
    B = subs(B2,x2,a(i2)); %working out my current matrix depending on alpha

    for k=1:n-1                    % step number (and row to be multipied)
   
     %%%%%Partial pivoting strategy
        [t,r]=max(abs(B(k:end,k))); %stores the maximum absolute value of b_{ik}
                           %for i=k,...n
                           %r stores the index of the element t
     %row number is offset by k-1
         r=k-1+r;
     %interchange row (B(k,:)) and row (B(r,:)) of B
         B([r,k],:)=B([k,r],:);
     %interchange row (P(k,:)) and row (P(r,:)) of P
         P([r,k],:)=P([k,r],:);
     %interchange L(k,1:k-1) and L(r,1:k-1)
         L([r,k],1:k-1)=L([k,r],1:k-1);
     %%%%%%%%%end of partial pivoting strategy
         for i=k+1:n %row number to be changed
            L(i,k)=B(i,k)/B(k,k);  % this is the multiplier 
            B(i,:)= B(i,:)-L(i,k)*B(k,:);  % row operation 
         end
    end

%perform backward substitution
    x=B(:,n+1);
    x(n)=B(n,n+1)/B(n,n);
    for i=n-1:-1:1
        x(i)=(B(i,n+1)-B(i,i+1:n)*x(i+1:n))/B(i,i);
    end
%solution
    fprintf('\nThe computed slution when alpha = %s is ', a(i2))
    x
    
end
% an error can be seen when alpha = 10^-9. this is caused by the values
% matlab is working with approaching and being more precise than machine
% epcilon hence matlab rounds and introduces error and inacuracy.