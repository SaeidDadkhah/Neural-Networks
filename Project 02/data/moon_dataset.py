import matplotlib.pyplot as plt
import numpy as np
from math import pi


# noinspection PyShadowingNames
def generate(r=10, w=6, d=1, number=1000):
    theta = pi * np.matrix(np.random.random((number, 1)))
    a = r + w * (np.matrix(np.random.random((number, 1))) - 0.5)
    x = np.concatenate((np.multiply(a, np.cos(theta)), np.multiply(a, np.sin(theta))), axis=1)

    theta = pi + pi * np.matrix(np.random.random((number, 1)))
    a = r + w * (np.matrix(np.random.random((number, 1))) - 0.5)
    tmp = np.concatenate((r + np.multiply(a, np.cos(theta)), -d + np.multiply(a, np.sin(theta))), axis=1)
    x = np.concatenate((x, tmp), axis=0)
    # x = np.concatenate((np.ones((2 * number, 1)), x), axis=1)

    y = np.concatenate((-1 * np.ones((number, 1)), np.ones((number, 1))), axis=0)
    return x, y


# noinspection PyShadowingNames
def visualize(x, y, show=True):
    plt.plot(x[(y == -1).squeeze(), 0], x[(y == -1).squeeze(), 1], 'r.')
    plt.plot(x[(y != -1).squeeze(), 0], x[(y != -1).squeeze(), 1], 'b.')
    if show:
        plt.show()


# noinspection PyShadowingNames
def boundary(x, w):
    y = -(w[1] * x + w[0]) / w[2]
    plt.plot(x, y)

if __name__ == "__main__":
    x, y = generate()
    visualize(x, y)

