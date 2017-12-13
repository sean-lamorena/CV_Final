clear all; close all; clc;

I1 = imread('blank.jpg');
I2 = imread('dots.jpg');

Ipts1 = OpenSurf(I1);
Ipts2 = OpenSurf(I2);

% for k = 1:length(Ipts1)
%     D1(:,k) = Ipts1(k)%.descriptor;
% end
% 
% for k = 1:length(Ipts2)
%     D2(:,k) = Ipts2(k)%.descriptor;
% end
% 
% BaseLength = length(Ipts1);
% SubLength = length(Ipts2);
% 
% for i = 1:BaseLength
% %     subtract = ( repmat(D1(:,i),...
% %         [1 SubLength])- D2).^2;
% %     distance = sum(subtract);
%     [SubValue(i) SubIndex(i)] = min(distance);
% end
% 
% [value, index] = sort(SubValue);
% 
% index = index(1:100);
Jregistered = imwarp(I2,tform, ...
    'OutputView',imref2d(size(I1)));
falsecolorOverlay = imfuse(I1, Jregistered);
blendcolorOverlay = imfuse(I1, Jregistered,'blend');