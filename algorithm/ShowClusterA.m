function  ShowClusterA( A,ctitle )
%SHOWCLUSTERA �˴���ʾ�йش˺�����ժҪ
%���ݸ�ʽΪ���У�ǰ�����Ƕ�ά���ݣ����һ�������  x,y,c  
%�����ʾ7�����ľ���

% colors=['r','g','b','y','m','c','k'];
N=length(unique(A(:,3)));
lineStyles = linspecer(N);
lineStyles=[[1,1,1];lineStyles];
figure;
for i=0:N
    ir = find(A(:,3)==i);         % ����������  
    if(~isempty(ir))
    scatter(A(ir,1),A(ir,2),'MarkerFaceColor',lineStyles(i+1,:));
    end
    hold on
end
hold off
title(ctitle);

end

