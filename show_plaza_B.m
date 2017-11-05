function h = show_plaza_B(plaza,h)
%��ͼ����ʾԪ���ռ�
[L, W] = size(plaza); %��ȡ�������ȣ�������


PLAZA(:,:,1) = plaza;
PLAZA(:,:,2) = plaza;
PLAZA(:,:,3) = plaza;

PLAZA = 1-PLAZA;
PLAZA(PLAZA>=888)=0.3;
for i=1:L
    if i~=(L+1)/2
        for j=2:W-1
            if plaza(i,j)==1
                PLAZA(i,j,1) =0;
                PLAZA(i,j,2) =0.5;
                PLAZA(i,j,3) =0.5;
            end
        end
    end
end

for i = (L+1)/2
    for j = 2:W-1
        if plaza(i,j)<=1.2&&plaza(i,j)>=0;
            PLAZA(i,j,1) =0;
            PLAZA(i,j,2) =1;
            PLAZA(i,j,3) =0;
        elseif plaza(i,j)<-2.9&&plaza(i,j)>=-4;
            PLAZA(i,j,1) =0;
            PLAZA(i,j,2) =0;
            PLAZA(i,j,3) =1;
        elseif plaza(i,j)<-4.9&&plaza(i,j)>=-6;
            PLAZA(i,j,1) =1;
            PLAZA(i,j,2) =0;
            PLAZA(i,j,3) =0;
        end
    end
end
if ishandle(h)
    set(h,'CData',PLAZA)
else
    figure('position',[20,50,200,700])
    h = imagesc(PLAZA);    
    hold on
    plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')%������
    plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')%������
    axis image
    set(gca,'xtick',[]);%ȥ������x��ı�ǩ
    set(gca,'ytick',[]);%ȥ�����y��ı�ǩ
end