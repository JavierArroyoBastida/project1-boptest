# -*- coding: utf-8 -*-
"""
"""

from casedata.data_manager import Data_Manager

if __name__ == "__main__":
    # Generate test case data
    man = Data_Manager()
    man.save_data_and_kpisjson(fmu_path='wrapped.fmu')
    