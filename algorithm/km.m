
clc;
clear;
close all;
%% ��ȡ����
% AA=load('F:\matlabwork\cluster\dateset\flame.txt');K=2;
% AA=load('F:\matlabwork\cluster\dateset\Aggregation.txt');K=7;
AA=load('F:\matlabwork\cluster\dateset\pathbased.txt');K=3;
% AA=load('F:\matlabwork\cluster\dateset\spiral.txt');K=3;
% AA=load('F:\matlabwork\cluster\dateset\s2.txt');K=4;

%% �����й�һ�� 
AA1=normalization(AA(:,[1,2]));
A=[AA1,AA(:,3)];
%no label
% LAB=ones(length(AA(:,1)),1);
% A=[AA1,LAB];

%����
%% ��ʾԭʼ��� 
%���ݸ�ʽΪ���У�ǰ�����Ƕ�ά���ݣ����һ�������  x,y,c  
%�����ʾ7�����ľ���
ShowClusterA(A,'origin spiral')

%% ��ʾ������
%kmeans����
% [cc,Dsum2,z2] = kmeans(A(:,[1,2]),K)
% B=[A(:,[1,2]),cc];
% ShowClusterA(B,'kmean spiral')
% 
% %FCM����
% [centers,U] = fcm(A(:,[1,2]),K);
% maxU = max(U);
% C1=zeros(1,length(maxU));
% for i=1:K
%     index1 = find(U(i,:) == maxU);
%     C1(index1)=i;
% end
% C=[A(:,[1,2]),C1'];
% ShowClusterA(C,'FCM spiral')
% 
% %DBSCAN���࣬ѡ��epsilon��MinPts�����ϰ���Ĺ���
% %��һ���󣬶�flameʹ��epsilon=0.2;���кܺõ�Ч��
% epsilon=0.2;
% MinPts=10;
% IDX=DBSCAN(A(:,[1,2]),epsilon,MinPts);
% D=[A(:,[1,2]),IDX];
% ShowClusterA(D,'DBSCAN spiral')
% 
% %�׾��� SpectralClustering
% 
% W=pdist2(A(:,[1,2]),A(:,[1,2]),'minkowski',2);
% [E1, L, U] = SpectralClustering(W, K, 3);
% E=[A(:,[1,2]),E1];
% ShowClusterA(E,'SpectralClustering spiral')
% 
% %AP����
% pref = median(median(W));
% [idx,~,~,~]=apcluster(W,pref);
% ptsIdx=unique(idx);
% %ת��Ϊ���
% G1=zeros(length(idx),1);
% for i=1:length(ptsIdx)
%     G1(find(idx==ptsIdx(i)),:)=i;
% end
% G=[A(:,[1,2]),G1];
% ShowClusterA(G,'APClustering spiral')

%DBC�ܶȷ����
ret=DPC(A(:,[1,2]),K);

F=[A(:,[1,2]),ret{2}'];
ShowClusterA(F,'DBC Clustering ');
cc=A(ret{1},[1,2]);
scatter(cc(:,1),cc(:,2),'filled','d','r');
%% ָ������
%��label��û��label��

%% ָ��Ƚ�