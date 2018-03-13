x=imread('elephant.jpg');
xxx=x;
imshow(x);
text=input('Enter the text to be hidden','s');
xx=double(x);
y=xx(:,:,3);
siz=length(text);
for r=1:siz
    asc=dec2bin(double(text(r)),8)
    for c=1:8
        z=dec2bin(y(r,c));
        z(8)=asc(c);
        y(r,c)=bin2dec(z);
    end
end
xxx(:,:,3)=y;
for r=1:siz
    ext(r)=0;
    for c=1:8
        q=dec2bin(y(r,c));
        e=str2num(q(8));
        f=2^(8-c);
        g=e*f;
        ext(r)=ext(r)+g;
    end
end
s=char(ext)
figure(1),
subplot(1,2,1);
imshow(rgb2gray(x));title('1.Cover image')
subplot(1,2,2);imshow(rgb2gray(xxx));title('2.Stegnographic image')
