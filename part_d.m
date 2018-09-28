clc;
clear all;
close all;

%% Variable declaration
pb1_a=[];       % for saving pb1 values for different m - formula
pb2_a=[];       % for saving pb2 values for different m - formula
pb1_b=[];       % for saving pb1 values for different m - simulation
pb2_b=[];       % for saving pb2 values for different m - simulation

%% Calculation part
% calculating probabilities pb1 and pb2 using erlang's formula 
for m = 20:5:60
    k=m;
    [pb1,pb2] = part_a_func(m,k);
    pb1_a = [pb1_a,pb1];
    pb2_a = [pb2_a,pb2];
end

% calculating probabilities pb1 and pb2 using simulation
for m = 20:5:60
    k=m;
    [pb1,pb2] = simccn(m,k);
    pb1_b = [pb1_b,pb1];
    pb2_b = [pb2_b,pb2];
end

%% Ploting the results. 

x_axis = [20:5:60];
figure;
k = plot(x_axis,pb1_b,'r',x_axis,pb2_b,'b',x_axis,pb1_a,'r*',x_axis,pb2_a,'bO');
xlabel('m'); 
ylabel('blocking probabilities'); 
title('All probabilities on same graph');

str = {'Red line - pb1 using simulation','Red * - gives pb1 using erlang formula','Blue line - pb2 using simulation','Blue O - pb2 using erlang formula'};
text(45,0.5,str);

k(1).LineWidth = 2;
k(2).LineWidth = 2;
k(3).MarkerSize = 5;
k(4).MarkerSize = 10;


% Plot of pb1 on same graph
% For erlang's formula red color is used
% For simulation green color is used



figure;
k1 = plot(x_axis,pb1_b,'r-*',x_axis,pb1_a,'b-O');
k1(1).LineWidth=2;
k1(2).LineWidth=2;
xlabel('m'); 
ylabel('blocking prob. pb1'); 
title('Compare pb1 for erlangs formula & simulation');
str1 = {'Red line - pb1 using simulation','Blue line - pb2 using erlang formula'};
text(45,0.5,str1);


% Plot of pb2 on same graph
% For erlang's formula red color is used
% For simulation green color is used

figure;
k2 = plot(x_axis,pb2_b,'r-*',x_axis,pb2_a,'b-O');
k2(1).LineWidth=2;
k2(2).LineWidth=2;
xlabel('m'); 
ylabel('blocking prob. pb2'); 
title('Compare pb2 for erlangs formula & simulation');
str2 = {'Red line - pb1 using simulation','Blue line - pb2 using erlang formula'};
text(45,0.5,str2);


% figure;
% plot(x_axis,pb1_b)
% xlabel('m');
% ylabel('pb1');
% title('pb1 using simulation is plotted')
% for i=1:length(pb1_a)
%     
%     str = {pb1_b(i),pb1_a(i)};
%     text(x_axis(i),pb1_b(i),str);
% end
% str1= {'Upper value denotes pb1 using simulation', 'Lower value pb1 using erlang formula'};
% text(45,0.5,str1);
% 
% figure;
% plot(x_axis,pb2_b);
% xlabel('m');
% ylabel('pb2');
% title('pb2 using simulation(prob. pb2 using erlange are marked for comparision)')
% for i=1:length(pb1_a)
%     
%     str = {pb2_b(i),pb2_a(i)};
%     text(x_axis(i),pb1_b(i),str);
% end
% str1= {'Upper value denotes pb1 using simulation', 'Lower value pb1 using erlang formula'};
% text(45,0.5,str1);
