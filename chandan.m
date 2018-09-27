clc;
clear all;
close all;
%%
lambda1=5;
lambda2=7;
m=50;
inter_arr_c1 = exprnd(1/lambda1,1,70000);
inter_arr_c2 = exprnd(1/lambda2,1,70000);
server(1:m)=0;
time_instants=[0];
class=[0];
service_class(1:m)=0;
inter_arr=[0];
k=20;
t=0;
count_blocked_c2=0;
count_blocked_c1=0;
%while t < 10000

    
while((length(inter_arr_c1)~=0) && (length(inter_arr_c2)~=0))
    
    class_choice=randi(2)  ;                  %choice between server one to be served or server 2
    
    if class_choice ==1
        time_instants = [time_instants,(time_instants(end)+ inter_arr_c1(1))];
        inter_arr=[inter_arr,inter_arr_c1(1)];
        inter_arr_c1 = inter_arr_c1(2:end);
        class=[class, 1];
    end
    
    if class_choice ==2
        time_instants = [time_instants, (time_instants(end)+inter_arr_c2(1))];
        inter_arr=[inter_arr,inter_arr_c2(1)];
        inter_arr_c2 = inter_arr_c2(2:end);
        class=[class,2];
    end
end
total_c1=sum(class==1)
total_c2=sum(class==2)

c=2;
endtime = time_instants(end)
while(t<endtime)
    
    server = server - inter_arr(c);
    for i = 1:m 
        if server(i)<0
            server(i)=0;
        end
    end
      
    
    t=t+time_instants(c);
    
    [servers_busy,index]=min(server)
    inservice_c1=sum(service_class==1);
    
    inservice_c2=sum(service_class==2);
    if servers_busy == 0
        if class(c)==1
            service_time = exprnd(4);
            server(index)= service_time;
            service_class(index)=1;
        else  
                if inservice_c2 <= k 
                    service_time = exprnd(7);
                    server(index)= service_time;
                    service_class(index)=2;
                else
                    count_blocked_c2=count_blocked_c2+1;
                end
        end
     else
        if class(c) == 1
            count_blocked_c1=count_blocked_c1+1;
        elseif class(c)==2
            count_blocked_c2=count_blocked_c2+1;
        end
    end
        c=c+1;     
end 
    
pb1=(count_blocked_c1/total_c1)
pb2=(count_blocked_c2/total_c2)
