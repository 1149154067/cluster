function [ B ] = normalization( A )
%NORMALIZATION �����еĹ�һ��
%   �˴���ʾ��ϸ˵��
    X=A';
    [Y,~]=mapminmax(X,0,1);%�й�һ��
    B=Y';
end

