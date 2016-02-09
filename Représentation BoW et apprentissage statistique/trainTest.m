function [ values ] = trainTest( train, test, y)
addpath('learning/libsvm/matlab/');

% apprendre sur train et y
model = svmtrain(y, train, '-c 1000 -t linear');
[w,b] = getPrimalSVMParameters(model);

% appliquer les valeurs aprise sur test
values = test * w;
values = values + (ones(size(values)) * b);

end