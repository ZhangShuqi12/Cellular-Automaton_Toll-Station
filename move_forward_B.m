function plaza = move_forward_B(plaza)
[L, W] = size(plaza); %get its dimensions
prob = .7;
delay = 3;
%% �շ�ͤ���� %%
for i = (L-1):-1:((L + 1)/2 + 1)
    for j = 1:W
        if plaza(i,j) == 1
            if plaza(i+1, j) ~= 0
                plaza(i,j) = -2;
            elseif prob >= rand
                plaza(i,j) = 0;
                plaza(i+1, j) = 1;
            end
        end
    end
end
%% �շ�ͤ %%
%�����շ�ͤ�ĳ���������plaza��������Ӧλ��Ԫ�ؼ�¼�����շ�ͤ�е�ʱ�䣬
%���������ʱ����ڻ���ڱ�׼����ʱ�䣬���շ�ͤǰ��λ��Ϊ��λʱ��
%��ô�ó����뿪��ǰ�շ�ͤǰ����ǰ���λ��
for i = (L-1)/2
    for j=2:W-1
        if plaza(i,j) > 0
            if  plaza(i+1,j)<=1&&plaza(i+1,j)>=0
                if plaza(i+1,j)<1&&plaza(i+1,j)>=0
                    plaza(i+1,j) = plaza(i+1,j)+0.5;
                    plaza(i,j) = 1;
                else
                    plaza(i+1,j) = 0;
                    plaza(i+2,j)=1;
                    plaza(i,j)=0;
                end
            elseif plaza(i+1,j)<=-3&&plaza(i+1,j)>=-4
                if plaza(i+1,j)<-3&&plaza(i+1,j)>=-4
                    plaza(i+1,j) = plaza(i+1,j)+0.125;
                    plaza(i,j) = 1;
                else
                    plaza(i+1,j) = -4;
                    plaza(i+2,j)=1;
                    plaza(i,j)=0;
                end                
            elseif plaza(i+1,j)<=-4.95&&plaza(i+1,j)>=-6
                if plaza(i+1,j)<-5&&plaza(i+1,j)>=-6
                    plaza(i+1,j) = plaza(i+1,j)+0.05;
                    plaza(i,j) = 1;
                else
                    plaza(i+1,j) = -6;
                    plaza(i+2,j)=1;
                    plaza(i,j)=0;
                end              
            end 
        end
    end
end
%% δ�����շ�ͤ���� %%
% ���뿪�շ�ͤ��������ԭ����ͬ
for i = (L-1)/2-1:-1:1
    for j = 1:W
        if plaza(i,j) == 1
            if plaza(i+1, j) ~= 0
                plaza(i,j) = -2;
            elseif prob >= rand
                plaza(i,j) = 0;
                plaza(i+1, j) = 1;
            end
        end
    end
end