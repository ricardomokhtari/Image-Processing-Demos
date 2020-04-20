F = imread('me.jpg'); % Opens file for reading
F = rgb2gray(F);

figure(1)
imagesc(F)
colormap(gray(256))

bw = (F<140);

figure(2)
imagesc(bw)
colormap(gray(256))

se = strel('disk',25);

opened = imopen(bw,se);

opened_closed = imclose(opened,se);

figure(4)
imagesc(opened_closed)
colormap(gray(256))


