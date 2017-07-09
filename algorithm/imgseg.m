
clc;
clear;
close all;
%% ��ȡ����
dd=load('mappedX.mat');
A=dd.mappedX;
A(:,3)=1;
% A=load('F:\matlabwork\cluster\dateset\pathbased.txt');

%% ���ݹ�һ��


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


ret=DPC(A(:,[1,2]),3);

F=[A(:,[1,2]),ret{2}'];
ShowClusterA(F,'DBC Clustering spiral')

%% ָ������