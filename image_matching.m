clc;
clear all;
close all;
x = imread('elephant1.jpg');
xx = rgb2gray(x);
%y = [1 1;0 0];
%y = offsetstrel('ball',5,5);
%z = imdilate(xx,y);
z = edge(xx);
subplot(1,2,1);
imshow(xx);
subplot(1,2,2);
imshow(z);