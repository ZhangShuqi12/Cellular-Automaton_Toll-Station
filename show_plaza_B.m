function h = show_plaza_B(plaza,h)
%用图像显示元胞空间
[L, W] = size(plaza); %获取车道长度，车道数


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
    plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')%画纵线
    plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')%画横线
    axis image
    set(gca,'xtick',[]);%去掉下面x轴的标签
    set(gca,'ytick',[]);%去掉左边y轴的标签
end