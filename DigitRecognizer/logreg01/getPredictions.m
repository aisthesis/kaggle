## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {@var{predictions}=} getPredictions (@var{maxIter})
## Return and save predictions for the given test data set.
## Running this function takes a while, as it builds the predictions
## from scratch.
##
## Example usage:
## predictions = getPredictions(128)
## @end deftypefn

## Author mdf
## Since 2014-06-09

function predictions = getPredictions(maxIter = 64)

PATH_TO_DATA = getenv('DATA_PATH');
suffix = '.mat';
testDesc = 'test';
testDataFile = [PATH_TO_DATA testDesc suffix];
outFile = "predictions.mat";

disp("Getting and saving all_theta.\n")
if exist('OCTAVE_VERSION')
    fflush(stdout);
endif

[all_theta, labelSet] = bestTheta(maxIter);

disp("all_theta determined! Loading test data.\n");
if exist('OCTAVE_VERSION')
    fflush(stdout);
endif
load(testDataFile);

disp("Generating predictions.");
if exist('OCTAVE_VERSION')
    fflush(stdout);
endif
predictions = predictOneVsAll(all_theta, X, labelSet);

disp("Predictions generated. Saving results.\n");
if exist('OCTAVE_VERSION')
    fflush(stdout);
endif

save("-mat-binary", outFile, "predictions");
disp("Predictions saved.\n");
if exist('OCTAVE_VERSION')
    fflush(stdout);
endif

end
