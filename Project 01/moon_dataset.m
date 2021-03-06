function [X, y] = moon_dataset(r, w, d, num)

r_rand = r - w/2 + w*rand(num, 1);
theta_rand = pi*rand(num, 1);
X = [r_rand.*cos(theta_rand), r_rand.*sin(theta_rand)];

y = -1*ones(num, 1);

r_rand = r - w/2 + w*rand(num, 1);
theta_rand = -pi*rand(num, 1);
X = [X; ...
    r + r_rand.*cos(theta_rand), -d + r_rand.*sin(theta_rand)];
X = [ones(num * 2, 1), X];
y = [y; ...
    ones(num, 1)];