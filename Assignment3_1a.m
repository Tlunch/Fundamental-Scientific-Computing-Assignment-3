a = [10^-1,10^-9];                           %set up values for alpha
p = [1,2,inf];                               %set up values to be used in norm function
syms x                                       %using x as a symblic varible
A = [1+x,1;1,1-x];                           %defining A using the symbolic varible x for later substitution

for i = 1:2                                  %using for loops this first one will itterate over alpha as that changes the base matrix
    A2 = subs(A,x,a(i));                     %working out my current matrix depending on alpha 
    A3 = inv(A2);                            %working out the inverted form
    for i2 = 1:3                             %this for loop will itterate over my diffent p values for the norms
        cond = norm(A2,p(i2))*norm(A3,p(i2)); %i reaize there will be a function for directly working out the condition number but i already knew norm and inverse
        if i2 == 3                           %using an if statement for printing as inf and 1 are different data types in p so need different fprintf statements
            fprintf("The condition number for %s alpha and %s p norm is %5.5f \n", a(i), p(i2),cond);%pretty standard printing
        else
            fprintf("The condition number for %s alpha and %i p norm is %5.5f\n", a(i), p(i2),cond);
        end
    end

end                                          % the end statements close off the loops and if statements

