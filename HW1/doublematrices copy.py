import numpy as np
import time

W = 0
P = 0
np.random.seed(100)
for i in range(10):
    M = np.random.rand(100, 120 )
    N = np.random.rand(120, 100)
    start = time.time()
    np.matmul(M, N)
    end = time.time()
    W += end - start
print(W/10)

for i in range(10):
    Y = np.random.randint(3, size=(100, 200))
    Z = np.random.randint(3, size=(200, 100))
    start1 = time.time()
    np.matmul(Y, Z)
    end1 = time.time()
    P += end1 - start1

print(P/10)