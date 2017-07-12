%��ȡͼ��,����tsne��ά
%��ͼ���ÿ�����ص������,��ά����ά
%�ڶ�ά�������ϲ鿴��ͼ�����ص�ķֲ�
%ͼ��̫���˾Ͳ���.90*100�ľ�Ҫ2������ͷ
%�����ַ�����LargeVisʱ��Ϳռ�Ч�ʸ��ߣ�����Ч�����󡣽���ʹ��
%�ô����û��ʲô����


clear all  
close all  
%% ����ͼƬ
filename='5-1-1';
img=imread(sprintf('%s.jpg',filename));
[row,col,h]=size(img);

imgs_val=img_val(uint8(img));

train_X =normalization(imgs_val);
labels=ones(col*row,1);
% Set parameters
no_dims = 3;
init_dims = 9;
perplexity = 30;
% Run t-SNE
mappedX = tsne(train_X, [], no_dims, init_dims, perplexity);
figure, scatter3(mappedX(:,1), mappedX(:,2), mappedX(:,3), 5, labels); title('Result of tsne');
save(sprintf('tsne%s.mat',filename),'mappedX');
