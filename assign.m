% Name- Kushagra Agrawal%
% ID- 2017A7PS0107P %
clear all;
close all;
a = imread('assign1.bmp');
for i = 1 : 256
    for j = 1 :256
            b(i, j) = a(i,j) .* ((-1) ^ (i + j));
    end
end
c = fft2(b);
for i = 1 : 256
    for j = 1: 256
        if(i > 103 && i < 154 && j > 103 && j < 154)
            filter(i, j) = 1;
        else
            filter(i, j) = 0;
        end
    end
end
for i = 1 : 256
    for j = 1 :256
            new_image_fourier(i, j) = c(i,j) .* filter(i,j);
    end
end
new_image_spatial = ifft2(new_image_fourier);
for i = 1 : 256
    for j = 1 :256
            famp1(i, j) = new_image_spatial(i,j) .* ((-1) ^ (i+j));
    end
end
famp = abs(famp1);
subplot(1, 2, 1); imshow(a);
subplot(1, 2, 2); imshow(famp, []);