clc
close all
clear all
img = imread('C:\Users\mark.schrader\Desktop\2015-45DAP-Calibrated.tif');
imshow(img);

cropped = drawrectangle();
cropdata = cropped.Position;
cropimg = imcrop(img, cropdata);
imshow(cropimg);impixelinfo();

gridLength = 20;
gridWidth = 12;
[x y z] = size(cropimg);

plotLength = x/gridLength;
plotWidth = y/gridWidth;
plotx = 0;
ploty = 0;

averageIntensities = zeros(gridLength, gridWidth);

for i = 1:gridLength
    plotx =0;
    for j = 1:gridWidth
        roi = drawrectangle('Position', [plotx, ploty, plotWidth, plotLength]);
        roiNow = roi.Position;
        cropRoi = imcrop(img, roiNow);
        averageIntensities(i,j) = mean(cropRoi(:));
        plotx = (plotWidth*j);
    end
    ploty = (plotLength*i);
end

