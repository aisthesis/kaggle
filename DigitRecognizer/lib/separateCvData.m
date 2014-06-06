## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {} separateCVData ()
## Separates the data in train.mat into 2 parts:
## trainonly.mat and cvonly.mat
##
## The data in these 2 files needs to be selected
## randomly but also needs to be shared, which is
## a problem because the file sizes will exceed the 100MB
## limit allowed by GitHub. So, the rows used will
## be determined by the contents of cvselect.mat,
## which is randomly generated and small enough that 
## it can be pushed to GitHub.
## 
## Example usage:
## separateCvData()
## @end deftypefn

## Author mdf
## Since 2014-06-05

function separateCvData()

PATH_TO_DATA = getenv("DATA_PATH");
suffix = ".mat";
trainAllDesc = "train";
cvSelectDesc = "cvselect";
trainOnlyDesc = "trainonly";
cvOnlyDesc = "cvonly";

trainAllFile = [PATH_TO_DATA trainAllDesc suffix];
cvSelectFile = [PATH_TO_DATA cvSelectDesc suffix];
trainOnlyFile = [PATH_TO_DATA trainOnlyDesc suffix];
cvOnlyFile = [PATH_TO_DATA cvOnlyDesc suffix];

load(trainAllFile);
load(cvSelectFile);

Xtrain = X(train, :);
ytrain = y(train, :);
Xcv = X(cv, :);
ycv = y(cv, :);

save("-mat-binary", trainOnlyFile, "Xtrain", "ytrain");
save("-mat-binary", cvOnlyFile, "Xcv", "ycv");

end
