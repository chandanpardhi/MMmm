clc;
clear all;
close all;

m=50; k=20;                     % m:number of servers, k: limit on class 2 customers.
[pb1,pb2] =part_a_func(m,k);    % Function call to calculate blocking prob. using erlang formula.
fprintf('Part a : \n')
fprintf('Blocking Probability :');   % Blocking prob for class 1 customers
display(pb1);
fprintf('Blocking Probability :');   %Blocking prob for class 1 customers
display(pb2);
