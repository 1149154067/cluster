function [ B ] = normalization( A )
%NORMALIZATION �����еĹ�һ��
%   �˴���ʾ��ϸ˵��
    X=A';
    [Y,~]=mapminmax(X);%�й�һ��
    B=Y';
end

