close all;
clear;

%load olympics.mat;

%data = female400;

%X = data(:, 1) / 100;
%X(:, 2) = X(:, 1);

load data/x05.mat;
data = x05;

data(:, 2) = data(:, 2) / 100;

X = [ones(1, size(data, 1))' data(:, 3:4)];

y = data(:, 2);

%X = [1, 1; 1, 2; 1, 3; 1, 4; 1, 5];
%y = [1; 2; 3; 4; 5];

w = (X' * X) \ (X' * y);



%m = (mean(x .* y) - (mean(x) * mean(y))) / (mean(x .^ 2) - (mean(x) ^ 2));
%c = mean(y) - (m * mean(x));

marg = 0.8;

x_start = min(X(:, 2)) - marg;
x_end = max(X(:, 2)) + marg;


cost = (1 / size(X, 1)) * sum((y - (X * w)) .^ 2);

display(cost);

% figure;
% hold on;
% 
% tmp(:, 2) = (x_start:x_end)';
% tmp(:, 1) = 1;
% 
% scatter(X(:, 2), y, 'O', 'filled');
% plot(x_start:x_end, (tmp * w));