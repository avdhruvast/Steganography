clc;
clear all;
close all;



x = imread('elephant1.jpg');         % cover message
y = imread('elephant.jpg');    % message image
%n = input('Enter the no of LSB bits to be subsituted- '); 
n=3;
[M N Y]=size(x)
S=x;
size(y)
for i=1:Y
    for j=1:M
        for k=1:N
            if(abs(x(j,k,i)-y(j,k,i))>29)
                S(j,k,i) = uint8(bitor(bitand(x(j,k,i),bitcmp(2^n-1,'uint8')),bitshift(y(j,k,i),n-8))); %Stego
                E(j,k,i) = uint8(bitand(255,bitshift(S(j,k,i),8-n))); %Extracted
            else
                S(j,k,i)=uint8(y(j,k,i)); %Stego
                E(j,k,i)=uint8(S(j,k,i));
            end
        end
    end
end
origImg = double(y);   %message image
distImg = double(E);   %extracted image

[M N] = size(origImg);


error = origImg - distImg;
MSE = sum(sum(error .* error)) / (M * N);
if(MSE > 0)
    PSNR = 10*log10(255*255/MSE);
else
    PSNR = 99;
end
disp('PSNR of message image to extracted image is')
disp(abs(PSNR))
disp('MSE is')
disp(abs(MSE))


figure(1),
subplot(2,2,1);
imshow(rgb2gray(x));title('1.Cover image')
subplot(2,2,2);imshow(rgb2gray(y));title('2.secret image')
subplot(2,2,3);imshow(rgb2gray(abs(S)),[]);title('3.Stegnographic image')
subplot(2,2,4);imshow(rgb2gray(real(E)),[]); title('4.Extracted image')
%subplot(3,3,5);
%imhist(rgb2gray(y));
%subplot(3,3,6);
%imhist(rgb2gray(real(E)));