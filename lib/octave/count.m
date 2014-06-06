## Copyright (C) 2014 Marshall Farrier, Cintia de Barros

## -*- texinfo -*-
## @deftypefn {Function File} {@var{howmany}=} count ({@var{X}, @var{valueToFind})
## Counts the number of occurrences of parameter valueToFind in an input
## matrix
## Example usage:
## n = count(eye(3), 0);
## This would set n to 6 because eye(3) contains 6 0's
## @end deftypefn

## Author mdf
## Since 2014-06-15

function howmany = count(X, valueToFind)
howmany = sum(nthargout(3, @find, X == valueToFind));
end
