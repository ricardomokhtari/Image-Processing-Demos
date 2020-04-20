% this script is a simulation of taking the Fourier transform of an image,
% storing all the transform coefficients in an array, extracting the most
% energetic coefficients and iteratively using more and more of them to
% retrieve the original image via inverse transform

% we observe that adding more and more transform coefficients gets us
% closer and closer to the original image
% the most energetic transform coefficients have the greatest effect on the
% recovery of the original image


fid = fopen('head.128','r'); % Opens file for reading

[f, npels]=fread(fid,[128,128],'uchar');

F = f';

fclose(fid); % Close the file handle

% display image
figure(1)
imagesc(F)
colormap(gray(64))
colorbar

% compute fourier transform of image
X = fft2(double(F));
figure(2)
imagesc(abs(fftshift(double(X)))) % shift 0 frequencies

% sort list in descending order
[sorted, idx] = sort(abs(X(:)), 'descend');

% loop through adding more and more coeffs
for k=0:16:size(sorted)
    y_dash = zeros(16384,1);

    y_dash(idx(1:k)) = X(idx(1:k));
    y_dash = reshape(y_dash, 128, 128);

    original = ifft2(double(y_dash));

    figure(3)

    imagesc(abs(double(original)))
    colormap(gray)
end