    clc;
    B=20;L=6;loadlength=70;squarelength=10;%������������Ķ�
    global plazalength;%����ȫ�ֱ�������������
    plazalength = 2*loadlength+1;
    total_entry = zeros(1,5);
    start_entry = zeros(1,5);
    temp=zeros(1,5);
    for op=1:5
   
        plaza = create_plaza_B(B,L,loadlength,squarelength);%���ɶ�ά���飬��ʾԪ���ռ��״̬����

        %====================================================
  
        h = show_plaza_B(plaza,NaN);                        %��ͼ����ʾԪ���ռ�
  
        %====================================================
        start=0;
        entryS=0;
   
        for i = 1:500

      
            entry = floor(rand(1,3)*1.2);
      
            plaza = new_cars_B(plaza, entry);
        
       
            start=start+length(find(plaza(1,:)==1));
               
            plaza = move_forward_B(plaza); %ǰ������
               
                
            plaza = switch_lanes(plaza); %��������
               
            %�������ʱ�䲽��Ԫ���ռ�ĳ�������ʱ��

            h = show_plaza_B(plaza,h);                     %����ͼ��
              
            drawnow
               
            entryS=entryS+length(find(plaza(end,:)==1));
            plaza = clear_boundary(plaza);%��Ҫ�뿪ϵͳ�ĳ�������Ҫ��������ϵͳ���Ƴ�������Ԫ���ռ������һ�д���0 ����Ϊ0
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
