## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {@var{all_theta}=} bestTheta (@var{maxIter})
## Return and save an optimal Theta matrix. The optional maxIter
## argument defaults to 50.
##
## Example usage:
## alltheta = bestTheta()
## @end deftypefn

## Author mdf
## Since 2014-06-08

function all_theta = bestTheta(maxIter = 50)

PATH_TO_DATA = getenv('DATA_PATH');
suffix = '.mat';
trainDesc = 'trainonly';
trainFile = [PATH_TO_DATA trainDesc suffix];
outFile = "bestTheta.mat";
lambda = bestLambda(maxIter);
labelSet = [0:9]';

load(trainFile);
all_theta = oneVsAll(Xtrain, ytrain, lambdas(i), labelSet, maxIter);

save("-mat-binary", outFile, "all_theta");
end
