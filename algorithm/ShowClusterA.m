function  ShowClusterA( A,ctitle )
%SHOWCLUSTERA �˴���ʾ�йش˺�����ժҪ
%���ݸ�ʽΪ���У�ǰ�����Ƕ�ά���ݣ����һ�������  x,y,c  
%�����ʾ7�����ľ���

% colors=['r','g','b','y','m','c','k'];
N=unique(A(:,3));
lineStyles = linspecer(N);
lineStyles=[[1,1,1];lineStyles];
figure;
for i=1:N
    ir = find(A(:,3)==i);         % ����������   
    scatter(A(ir,1),A(ir,2),uint8(lineStyles(kk+1,:)*255));
    hold on
end
hold off
title(ctitle);

end

