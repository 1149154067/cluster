%�����ȡ64��64���㣬ʹ���ܶȾ����㷨��ľ������ģ�����slic�ľ�������

%ʹ��SLIC�ֿ飬ÿһ���������ֵ����Ϊÿһ�����������ʹ������������DPC����
%������Ҷ��ԭľ���ֲ�����������Ч�����ܺã��ǲ�������ֵ��Ҫ����ѡһ����
%������ʹ��HOG��������Ϊ����̫��������ɾ���ˡ�

clear all  
close all  
clc
%% ��ȡͼƬ
filename='1';
A = imread(sprintf('images/%s.jpg',filename));
[row,col,h]=size(A);
%% ��ͼƬ��ÿ�����ص�������
features=img_val(A);

%% ʹ��superpixels�ֿ�
[L,N] = superpixels(A,2000);
figure
BW = boundarymask(L);
imshow(imoverlay(A,BW,'cyan'),'InitialMagnification',100)
idx = label2idx(L);
%% ��ȡÿһ�������
cell_imgs_val=cell(1,N);
for i = 1:N
    cell_imgs_val{i}=features(idx{i},:);
end 
%% ʹ�þ�ֵ��Ϊÿһ���������
for i = 1:N
    new_imgs_val(i,:)=mean(features(idx{i},:));
end 

new_img_after=DPC(new_imgs_val,3);
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