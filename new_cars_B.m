function plaza = new_cars_B(plaza, entry)
%��create_entry ���������ɵĳ�����������ӵ�Ԫ���ռ������
% if entry > 0 
%     
%     unoccupied = find( plaza(1,:) == 0 );% �鿴һ�³�����һ��������������ӳ�
%     n = length(unoccupied); % ���Լӳ��ĳ�����
%     x = randperm(n);%�����Լӳ��ĳ�����Ŵ���
%     temp = min(entry,n);
%     for i = 1:temp%ȡ���Լӵĳ������������ĳ������ߵ���Сֵ
%         plaza(1,unoccupied(x(i))) = 1;
%     end
% end
if sum(entry) > 0 
    
    unoccupied = find( plaza(1,:) == 0 );% �鿴һ�³�����һ��������������ӳ�
    n = length(unoccupied); % ���Լӳ��ĳ�����
    x = randperm(n);%�����Լӳ��ĳ�����Ŵ���
    temp = min(sum(entry),n);
    for i = 1:temp%ȡ���Լӵĳ������������ĳ������ߵ���Сֵ
         plaza(1,unoccupied(x(i))) = 1;
    end
end
%% 21 44 45