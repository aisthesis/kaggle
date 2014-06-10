## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {@var{best}=} bestLambda (@var{maxIter})
## Return an optimal regularization parameter. The optional maxIter
## argument defaults to 50.
##
## Example usage:
## lambda = bestLambda()
## @end deftypefn

## Author mdf
## Since 2014-06-08

function best = bestLambda(maxIter = 64)

lambdas = [0, 0.0001, 0.0003, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 3, 10];
bestIndex = 1;
acc = 0;
bestAcc = 0;
len = length(lambdas);

PATH_TO_DATA = getenv('DATA_PATH');
suffix = '.mat';
trainDesc = 'trainonly';
cvDesc = 'cvonly';
trainFile = [PATH_TO_DATA trainDesc suffix];
cvFile = [PATH_TO_DATA cvDesc suffix];
load(trainFile);
load(cvFile);
features = size(Xtrain, 2);
labelSet = [0:9]';
all_theta = zeros(length(labelSet), features + 1);
predicted = zeros(size(ycv));

for i = 1:len
    printf("Testing lambda value %f\n", lambdas(i));
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    endif
    all_theta = oneVsAll(Xtrain, ytrain, lambdas(i), labelSet, maxIter); 
    predicted = predictOneVsAll(all_theta, Xcv, labelSet);
    acc = accuracy(predicted, ycv);
    if acc > bestAcc
        bestIndex = i;
        bestAcc = acc;
    endif
    printf("Accuracy: %f\n\n", acc);
    if exist('OCTAVE_VERSION')
        fflush(stdout);
    endif
endfor

best = lambdas(bestIndex);
end
