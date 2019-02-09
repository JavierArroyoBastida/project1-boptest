# -*- coding: utf-8 -*-
"""
This file is used to configure the test case.

"""

def get_config():
    '''Returns the configuration structure for the test case.
    
    Returns
    -------
    config : dict()
    Dictionary contatinin configuration information.
    {
    'fmupath'  : string, location of model fmu
    'kpipath'  : string, location of kpi json
    'step'     : int, default control step size in seconds
    }
    
    '''
        
    config = {
    # Enter configuration information
    'fmupath'  : 'C:\\Users\\u0110910\\Box Sync\\work_folder\\BOPTEST\\testcase1\\models\\wrapped.fmu',
    'kpipath'  : 'C:\\Users\\u0110910\\Box Sync\\work_folder\\BOPTEST\\testcase1\\models\\kpis.json',
    'step'     : 60
    }
    
    #===========================================================================
    # config = {
    # # Enter configuration information
    # 'fmupath'  : 'models/wrapped.fmu',
    # 'kpipath'  : 'models/kpis.json',
    # 'step'     : 60
    # }
    #===========================================================================
    
    return config