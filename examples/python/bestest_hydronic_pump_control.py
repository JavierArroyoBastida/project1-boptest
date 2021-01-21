# -*- coding: utf-8 -*-
"""
Created on Tue Nov 12 12:27:41 2019

@author: hwaln
"""


import requests
import pprint
import json
import pandas as pd
import matplotlib.pyplot as plt

conName='pumpTest'

def resToFrame(data):
    u = pd.DataFrame.from_dict(data['u'])
    u.index = u.time
    u.drop(columns=['time'], inplace=True)
    y = pd.DataFrame.from_dict(data['y'])
    y.index = y.time
    y.drop(columns=['time'], inplace=True)
    df = u.merge(y, left_index=True, right_index=True)
    return df
    
url = 'http://127.0.0.1:5000'

s = {'start_time': 0, 'warmup_period': 0}
res = requests.put('{0}/initialize'.format(url), data=s)
print(res)

# Advance simulation in loop for test
for i in range(24*1):
    #switch pump on/off for each timestep
    pump = 0 if (i % 2) == 0 else 1 
    u = {'ovePum_activate':1, 'ovePum_u':pump}
    y = requests.post('{0}/advance'.format(url), data = u).json()

# Get all simulation results
data = requests.get('{0}/results'.format(url)).json()

df = resToFrame(data)

fig,ax=plt.subplots(4,1, sharex=True)
df.ovePum_u.plot(ax=ax[0])
df.reaPum_y.plot(ax=ax[0])
df.reaPPum_y.plot(ax=ax[1])
df.reaQHea_y.plot(ax=ax[2])
df.reaTRoo_y.plot(ax=ax[3])

for a in ax:
    a.legend()
plt.show()

