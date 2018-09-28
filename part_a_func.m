function [pb1,pb2] = part_a_func(m,k)
% this function calculates the blocking probabilities of class 1 and class
% 2 type customers.

lambda1 = 5;                         % Arrival Rate for class1
lambda2 = 7;                         % Arrival rate for class 2
service_time1= 4;                    % mean service time for class1 
service_time2= 3;                    % mean service time for class2
rho1 = lambda1*service_time1;        % rho  values
rho2 = lambda2*service_time2;

% variable initialisation
sum1=0; sum2=0; sum3=0; sum_1=0; sum_2=0; sum_3=0; sum_4=0; 

% Calculation of pb1 and pb2 by applying erlang's formula.

%% Calculation of Pb1

for n1=(m-k):m
    sum1 = sum1 + (rho1^n1)*(rho2^(m-n1))/(factorial(n1)*factorial(m-n1));
end

for n1=0:(m-k)
    for n2=0:k
        sum2 = sum2 + (rho1^n1)*(rho2^n2)/(factorial(n1)*factorial(n2));
    end
end

for n1=(m-k+1):m
    for n2=0:(m-n1)
        sum3 = sum3 + (rho1^n1)*(rho2^n2)/(factorial(n1)*factorial(n2));
    end
end

pb1= sum1/(sum2+sum3);


%% Calculation of Pb2

for n1=0:(m-k)
    sum_1 = sum_1 + (rho1^n1)*(rho2^k)/(factorial(n1)*factorial(k));
end


for n1=(m-k):m
    sum_2 = sum_2 + (rho1^n1)*(rho2^(m-n1))/(factorial(n1)*factorial(m-n1));
end

for n1=0:(m-k)
    for n2=0:k
        sum_3 = sum_3 + (rho1^n1)*(rho2^n2)/(factorial(n1)*factorial(n2));
    end
end

for n1=(m-k+1):m
    for n2=0:(m-n1)
        sum_4 = sum_4 + (rho1^n1)*(rho2^n2)/(factorial(n1)*factorial(n2));
    end
end
pb2= (sum_1+sum_2)/(sum_3+sum_4);

end

