import numpy as np
from random import shuffle

from learning.mlp import MLP
from data import moon_dataset

if __name__ == "__main__":
    x, y = moon_dataset.generate()
    # moon_dataset.visualize(x, y)
    index = list(range(0, 2000))
    # shuffle(index)
    x = x[index]
    y = y[index]
    mlp = MLP((2, 4, 1), MLP.init_random, MLP.act_func_bip_sig)
    for i in range(0, 100):
        for j in range(0, 5):
            for xx, yy in zip(x, y):
                mlp.back_propagation(xx, yy, 0.1)
            # mlp.back_propagation(x, y, 0.05)
        y_hat = np.sign(mlp.forward_propagation(x))
        print(np.sum(np.power(y_hat - y, 2)) / 4)
