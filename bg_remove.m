function [ output_array ] = bg_remove( input_array )
% input_array is a cell array containing a sequence of input images, the
% ith image can be visited through input_array{i}
% output_array should also be a cell array containing a sequence of processed images

% get the number of input images
N = length(input_array);

% create output_array, the ith ouput image should be stored by
% output_array{i} = ...
output_array = cell(N, 1);

%% do not modify any code above, write your code below
background = input_array{1};
background = imsubtract(background, background);

f2 = background;

[r,c] = size(background);
% N = 10;
for i = 1:r
    for j = 1:c
        pixs = linspace(0, 0, N);
        for k = 1:N
            pixs(k) = input_array{k}(i, j);
        end
        background(i, j) = mode(pixs);
    end
end

% f = imsubtract(input_array{1}, background);
f = background;

H = 1/2*[0 1/4 0;
    1/4 1 1/4;
    0 1/4 0]; 

f1 = f2;

% ��ֵ�˲�
for i = 2:r-1
    for j = 2:c-1
        temp = double(f(i-1:i+1, j-1:j+1));
        f1(i, j) = sum( sum(H.*temp));
        temp = sort(temp(:));
        f2(i, j) = temp(5);
    end
end


figure
    subplot(221),imshow(f1),title('ԭͼ��');
    subplot(222),imhist(f1),title('ֱ��ͼ');
    subplot(223),imshow(f2),title('ԭͼ��');
    subplot(224),imhist(f2),title('ֱ��ͼ');



% figure,imshow(input_array{1});

end
