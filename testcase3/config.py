# -*- coding: utf-8 -*-
"""
This file is used to configure the test case.

"""

def get_config():
    '''Returns the configuration structure for the test case.
    
    Returns
    -------
    config : dict()
    Dictionary contatining configuration information.
    {
    'fmupath'  : string, location of model fmu
    'step'     : int, default control step size in seconds
    }
    
    '''
        
    config = {
    # Enter configuration information
    'fmupath'  : 'C:\\Users\\u0110910\\Box Sync\\work_folder\\BOPTEST\\testcase3\\models\\wrapped.fmu',
    'kpipath'  : 'C:\\Users\\u0110910\\Box Sync\\work_folder\\BOPTEST\\testcase3\\models\\kpis.json',
    'step'     : 3600
    }
    
    return config