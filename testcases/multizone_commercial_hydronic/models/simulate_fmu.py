'''
Created on Apr 29, 2020

@author: Javier Arroyo
'''

from pyfmi import load_fmu

model = load_fmu('INFRAX_IBPSA_BOPTEST_Copy.fmu')

opts = model.simulate_options()
opts['solver'] = 'ExplicitEuler'
opts['ExplicitEuler_options']['h'] = 15 

res = model.simulate(start_time=0,
                     final_time=3*24*3600,
                     options=opts)
# print(model)