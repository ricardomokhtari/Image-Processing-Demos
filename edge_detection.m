%% Gradient-Based Edge Detection

fid = fopen('head.128','r'); % Opens file for reading
[x, ~]=fread(fid,[128,128],'uchar');
X = x';
fclose(fid); % Close the file handle

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

% create edge direction field
[x,y] = meshgrid(1:size(X,2),1:size(X,1));

figure(3)
imagesc(g); hold on
quiver(x,y,res,res2,5);

%% Edge detection + Gaussian blurring

% 2D Gaussian
sigma = 1.5;
J = fspecial('gauss',[65,65],sigma);

fid = fopen('head.128','r'); % Opens file for reading
[x, ~]=fread(fid,[128,128],'uchar'); 
X = x';
fclose(fid); % Close the file handle

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
surfl(g)


