## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {} saveCvSelection ()
## Save a selection of rows to use for cross-validation.
##
## Loads labels from train.mat, then randomly selects
## rows with an even distribution for each digit.
## Finally, saves this selection in the file cvselect.mat,
## which can then be used for reproducible separation of 
## data into training and cross-validation sets.
##
## Example usage:
## saveCvSelection();
## This randomly generates a row selection (subject to the stipulation
## that the distribution is uniform for each digit) and saves
## the row selection in the file cvselect.mat
## @end deftypefn

## Author mdf
## Since 2014-06-05

function saveCvSelection()

PATH_TO_DATA = getenv("DATA_PATH");
suffix = ".mat";
trainAllDesc = "train";
saveDesc = "cvselect";

inFile = [PATH_TO_DATA trainAllDesc suffix];
outFile = [PATH_TO_DATA saveDesc suffix];

load(inFile);
[train, cv] = cvSelect(y);
train = sort(train);
cv = sort(cv);
save("-mat-binary", outFile, "train", "cv");

end
