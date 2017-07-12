function [ img_val ] = img_val( img_rgb )
%IMG_VAL �����˹��������������������LAB�ռ��£���6��������
%   �˴���ʾ��ϸ˵��


%ת����LAB�ռ�
% stdf = makecform('srgb2lab');
% img_lab = applycform(img_rgb,stdf);
% img = uint8(img_lab);
% img= img_rgb;%ֱ��ʹ��RGBЧ������
% img=RGB2Lab(img_rgb);
% [row_img,col_img,n]=size(img);
I = im2double(img_rgb);
[x,y] = meshgrid(1:size(I,2),1:size(I,1));            % Spatial Features
L = [y(:)/max(y(:)),x(:)/max(x(:))];
%Pyramidgu ��˹����������������
img_val_0=lab_vec(img_rgb,0,0);
img_val_5=lab_vec(img_rgb,5,2);
img_val_7=lab_vec(img_rgb,7,2);%����2��Ч����0.625Ч���ã�����Ϊʲô��������
%�ǲ���Ӧ�ü���λ����Ϣ���ȽϽ��ľ���Ȩ�ظ��ߣ���������
img_val=[img_val_0 ,img_val_5,img_val_7];

end
function [ img_val ] = hsv_vec( img_rgb,hsize, sigma )
% ��˹������������������ʹ��HSV��Ϊ����������Ч���ȽϺã������ʺϴ�����Ӱ
%��ߵ�ֵ����ȡ���٣�ģ���С3,5,7;��׼��Ϊ:2,0.5,0.625?����ʲô��һ����
%�����ʹ��ϵͳvision.Pyramid�����أ���Ӧ�Ĳ������Ƕ��٣�
%ת����hsv�ռ�
img = rgb2hsv(img_rgb);
if(hsize>0)
    ker5=fspecial('gaussian',hsize,sigma);%��СΪ5�ĸ�˹��
    % ker7=fspecial('gaussian',7,2);
    img5 = imfilter(img,ker5);
else
    img5 = img;
end
%HSV
L_img5=img5(:,:,1);
A_img5=img5(:,:,2);
B_img5=img5(:,:,3);
%ƴ��ͼ�������������������������ɷ���Ҫ������ݾ���
%�����ÿһ�а���6��ֵ
L_img5_ind=L_img5(:);
A_img5_ind=A_img5(:);%��ά������һά����
B_img5_ind=B_img5(:);

%L_img5_ind,
img_val=[L_img5_ind,A_img5_ind ,B_img5_ind];
end

function [ img_val ] = lab_vec( img_rgb,hsize, sigma )
% ��˹�������������������õ�lab�ռ��µ��������ʺϴ����б�����
%��ߵ�ֵ����ȡ���٣�ģ���С3,5,7;��׼��Ϊ:2,0.5,0.625?����ʲô��һ����
%�����ʹ��ϵͳvision.Pyramid�����أ���Ӧ�Ĳ������Ƕ��٣�

img=rgb2lab(img_rgb);
if(hsize>0)
    ker5=fspecial('gaussian',hsize,sigma);%��СΪ5�ĸ�˹��
    % ker7=fspecial('gaussian',7,2);
    img5 = imfilter(img,ker5);
else
    img5 = img;
end
%�����LABֻȡAB���д���
L_img5=img5(:,:,1);
A_img5=img5(:,:,2);
B_img5=img5(:,:,3);
%ƴ��ͼ�������������������������ɷ���Ҫ������ݾ���
%�����ÿһ�а���6��ֵ
L_img5_ind=L_img5(:);
A_img5_ind=A_img5(:);%��ά������һά����
B_img5_ind=B_img5(:);

%L_img5_ind,
img_val=[L_img5_ind,A_img5_ind ,B_img5_ind];
end



