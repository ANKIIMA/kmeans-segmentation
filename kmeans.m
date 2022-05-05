clear all;clc

A = imread('3.png');
subplot(2,2,1);
imshow(A);
title('ԭͼ');

[A_new2,label2] = kmean_func(A,2);
subplot(2,2,2);
imshow(A_new2);
title('K=2');
tabulate(label2(:))

[A_new3,label3] = kmean_func(A,5);
subplot(2,2,3);
imshow(A_new3);
title('K=5');
tabulate(label3(:))

[A_new4,label4] = kmean_func(A,12);
subplot(2,2,4);
imshow(A_new4);
title('K=12');
tabulate(label4(:))
