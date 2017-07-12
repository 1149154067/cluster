
clc;
clear;
close all;
%% ��ȡͼ������

%% ��ȡ����  ��������Ŀ Y_NUM=4;�����ĿK=3;
% AA=load('F:\matlabwork\cluster\dateset\iris2.data');Y_NUM=4;K=3;
% AA=load('F:\matlabwork\cluster\dateset\seeds_dataset.txt');Y_NUM=7;K=3;
% AA=load('F:\matlabwork\cluster\dateset\dim512.txt');Y_NUM=512;K=3;
AA=load('F:\matlabwork\cluster\dateset\dim1024.txt');Y_NUM=1024;K=3;
% AA=load('F:\matlabwork\cluster\dateset\iris2.data');Y_NUM=4;K=3;

%% �����й�һ�� 
AA1=normalization(AA(:,1:Y_NUM));
% A=[AA1,AA(:,Y_NUM+1)];
% labels=AA(:,Y_NUM+1);
%no label
labels=ones(length(AA(:,1)),1);
A=[AA1,labels];

X=AA1;


%% ��ά����ʾ��� 

% no_dims = round(intrinsic_dim(X, 'MLE'));
% disp(['MLE estimate of intrinsic dimensionality: ' num2str(no_dims)]);
no_dims=2;
[mappedX, mapping] = compute_mapping(X, 'PCA', no_dims);	
ShowClusterA([mappedX,labels],'Result of PCA');
% figure, scatter(mappedX(:,1), mappedX(:,2), 5, labels); title('Result of PCA');
% [mappedX, mapping] = compute_mapping(X, 'Laplacian', no_dims, 7);	
% figure, scatter(mappedX(:,1), mappedX(:,2), 5, labels); title('Result of Laplacian Eigenmaps'); drawnow
% [mappedX, mapping] = compute_mapping(X, 'LLE', no_dims, 7);	
% figure, scatter(mappedX(:,1), mappedX(:,2), 5, labels); title('Result of LLE Eigenmaps'); drawnow

if Y_NUM>30 
    KY_NUM=30;
else
    KY_NUM=Y_NUM;
end
[mappedX, mapping] = compute_mapping(X, 'tSNE', no_dims, KY_NUM);	
figure, scatter(mappedX(:,1), mappedX(:,2), 140, labels); title('Result of tsne Eigenmaps'); drawnow
% ShowClusterA([mappedX,labels],'Result of tsne tSNE');
