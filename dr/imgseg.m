
clc;
clear;
close all;
%% ��ȡ����
dd=load('mappedX.mat');
A=dd.mappedX;
A(:,3)=1;
% A=load('F:\matlabwork\cluster\dateset\pathbased.txt');

%����
%% ��ʾԭʼ��� 
%���ݸ�ʽΪ���У�ǰ�����Ƕ�ά���ݣ����һ�������  x,y,c  
%�����ʾ7�����ľ���
K=4;
ShowClusterA(A,'origin spiral');

%% ��ʾ������
%kmeans����
[cc,Dsum2,z2] = kmeans(A(:,[1,2]),K);
B=[A(:,[1,2]),cc];
ShowClusterA(B,'kmean spiral');

%FCM����
[centers,U] = fcm(A(:,[1,2]),K);
maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
C1=zeros(1,length(maxU));
C1(index1)=1;
C1(index2)=2;
C=[A(:,[1,2]),C1'];
ShowClusterA(C,'FCM spiral');

%DBSCAN���࣬ѡ��epsilon��MinPts�����ϰ���Ĺ���
epsilon=1.2;
MinPts=10;
IDX=DBSCAN(A(:,[1,2]),epsilon,MinPts);
D=[A(:,[1,2]),IDX];
ShowClusterA(D,'DBSCAN spiral');

%�׾��� SpectralClustering

% W=pdist2(A(:,[1,2]),A(:,[1,2]),'minkowski',3);
% [E1, L, U] = SpectralClustering(W, 3, 3);
% E=[A(:,[1,2]),];
% ShowClusterA(E,'SpectralClustering spiral')

%�ܶȷ����

B=pdist2(A(:,[1,2]),A(:,[1,2]),'minkowski',2);
%  B=pdist2(img_val,img_val,'minkowski',2);%���ɾ���Ķ�ά���� 
% save('B.mat','B');%�������ݣ����ڲ������ַ�����ʱ��
%  distance=mat2dist(B);%�Ľ���ֱ�ӵ��ú�����Ч�ʱȽϺ�

 [row_b,col_b]=size(B);
%  clear distance;
 distance=zeros(row_b*(row_b-1)/2,3);%��СΪm*(m-1)/2
 index=1;
 for i=1:row_b
     for j=i+1:col_b
         distance(index,1)=i;
         distance(index,2)=j;
         distance(index,3)=B(i,j);
         index=index+1;
     end
 end
ret=DPC(distance,3);

F=[A(:,[1,2]),ret{2}'];
ShowClusterA(F,'DBC Clustering spiral')

%% ָ������