import pandas as pd
import matplotlib.pyplot as plt



data = pd.read_csv('spice.din.txt', sep=' ', header=0, index_col=0, names=['operation', 'address'])
data['decimal'] = data.apply(lambda x: x.astype(str).map(lambda x: int(x, base=16)))
print(data.groupby(by='operation').count())
qwe = data.groupby(['address', 'decimal']).size().reset_index(name = 'occurrence')
print(qwe)
qwe.sort_values('decimal')[['address', 'occurrence']].plot(x='address',y='occurrence')
print(qwe)
plt.show()