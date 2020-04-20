fid = fopen('head.128','r'); % Opens file for reading

[f, npels]=fread(fid,[128,128],'uchar');

F = f';

fclose(fid); % Close the file handle
figure(1)
imagesc(F)
colormap(gray(64))
colorbar

X = fft2(double(F));
figure(2)
imagesc(abs(fftshift(double(X))))

x_dash = ifft2(double(X));
figure(3)
imagesc(abs(double(x_dash)))
colormap(gray(64))
colorbar

diff = abs(X - x_dash);
figure(4)
image(abs(double(diff)))

SSE = abs(double(sum(diff.^2, 'all')));

[sorted, idx] = sort(abs(X(:)), 'descend');

for k=0:16:size(sorted)
    y_dash = zeros(16384,1);

    y_dash(idx(1:k)) = X(idx(1:k));
    y_dash = reshape(y_dash, 128, 128);

    thing = ifft2(double(y_dash));

    figure(5)

    imagesc(abs(double(thing)))
    colormap(gray)
end