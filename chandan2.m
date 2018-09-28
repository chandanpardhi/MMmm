% Part b simulation


clc;
clear all;
close all;
%%
lambda1=5;
lambda2=7;
mu1=(1/4);
mu2=(1/3);
m=50;
k=20;
inter_arr_c1 = exprnd(1/lambda1,1,100000);
inter_arr_c2 = exprnd(1/lambda2,1,100000);

time_instants_c1=cumsum(inter_arr_c1);
time_instants_c2=cumsum(inter_arr_c2);

service_time_c1 = exprnd(1/mu1,1,100000);
service_time_c2 = exprnd(1/mu2,1,100000);

t=0;
t_prev = 0;
time_passed = 0;
server(1:m)=0;
class(1:m) =0;
service_class(1:m)=0;
total_c1 = 0;
total_c2 = 0;
blocked_c1=0;
blocked_c2=0;

%%

while((length(time_instants_c1)~=0) && (length(time_instants_c2)~=0))
    
    t_c1 = time_instants_c1(1);
    t_c2 = time_instants_c2(1);
    
    server = server - time_passed;
        for i = 1:m 
            if server(i) < 0
                server(i)=0;
                class(i) = 0;
            end
        end


        if t_c1 < t_c2
            t = time_instants_c1(1); 
            time_instants_c1(1)=[];
            total_c1 = total_c1 +1;
            [servers_busy,index]=min(server);        
            if servers_busy == 0                
                          
                service_time = service_time_c1(1);
                service_time_c1(1)=[];

                server(index)=service_time;
                class(index) = 1;

            else
                blocked_c1 = blocked_c1 + 1;
                service_time_c1(1)=[];
            end
        end


        if t_c1 > t_c2
            total_c2 = total_c2 +1;
            t=time_instants_c2(1);
            time_instants_c2(1)=[];
            [servers_busy,index]=min(server);   
            
            if ((servers_busy == 0) && (sum(class==2)<=k))
                
                
                service_time = service_time_c2(1);
                service_time_c2(1)=[];
                server(index)=service_time;
                class(index)=2;

            else
                blocked_c2 = blocked_c2 + 1;                
                service_time_c2(1)=[];
            end
        end

        if (t_c1 == t_c2) 
            t = time_instants_c1(1); 
           
            time_instants_c1(1)=[];
            time_instants_c2(1)=[];
                
            total_c1 = total_c1 +1; 
            total_c2 = total_c2 +1;
            [servers_busy,index]=min(server);

            if (servers_busy == 0)
                                                
                service_time = service_time_c1(1);
                service_time_c1(1)=[];
                server(index)=service_time;
                class(index) = 1;      
                [servers_busy,index]=min(server);
                 if ((server_busy == 0) && (sum(class==2)<=k))                    

                    service_time = service_time_c2(1);
                    service_time_c2(1)=[];
                    server(index)=service_time;
                    class(index)=2;
                  else
                    blocked_c2 = blocked_c2 +1;
                    service_time_c2(1)=[];
                 end           
            else
                blocked_c1 = blocked_c1 + 1;
                blocked_c2 = blocked_c2 + 1;
                
                service_time_c1(1)=[];
                service_time_c2(1)=[];
            end
        end

    time_passed = t-t_prev;
    t_prev=t;
    
end

%%


    pb1 = (blocked_c1/total_c1)
    pb2 = (blocked_c2/total_c2)