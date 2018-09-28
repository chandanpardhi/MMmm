clc;
clear all;
close all;
%% for part b 
m=50; k=20;
[pb1,pb2] =simccn(m,k);            % Function call to calculate pb1 and pb2 using simulation
fprintf('Part b : \nFor m = 50 and k = 20 ')
fprintf('Blocking Probability :'); 
display(pb1);
fprintf('Blocking Probability :');
display(pb2);

%% for part c
m=50; k=m;

[pb_1,pb_2] = simccn(m,k);

fprintf('part c : \nFor m = 50 and k equals to m ')
fprintf('Blocking Probability :'); 
display(pb_1);
fprintf('Blocking Probability :');
display(pb_2);