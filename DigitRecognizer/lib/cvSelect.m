## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {@var{v}=} cvSelect ({@var{y})
## Randomly determine which rows to use for cross-validation
## and which rows to use for training. Return the selection
## as 2 values: the first (train) selects the rows to use
## for the training set, the second (cv) selects rows to use
## for cross-validation.
##
## The input parameter y is a vector composed of the labels
## for a dataset
##
## The rows to select are only partially random: The function guarantees
## that a uniform proportion of 25pct is saved for each digit
## (this corresponds to a 60-20-20 proportion for training-cv-test, but
## our test set is given).
##
## Example usage:
## [train, cv] = cvSelect(y);
## @end deftypefn

## Author mdf
## Since 2014-06-05

function [train, cv] = cvSelect(y)

pct = 0.25;

train = [];
cv = [];
tmp = [];
tmpsize = 0;
cvsize = 0;

for i = 0:9
    tmp = find(y == i);
    tmpsize = length(tmp);
    cvsize = round(pct * tmpsize);
    tmp = tmp(randperm(tmpsize));
    cv = [cv; tmp(1:cvsize)];
    train = [train; tmp((cvsize + 1):end)];
end

end
