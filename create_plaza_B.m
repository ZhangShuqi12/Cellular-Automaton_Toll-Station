function plaza = create_plaza_B(load, output,length,squarelength)
global plazalength;%��·����
plazalength = 2*length+1;
plaza = zeros(plazalength,load+2);%����Ŀ��Ϊ��·�Ŀ��+2
plaza(1:plazalength,[1,load+2]) = -888;%һ��ʼʱ����һ�к����һ����Ϊ���ɽ���
temp=ceil((length-squarelength)/(load-output));
st=load-output;
for i=length-squarelength:-temp:length-squarelength-temp*(load-output-1)
    for j=1:temp
        if i-j>1
            plaza(i-j,2:load+1-output-st+1)=-888;
        elseif i-j==1
            plaza(i-j,2:load+1-output-st+1)=-888;
            break;
        else break
        end
    end
    st=st-1;
end

plaza(plazalength:-1:plazalength-(plazalength-1)/2+1,:)=plaza(1:(plazalength-1)/2,:);
plaza([1,plazalength],:)=[-888*ones(2,1+load-output),zeros(2,output),-888*ones(2,1)];

plaza((plazalength+1)/2,2:load+1)=-6*ones(1,load);
plaza((plazalength+1)/2,[load-1,load+1])=-[0 0];
plaza((plazalength+1)/2,load:-2:2)=-888;

