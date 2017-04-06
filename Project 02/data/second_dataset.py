import numpy as np
import csv


# noinspection PyShadowingNames
def read(size=None):
    with open('OnlineNewsPopularity.csv', 'r') as file:
        reader = csv.reader(file)
        header = None
        urls = list()
        x = None
        for row in reader:
            if x is None:
                if header is None:
                    header = row
                else:
                    x = np.matrix(list(map(float, row[1:])))
                    urls.append(row[0])
            else:
                x = np.concatenate((x, np.matrix(list(map(float, row[1:])))), axis=0)
                urls.append(row[0])
            if size is not None and len(urls) > size:
                break
    return header, urls, x[:, 0:-1], x[:, -1]

if __name__ == '__main__':
    header, urls, x, y = read(100)
    print(len(urls))
    print(header)
    print(urls[0:10])
    print(x[0:10])
    print(y[0:10])
