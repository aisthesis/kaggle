## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {@var{v}=} bestTheta (@var{maxIter})
## Return and save an optimal Theta matrix. The optional maxIter
## argument defaults to 64.
## Also returns the labelSet for convenience.
##
## Example usage:
## [alltheta, labelSet] = bestTheta(128)
## @end deftypefn

## Author mdf
## Since 2014-06-08

function [all_theta, labelSet] = bestTheta(maxIter = 64)

PATH_TO_DATA = getenv('DATA_PATH');
suffix = '.mat';
trainDesc = 'trainonly';
trainFile = [PATH_TO_DATA trainDesc suffix];
outFile = "bestTheta.mat";
lambda = bestLambda(maxIter);
labelSet = [0:9]';

load(trainFile);
printf("Optimal lambda: %f\n", lambda);
if exist('OCTAVE_VERSION')
    fflush(stdout);
endif

all_theta = oneVsAll(Xtrain, ytrain, lambda, labelSet, maxIter);

save("-mat-binary", outFile, "all_theta", "labelSet", "maxIter", "lambda");
end
