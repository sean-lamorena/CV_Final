% NAME:         Rodriguez, Jesse & Lamorena, Sean
% DATE:         DECEMBER 4, 2017
% CLASS:        CEC 495A
% ASSIGNMENT:   Final Project

clear;
clc;
close all;
tic;

% CAMERA 1
rgb{1} = imread('detailB.jpg');
rgb{2} = imread('detailS.jpg');


% CAMERA 2
rgb{3} = imread('blank.jpg');
rgb{4} = imread('dots.jpg');

% CAMERA 3
rgb{5} = imread('blank.jpg');
rgb{6} = imread('dotsline.jpg');

% CAMERA 4
rgb{7} = imread('clear.jpg');
rgb{8} = imread('stain.jpg');

% CAMERA 5
rgb{9} = imread('clear.jpg');
rgb{10} = imread('half.jpg');

% CAMERA 6
rgb{11} = imread('clear.jpg');
rgb{12} = imread('cover.jpg');

% CAMERA 7
rgb{13} = imread('img18.jpg');
rgb{14} = imread('img01.jpg');

% CAMERA 8
rgb{15} = imread('img18.jpg');
rgb{16} = imread('img25.jpg');


% CAMERA 9
rgb{17} = imread('hall.jpg');
rgb{18} = imread('jesse2.jpg');

% CAMERA 10
rgb{19} = imread('hallway.jpg');
rgb{20} = imread('peter.jpg');

for k =1:20
    hsv{k} = rgb2hsv(rgb{k});
end

for k = 1:20
    if mod(k,2)
imDiff = abs(rgb{k} - rgb{k+1});
imSum = rgb{k} + rgb{k+1};
A = mean(imDiff(:));
B = mean(imSum(:))/2;
percentDiff(k) = 100 * A/B;
figure(k)
subplot(2,2,1), imshow(rgb{k})
subplot(2,2,2), imshow(rgb{k+1})
subplot(2,2,3), imshowpair(hsv{k},hsv{k+1},'diff')
    else
     
    end
end


Scenario = [1;2;3;4;5;6;7;8;9;10];
Difference = [percentDiff(1); percentDiff(3); percentDiff(5);...
    percentDiff(7); percentDiff(9); percentDiff(11); percentDiff(13);...
    percentDiff(15); percentDiff(17); percentDiff(19)];
Comments = string({'Figure 1';'Figure 3';'Figure 5';'Figure 7';'Figure 9';...
    'Figure 11';'Figure 13';'Figure 15';'Figure 17';'Figure 19';});
T = table(Scenario, Difference, Comments)

toc;