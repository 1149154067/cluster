%ʹ��SLIC�ֿ飬ÿһ�����HOG��������Ϊÿһ�����������ʹ������������DPC����
%ʹ��HOG�������ֶ�̫�ߣ�ԭľһ���Ķ���Ϊ�ǲ�һ���ģ�(

clear all  
close all  
clc
%% ��ȡͼƬ
filename='1';
A = imread(sprintf('images/%s.jpg',filename));
[row,col,h]=size(A);

%% ʹ��superpixels�ֿ�
[L,N] = superpixels(A,5000);
figure
BW = boundarymask(L);
imshow(imoverlay(A,BW,'cyan'),'InitialMagnification',100)
idx = label2idx(L);
%% ��ÿһ������󳤶ȣ������������飬�Ա�������
maxRow=0;
maxCol=0;
for i = 1:N
    [X,Y]=ind2sub([row,col],idx{i});
    minX=min(X);
    maxX=max(X);
    if(maxX-minX+1>maxRow)
        maxRow=maxX-minX+1;
    end
    minY=min(Y);
    maxY=max(Y);
    if(maxY-minY+1>maxCol)
        maxCol=maxY-minY+1;
    end
end
maxRow=ceil(maxRow/3)*3;
maxCol=ceil(maxCol/3)*3;
%% ��ÿһ����ԭ����ֵ
cell_imgs=cell(1,N);
for i = 1:N
    [X,Y]=ind2sub([row,col],idx{i});
    minX=min(X);
    maxX=max(X);
    minY=min(Y);
    maxY=max(Y);
    tempRect=zeros(maxRow,maxCol,3);
    for m=1:length(X)
        tempRect(X(m)-minX+1,Y(m)-minY+1,:)=A(X(m),Y(m),:);
    end
    cell_imgs{i}=tempRect;
end
%% ��ȡÿһ�������
cell_imgs_val=cell(1,N);
for i = 1:N
    tempRect=cell_imgs{i};
    [featureVector,hogVisualization] = extractHOGFeatures(tempRect,'CellSize',[2,2]);
    cell_imgs_val{i}=featureVector;
end 
%% ʹ�þ�ֵ��Ϊÿһ���������
for i = 1:N
    new_imgs_val(i,:)=cell_imgs_val{i}(1,:);
end 
[coeff,score,latent] = pca(new_imgs_val);
new_img_after=DPC(new_imgs_val*coeff(:,1:1000),7);
%����DPC�����е����ľ�����
max_num=tabulate(new_img_after{2});
max_num=sortrows(max_num,-2);
max_ind=max_num(1,1);

%�ҳ�����Ҫ�ľ������ĵ�
new_img_center=find(new_img_after{2}~=max_ind);

% �Ǿ������ĵĿ�����Ϊ��ɫ
A2=repmat(A,1);
for i=1:length(new_img_center)
    x=new_img_center(i);   
    [I,J]=ind2sub([row,col],idx{x});
    for m=1:length(I)
        A2(I(m),J(m),:)=255;
    end
end
figure;imshow(A);
figure;imshow(A2);