import numpy as np
import csv


# noinspection PyShadowingNames
def read():
    with open('DataSet2.txt', 'r') as file:
        reader = csv.reader(file)
        x = None
        for row in reader:
            tmp = map(float, row)
            if x is None:
                x = np.matrix(list(tmp))
            else:
                x = np.concatenate((x, np.matrix(list(tmp))), axis=0)
    return x[:, 0:4], x[:, 4]

if __name__ == '__main__':
    x, y = read()
    print(x)
    print(y)
