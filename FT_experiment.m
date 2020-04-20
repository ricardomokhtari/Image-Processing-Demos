%% Comparison of FT of images
% display images
X = imread('leaves.jpeg'); % picture of leaves - high spatial frequency
Y = imread('ceiling.jpg'); % picture of ceiling - low spacial frequency

% display grayscale image
figure(1)
G = rgb2gray(X);
imagesc(G)
colormap(gray(256))

figure(2)
P = rgb2gray(Y);
imagesc(P)
colormap(gray(256))

% compute FFT of leaves image
FT = fft2(double(G));
figure(3)
imagesc(abs(fftshift(double(FT))))
title('FFT of leaves image')

% compute FFT of ceiling image
FT = fft2(double(P));
figure(4)
imagesc(abs(fftshift(double(FT))))
title('FFT of ceiling image')

%% Blurred leaves image
% increased blurring causes reduction of transform coefficients that
% represent high spatial frequency
% Blurring acts as a low pass filter and reduces high frequencies in an
% image

mask = 1/16*[1 2 1; 2 4 2; 1 2 1]; % Gaussian blurring mask

new_img = conv2(G, mask, 'same'); % apply mask

for k=1:1000
    new_img = conv2(new_img, mask, 'same'); % apply mask 1000 times
end

FTB = fft2(double(new_img));
figure(5)
imagesc(abs(fftshift(double(FTB))))


