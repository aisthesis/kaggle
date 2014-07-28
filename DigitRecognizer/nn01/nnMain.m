## Copyright (C) 2014 Marshall Farrier, Cintia de Barros
## 
## -*- texinfo -*-
## @deftypefn  {Function File} {} nnMain()
## Return and save predictions for the given test data set.
##
## Example usage:
## nnMain()
## @end deftypefn

## Author cpb
## Since 2014-07-15

% Initialization
clear ; close all; clc

% Setup the parameters
input_layer_size  = 28*28;  % image size (based on information from Kaggle)
hidden_layer_size = 5;     % number of hidden units
num_labels = 10;            % 10 labels, from 1 to 10 (0 mapped to 10)
num_iterations = 10;        % number of iterations to calculate cost
lambda = 0.0; 				% set lambda

PATH_TO_DATA = getenv('DATA_PATH');
suffix = '.mat';
testDesc = 'train';
testDataFile = [PATH_TO_DATA testDesc suffix];

% Load Training Data
load(testDataFile);
m = size(X, 1);

% Correction since code assumes "0" maps to 10
for i=1:length(y)
    if y(i)== 0
        y(i) = 10;
    end
end

disp("Training network...\n")
if exist('OCTAVE_VERSION')
    fflush(stdout);
endif

% Initialize Theta1 and Theta2 with random values
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

% Calculate cost (num_iterations)
options = optimset('MaxIter', num_iterations);

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));


% Use trained thetas to predict digits in test set
PATH_TO_DATA = getenv('DATA_PATH');
suffix = '.mat';
testDesc = 'test';
testDataFile = [PATH_TO_DATA testDesc suffix];
outFile = "predictions.mat";

load('test.mat')
Xtestdouble = double(Xtest);
pred = predict(Theta1, Theta2, Xtestdouble);

% mapping 10 back to "0"
pred(find(pred==10)) = 0;

save("-mat-binary", outFile, "predictions");