%% Load image

X = imread('leaf.png');
X = rgb2gray(X);

%% Gradient-Based Edge Detection

figure(1) % display original image
imagesc(X);
colormap(gray(128))

% gradient estimator masks - vertical and horizontal detection
mask = [1 0 -1; 1 0 -1; 1 0 -1] ./ 6;
mask2 = mask';

% apply convolutions
res = conv2(X,mask,'same');
res2 = conv2(X,mask2,'same');

% produce magnitude image
g = sqrt(res.^2 + res2.^2);

% display edge map
figure(2)
imagesc(g)
colormap(gray(128))
colorbar

% create edge direction field
[x,y] = meshgrid(1:size(X,2),1:size(X,1));

figure(3)
imagesc(g); hold on
quiver(x,y,res,res2,5);

figure(4)
imagesc(g > 30)
colormap(gray(128))

% The thresholded image has many spurious edges, these can be removed with
% Gaussian blurring (see next)

%% Edge detection + Gaussian blurring (to fine tune edge size)

% 2D Gaussian
sigma = 3;
J = fspecial('gauss',[65,65],sigma);

% display original image
figure(1)
imagesc(X)
colormap(gray(128))

% gradient estimator masks
mask = [1 0 -1; 1 0 -1; 1 0 -1] ./ 6;
mask2 = mask';

% apply convolutions
blurred = conv2(X,J,'same');
convolved1 = conv2(blurred,mask,'same');
convolved2 = conv2(blurred,mask2, 'same');

% create magnitude image
g = sqrt(convolved1.^2 + convolved2.^2);

%show overall convolution mask
figure(2)
surfl(conv2(J,mask))

% show edge map
figure(3)
imagesc(g)
colormap(gray(128))

% show surface plot of the edge map
figure(4)
surfl(abs(g))

figure(5)
imagesc(g > 10)
colormap(gray(128))

%% LoG implementation

% create Gaussian
sigma = 3;
J = fspecial('gauss',[128,128],sigma);

% create Laplacian
Laplacian = [2 -1 2; -1 -4 -1; 2 -1 2] ./ 16;

% create Laplacian of Gaussian
LoG = conv2(J, Laplacian,'same');

% convolve LoG with image
res = conv2(X, LoG, 'same');

% display LoG
figure(1)
surfl(-LoG)

% display final edge map
figure(2)
imagesc(abs(res));
colormap(gray(128))
colorbar

% the zero crossing points need to be found after this step
% Edge linking is performed after that


