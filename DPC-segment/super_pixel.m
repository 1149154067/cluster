clear all  
close all  
clc
%% ��ȡͼƬ
filename='6';
A = imread(sprintf('images/%s.jpg',filename));
[row,col,h]=size(A);
%% ��ͼƬ��ÿ�����ص�������
features=img_val(A);

%% ʹ��superpixels�ֿ�
[L,N] = superpixels(A,300);
idx = label2idx(L);
%% ��ȡÿһ�������
cell_imgs_val=cell(1,N);
for i = 1:N
    cell_imgs_val{i}=features(idx{i},:);
end 
%% ��ÿһ����о��࣬�ǲ��ǿ��Բ����£�ÿ������Ч��
cell_imgs_mat=cell(1,N);
maxs=zeros(1,N);
for i = 1:N
%     redIdx = idx{labelVal};
    cell_imgs_mat{i}=DPC(cell_imgs_val{i},3);
end
%% ��ȡ���ξ������ĺ�ѡ��
 %��������,����в�һ��������Ļ�����ô�洢���ݣ�ʹ��һ������center_select���洢���е������
ind=1;
 for i = 1:N
    icl=cell_imgs_mat{i}{1};
    for k=1:length(icl)
        temp_pos=icl(k);
        center_select(ind,:)=[i,k];%�����ά���ݣ��ڼ���ĵڼ�����Ϊ���ĺ�ѡ��
        %���к�ѡ�������ĵ�����ݼ����ص�����ֵ�����new_img_val������
        new_img_val(ind,:)=cell_imgs_val{i}(temp_pos,:);
        ind=ind+1;
    end    
 end
%% ���ж��ξ���

%���ξ���
new_img_after=DPC( new_img_val,4);

%���Ҷ��ξ����е����ľ�����
max_num=tabulate(new_img_after{2});
max_num=sortrows(max_num,-2);
max_ind=max_num(1,1);
%���ö��ξ����зǵ����ľ�����Ϊ-1
% for k=1:length(new_img_after{1})
%     if(k~=max_ind)
%          new_img_after{1}(k)=-1;
%     end
% end    
%�ҳ�����Ҫ�ľ������ĵ�
new_img_center=[];

new_img_center=find(new_img_after{2}~=max_ind);
%         new_img_center=[new_img_center,find(new_img_after{2}==1)];
%         new_img_center=[new_img_center,find(new_img_after{2}==3)];
%         new_img_center=[new_img_center,find(new_img_after{2}==4)];
%          new_img_center=[new_img_center,find(new_img_after{2}==4)];
%         
%�����з���Ҫ�������ĵ㶼����Ϊ-1
% cell_imgs_mat2=repmat(cell_imgs_mat,1);
% for i=1:length(new_img_center)
%     tmp_ind=new_img_center(i);
%     x=center_select(tmp_ind,1);
%     k=center_select(tmp_ind,2);
%     cell_imgs_mat2{x}{1}(k)=-1;
% end

%����ͼ�����������ĵ�Ϊ-1�������������Ϊ��ɫ

A2=repmat(A,1);
for i=1:length(new_img_center)
    tmp_ind=new_img_center(i);
    x=center_select(tmp_ind,1);
    k=center_select(tmp_ind,2);
    [I,J]=ind2sub([row,col],idx{x}(find(cell_imgs_mat{x}{2}==k)));
    for m=1:length(I)
        A2(I(m),J(m),:)=255;
    end
end


imshow(A2);
