img2 = imread('stego.png');
a=a-1;
ptr1=1;

%Retreive the message from the Reveived Image and obtain the original image
for i=1:row
    for j=1:col
         if img2(i,j)==a
             arr(ptr1)=0;
             ptr1=ptr1+1;
         elseif img2(i,j)== a+1
              img2(i,j)=a;
             arr(ptr1)=1;
             ptr1=ptr1+1;
          end;
    end;
end;
% for i=1:row
%     for j=1:col
%         if img2(i,j)== a+1
%              img2(i,j)=a;
%         end;
%     end;
% end;

a=a+1;
for i=1:row
    for j=1:col
        if and(img2(i,j)>=a,img2(i,j)<b)
            img2(i,j)=img2(i,j)-1;
        end;
    end;
end;
figure,
% subplot(1,3,1);
% imhist(img)
% title('Histogram of Original Image');
subplot(2,1,1);
imhist(embed)
title('Histogram of Stego Image');
subplot(2,1,2);
imhist(img2)
title('Histogram of Image after Extraction');

% Displaying the pictures
figure,
% subplot(1,3,1);
% imshow(img)
% title('Original Image');
subplot(1,2,1);
imshow(embed)
title('Stego Image');
subplot(1,2,2);
imshow(img2);
title('Image after Extraction');

X = gpuArray(img);
Y = gpuArray(img2);
Z = imabsdiff(X,Y);
figure
imshow(Z,[])
isequal(message,arr)  %Check if hidden image and image after extraction are equal
