function plaza = move_forward_B(plaza)
[L, W] = size(plaza); %get its dimensions
prob = .7;
delay = 3;
%% 收费亭过后 %%
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
%% 收费亭 %%
%对于收费亭的车，我们用plaza矩阵中相应位置元素记录其在收费亭中的时间，
%当这个服务时间等于或大于标准服务时间，且收费亭前面位置为空位时，
%那么该车就离开当前收费亭前进到前面的位置
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
%% 未进入收费亭区域 %%
% 与离开收费亭后的区域的原理相同
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