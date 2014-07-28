## -*- texinfo -*-
## @deftypefn  {Function File} {} makeSubmission ()
## Generate a submission file 'submission.csv' from
## 'predictions.mat'
##
## Example usage:
## makeSubmission();
## @end deftypefn

## Author mdf
## Since 2014-06-09

function makeSubmission()

predFile = 'predictions.mat';
submissionFile = 'submission.csv';

load(predFile);

header = "ImageId,Label\n";
numPredictions = length(pred);
csvData = [[1:numPredictions]' pred];

outid = fopen(submissionFile, 'w+');
fprintf(outid, "%s", header);
fclose(outid);
csvwrite(submissionFile, csvData, '-append');

end