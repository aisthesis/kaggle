## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {@var{acc}=} accuracy ({@var{predicted}, @var{actual})
## Return the accuracy of predictions relative to actual values.
## The input vectors must both have the same size.
## The value returned is the number of correctly predicted labels
## divided by the total number of labels in the data set.
##
## Example usage:
## acc = accuracy(predicted, actual);
## @end deftypefn

## Author mdf
## Since 2014-06-08

function acc = accuracy(predicted, actual)

len = length(actual);
correct = sum(predicted == actual);
acc = correct / len;

end
