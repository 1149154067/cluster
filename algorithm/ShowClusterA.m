function  ShowClusterA( A,ctitle )
%SHOWCLUSTERA �˴���ʾ�йش˺�����ժҪ
%���ݸ�ʽΪ���У�ǰ�����Ƕ�ά���ݣ����һ�������  x,y,c  
%�����ʾ7�����ľ���

colors=['r','g','b','y','m','c','k'];
figure;
for i=1:7
    ir = find(A(:,3)==i);         % ����������   
    scatter(A(ir,1),A(ir,2),colors(i));
    hold on
end
hold off
title(ctitle);

end

