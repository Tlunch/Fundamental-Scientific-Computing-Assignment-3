A = [7,-1,1,0;-2,8,-1,1;3,-1,9,2;0,1,-4,8];           %defining A
n = length(A);                                        %calculating n with the size of A to make the code more general
b = [-23;16;-17;13];                                  %defining b
xf = [-3;1;-1;1];                                     %defining the correct value of the x vector
x1 = [0;0;0;0];                                       %defining inital value of the x vector for the itterative vector 
test = true;                                          %initializing my test value for stopping my while loop as true
m = 1;                                                %initializing m as 1 to count my itterations from 1

while test == true                                    %using as there is multiple end conditions and the numberr of itterations is not known till the itterative process is precice enough
    m = m+1;                                          %counting the number of loops so that the max nuber of loops conditions will be fufilled
    m2 = norm((x1 - xf),inf)/norm(xf,inf);            %calculatingg the precision of the itteration as is defined in the question
    if m > 999 || m2 < 10^-6                          %testing if either of my conditions are fuffilled. the value 999 is used for m so thaat the process will stop on itteration 1000
        test = false;                                 %setting test to false so that the while loop will stop next itteration
    end
    for i = 1:n                                       %using a for loop to work through each value of x vector up to x_n
        loopvar = 0;                                  %resetting loopvar to stop the value being carried over from the previous itteration
        for j = 1:n                                   %itterating over j to do the sum within the guass-seidell method
            if i ~= j                                 %checking j =/= i as is required in the method
                loopvar = loopvar + A(i,j)*x1(j);     %doing the sum calculation as is specified by the method
            end
        end
        x1(i) = (1/A(i,i))*(b(i)-loopvar);            %assigning the final value of this itterations calculation to x in the ith position 
    end
end

fprintf("%i itterations were needed to get the aprroximation", m)
x1                                                    %displaying the final value