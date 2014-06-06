## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {} csvToMatBin ()
## Creates 2 files, train.mat and test.mat,
## which contain the kaggle data converted to matlab
## binary format for faster loading.
##
## Converts "train.csv" source data to matlab
## binary format, then saves the features as X and
## the labels as y in the file train.mat
##
## Converts "test.csv" to matlab binary format, then
## saves the features as X in the file test.mat
## @end deftypefn

## Author mdf
## Since 2014-06-05

function csvToMatBin()

PATH_TO_DATA = getenv("DATA_PATH");
suffix = ".mat";
trainDesc = "train";
testDesc = "test";

trainFile = [PATH_TO_DATA trainDesc suffix];
testFile = [PATH_TO_DATA testDesc suffix];

[X, y] = loadTrainCsv();

save("-mat-binary", trainFile, "X", "y");

X = loadTestCsv();
save("-mat-binary", testFile, "X");

end
