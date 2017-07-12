%��ȡͼ��,����tsne��ά
%��ͼ���ÿ�����ص������,��ά����ά
%�ڶ�ά�������ϲ鿴��ͼ�����ص�ķֲ�
%ͼ��̫���˾Ͳ���.90*100�ľ�Ҫ2������ͷ
%


clear all  
close all  
%% ����ͼƬ
filename='5-1-1';
img=imread(sprintf('%s.jpg',filename));
[row,col,h]=size(img);

imgs_val=img_val(uint8(img));

train_X =normalization(imgs_val);

labels=ones(col*row,1);
no_dims=3;
[mappedX, mapping] = compute_mapping(train_X, 'PCA', no_dims);
figure, scatter3(mappedX(:,1), mappedX(:,2), mappedX(:,3), 5, labels); title('Result of PCA');

save(sprintf('PCA%s.mat',filename),'mappedX');

