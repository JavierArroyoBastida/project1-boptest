# -*- coding: utf-8 -*-
"""
This module is an example python-based testing interface.  
  
"""

# GENERAL PACKAGE IMPORT
# ----------------------
import cPickle as pickle
import numpy as np

from matplotlib import pyplot as plt
# ----------------------

E = pickle.load(file('C:\\Users\\u0110910\\Box Sync\\work_folder\\BOPTEST\\testcase3\\models\\EnergyIntegrals','r'))

days = range(1, len(E['E_trapz'])*7, 7)
   
# Plot results
plt.figure(1)
plt.title('Energy integrals')
plt.plot(days, E['E_trapz'], label='Energy calculated with python trapz() method')
plt.plot(days, E['E_model'], label='Energy calculated with modelica integrator')
plt.legend()
plt.ylabel('Energy [kWh]')
plt.xlabel('Time [days]')
plt.figure(2)
plt.title('Difference')
plt.plot(days, np.asarray(E['E_trapz'])-np.asarray(E['E_model']))
plt.ylabel('Energy [kWh]')
plt.xlabel('Time [days]')
plt.show()
# --------------------

