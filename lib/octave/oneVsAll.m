## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
##
## Modifies the function developed in the Coursera class to
## take any given set of labels rather than only
## consecutive labels starting with 1.
## this is done by passing a vector labelSet, which specifies
## the labels for each row.
##
## Author mdf
## Since 2014-06-07

function [all_theta] = oneVsAll(X, y, lambda, labelSet, maxIter = 50)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for labelSet(i)
%   [all_theta] = ONEVSALL(X, y, labelSet, lambda) trains 
%   logisitc regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% Some useful variables
m = size(X, 1);
n = size(X, 2);
num_labels = length(labelSet);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell use 
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
%     % Set Initial theta
%     initial_theta = zeros(n + 1, 1);
%     
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
% 
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost 
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%

initial_theta = zeros(n + 1, 1);
options = optimset('GradObj', 'on', 'MaxIter', maxIter);
theta = zeros(n + 1, 1);

for i = 1:num_labels
    [theta] = fmincg(@(t)(lrCostFunction(t, X, (y == labelSet(i)), lambda)), initial_theta, options);
    all_theta(i:i, 1:n + 1) = theta';
endfor

% =========================================================================
end
