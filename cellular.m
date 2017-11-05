    clc;
    B=20;L=6;loadlength=70;squarelength=10;%参数可视情况改动
    global plazalength;%定义全局变量，车道长度
    plazalength = 2*loadlength+1;
    total_entry = zeros(1,5);
    start_entry = zeros(1,5);
    temp=zeros(1,5);
    for op=1:5
   
        plaza = create_plaza_B(B,L,loadlength,squarelength);%生成二维数组，表示元胞空间的状态矩阵

        %====================================================
  
        h = show_plaza_B(plaza,NaN);                        %用图像显示元胞空间
  
        %====================================================
        start=0;
        entryS=0;
   
        for i = 1:500

      
            entry = floor(rand(1,3)*1.2);
      
            plaza = new_cars_B(plaza, entry);
        
       
            start=start+length(find(plaza(1,:)==1));
               
            plaza = move_forward_B(plaza); %前进规则
               
                
            plaza = switch_lanes(plaza); %换道规则
               
            %计算这个时间步长元胞空间的车辆逗留时间

            h = show_plaza_B(plaza,h);                     %更新图像
              
            drawnow
               
            entryS=entryS+length(find(plaza(end,:)==1));
            plaza = clear_boundary(plaza);%将要离开系统的车辆，需要将车辆从系统中移除，即将元胞空间中最后一行大于0 的设为0
            pause(0.01);
        end
        % total_wait(i) = waiting_time;
        S(op)=length(find(plaza(1:loadlength,:)~=-888));
        total_entry(op) = entryS;
        start_entry(op) = start;
        temp(op)=length(find(plaza==1))+length(find(plaza==-2));
    end
        
    show_plaza_B(plaza,h);

    figure(6);
    plot(total_entry)
    title('Thougthput');
    S=mean(S);
    total_entry=mean(total_entry);
    start_entry=mean(start_entry)-mean(temp);
