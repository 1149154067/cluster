function [ img_after ] = handler_sub_img( img_rgb,cell_mat )
%���ݾ�������ԭСͼ���д���ԭ��Ӧ������CFSFDP_IMG�д���Ĺ���
% ÿ�����������в��ҷ�0�ĵ�һ��Ԫ�أ�����Ҫ���ҵ�������
% ���û�о�������,���ǵ�һ������
%     img_rgb=uint8(cell_imgs{5,5});
%     cell_mat=cell_imgs_mat{5,5};
%% �������¾���Ľ�����м���
    center_mat=[];
    for i=1:length(cell_mat{1})
    %�ҵ�����Ϊ-1��
        if(cell_mat{1}(i)==-1)
            center_mat=[center_mat,find(cell_mat{2}==i)];        
        end
    end

    %% ֱ��ʹ�õ�һ����
%     center_mat=find(cell_mat{2}~=3);
    
    
    img_after=repmat(img_rgb,1);
    [row_img,col_img,~]=size(img_rgb);
    ss=[row_img,col_img];
    if(length(center_mat)>0)
        [X,Y]=ind2sub(ss,center_mat);
        for i=1:length(X)
            img_after(X(i),Y(i),:)=255;
    %         img_after(X(i),Y(i),2)=255;
    %         img_after(X(i),Y(i),3)=255; 
        end
    end
%     imshow(img_after);

end

