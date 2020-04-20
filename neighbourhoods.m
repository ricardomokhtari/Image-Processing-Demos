% many neighbourhood operators


%% Read in image

F = imread('monarch.png'); % Opens file for reading
F = rgb2gray(F);

%% Gaussian scale space
figure(1)
imagesc(F)
colormap(gray(256))

mask = 1/16*[1 2 1; 2 4 2; 1 2 1];

new_img = conv2(F, mask, 'same');

for k=1:49
    new_img = conv2(new_img, mask, 'same');
    figure(2)
    imagesc(new_img);
    colormap(gray(256))
end

%% Edege enhancement
figure(1)
imagesc(F)
colormap(gray(256))

mask = [-2 1 -2; 1 5 1; -2 1 -2];

figure(2)
imagesc(conv2(F,mask))
colormap(gray(256))

%% Edge Detection (horizontal)

figure(1)
imagesc(F)
colormap(gray(256))

mask = [-1 0 1; -1 0 1; -1 0 1];

figure(2)
imagesc(conv2(F,mask))
colormap(gray(256))

%% Edge Detection (horizontal)

figure(1)
imagesc(F)
colormap(gray(256))

mask = [-1 0 1; -1 0 1; -1 0 1];

figure(2)
imagesc(conv2(F,mask))
colormap(gray(256))

%% Edge Detection (vertical)

figure(1)
imagesc(F)
colormap(gray(256))

mask = [-1 -1 -1; 0 0 0; 1 1 1];

figure(2)
imagesc(conv2(F,mask))
colormap(gray(256))