function [X, y] = read_dataset_2(address)

X = csvread(address);
y = X(:, 5);
X = X(:, 1:4);