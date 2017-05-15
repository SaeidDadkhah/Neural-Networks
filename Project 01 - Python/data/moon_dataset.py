import matplotlib.pyplot as plt
from matplotlib.figure import Figure
import numpy as np
from math import pi

defaults = {'r': 10,
            'w': 6,
            'd': 1,
            'number': 1000}


# noinspection PyShadowingNames
def generate(r=defaults['r'], w=defaults['w'], d=defaults['d'], number=defaults['number']):
    theta = pi * np.matrix(np.random.random((number, 1)))
    a = r + w * (np.matrix(np.random.random((number, 1))) - 0.5)
    x = np.concatenate((np.multiply(a, np.cos(theta)), np.multiply(a, np.sin(theta))), axis=1)

    theta = pi + pi * np.matrix(np.random.random((number, 1)))
    a = r + w * (np.matrix(np.random.random((number, 1))) - 0.5)
    tmp = np.concatenate((r + np.multiply(a, np.cos(theta)), -d + np.multiply(a, np.sin(theta))), axis=1)
    x = np.concatenate((x, tmp), axis=0)
    x = np.concatenate((np.ones((2 * number, 1)), x), axis=1)

    y = np.concatenate((-1 * np.ones((number, 1)), np.ones((number, 1))), axis=0)
    return x, y


# noinspection PyShadowingNames
def visualize(x, y):
    figure = plt.figure()
    a = figure.add_subplot(111)
    a.plot(x[(y == -1).squeeze(), 1], x[(y == -1).squeeze(), 2], 'r.')
    a.plot(x[(y != -1).squeeze(), 1], x[(y != -1).squeeze(), 2], 'b.')
    return figure


# noinspection PyShadowingNames
def boundary(figure, x, w):
    y = -(w[1] * x + w[0]) / w[2]
    figure.plot(x, y)


if __name__ == "__main__":
    x, y = generate()
    figure = visualize(x, y)
    plt.show(figure)
