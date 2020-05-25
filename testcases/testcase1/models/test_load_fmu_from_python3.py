'''
Created on May 25, 2020

@author: Javier Arroyo

This is a test to attempt to load an FMU that has been compiled with 
JModelica in Python 2 into a Python 3 environment, using the pyfmi
package installed in the latter environment. Therefore, this script is 
meant to be run with Python 3, but wrapped.fmu should come from running
compile_fmu.py with the JModelica interpreter of Python 2. 
If successful, this test would prove that test cases can still be 
compiled with the latest open-source JModelica release, whereas 
BOPTEST can freely use Python 3 with pyfmi.  

'''

from pyfmi import load_fmu
import platform
import sys

print('------------------')
print('sys.version_info:')
print(sys.version_info)
print('------------------')
print('platform.architecture()[0]:')
print(platform.architecture()[0])
print('------------------')

fmu = load_fmu('wrapped.fmu')
