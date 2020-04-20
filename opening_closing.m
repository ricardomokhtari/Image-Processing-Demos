% method for clearing up unwanted structures in a thresholded binary image
% can be thought of as segmentation

% convert image to grayscale, threshold and apply opening followed by
% closing

F = imread('leaf.png'); % Opens file for reading
F = rgb2gray(F); % convert to grayscale

figure(1)
imagesc(F)
colormap(gray(256))

bw = (F>150);

figure(2)
imagesc(bw)
colormap(gray(256))

se = strel('disk',5);

opened = imopen(bw,se);

opened_closed = imclose(opened,se);

figure(3)
imagesc(opened_closed)
colormap(gray(256))


