## Copyright (C) 2014 Marshall Farrier, Cintia de Barros

## -*- texinfo -*-
## @deftypefn {Function File} {@var{X}=} loadTestCsv()
## Returns the features of the test data from kaggle
## as a matrix whose rows are the features.
## Example usage:
## X = loadTestCsv();
## @end deftypefn

## Author mdf
## Since 2014-06-05

function X = loadTestCsv()

PATH_TO_DATA = getenv("DATA_PATH");
fileDesc = "test";
fileName = [PATH_TO_DATA fileDesc ".csv"];

allData = csvread(fileName);

% throw out header row
X = allData(2:end, :);

end
