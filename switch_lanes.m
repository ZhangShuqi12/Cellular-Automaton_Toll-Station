function plaza = switch_lanes(plaza)
%�������򣬵�����ǰ��λ�ñ���ĳ���ռ��ʱ���ó����ǻ���
%���ֳ�����ǰ��������״̬�Ѿ������Ϊ-2��������prob���л���
prob = 0.8;
priorityLeft = 0;
[L,W] = size(plaza);
for i = (L-1)/2:-1:1
        for j = 2:(W-1)
            if plaza(i,j) == -2
                if rand < prob %�������㣬����
                    if rand > priorityLeft %���ȿ������󻻵�
                        if j~=2 && plaza(i, j-1) == 0
                            plaza(i, j-1) = 1;
                            plaza(i, j) = 0;
                        elseif plaza(i, j+1) == 0 && j~=W-1
                            plaza(i, j+1) =1;
                            plaza(i,j) = 0;
                        else%���Ҷ����ܻ������õ�ǰԪ��״̬Ϊ1
                            plaza(i,j) = 1;
                        end
                    end
                else
                    plaza(i,j) = 1;
                end
            end
        end
end
for i = L-1:-1:(L+1)/2+1
         for j = 2:(W-1)
            if plaza(i,j) == -2
                if rand < prob %�������㣬����
                    if rand > priorityLeft %���ȿ������һ���
                        if plaza(i, j+1) == 0 && j~=W-1
                            plaza(i,j+1) = 1;
                            plaza(i,j) = 0;
                        elseif plaza(i, j-1) == 0 && j~=2
                            plaza(i, j-1) = 1;
                            plaza(i,j) = 0;
                        else
                            plaza(i,j) = 1;
                        end
                    end
                else
                    plaza(i,j) = 1;
                end
            end
         end
end