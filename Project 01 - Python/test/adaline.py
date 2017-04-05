import numpy as np
import matplotlib.pyplot as plt

from data import moon_dataset
from learning import adaline, train


x, y = moon_dataset.generate(number=1000, d=1)
x_test, y_test = moon_dataset.generate(number=1000, d=1)

# noinspection PyShadowingNames
w, train_error, test_error = train.by_epoch(lambda x, y, w: adaline.learn(x, y, w, 0.001),
                                            adaline.predict,
                                            100,
                                            x,
                                            y,
                                            x_test,
                                            y_test,
                                            np.random.random((3, 1)) - 0.5)
print(train_error)
moon_dataset.visualize(x, y, False)
# -15:30
moon_dataset.boundary(np.array([-15, 30]), w)
plt.show()

