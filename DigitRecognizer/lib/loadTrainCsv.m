## Copyright (C) 2014 Marshall Farrier, Cintia de Barros

## -*- texinfo -*-
## @deftypefn {Function File} {@var{v}=} loadTrainCsv()
## Returns a row vector whose first element is the
## matrix consisting of all pixel values and whose
## second element is the column vector of labels (digits
## represented by the image consisting of pixels
## with these values)
## Example usage:
## [X, y] = loadTrainCsv();
## @end deftypefn

## Author mdf
## Since 2014-06-05

function [X, y] = loadTrainCsv()

PATH_TO_DATA = getenv("DATA_PATH");
fileDesc = "train";
fileName = [PATH_TO_DATA fileDesc ".csv"];

allData = csvread(fileName);

% throw out header row when getting X and y
X = allData(2:end, 2:end);
y = allData(2:end, 1);

end
