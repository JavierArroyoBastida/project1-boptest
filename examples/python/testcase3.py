# -*- coding: utf-8 -*-
"""
This script demonstrates a minimalistic example of testing a feedback controller
with the prototype test case called "testcase3".

"""

# GENERAL PACKAGE IMPORT
# ----------------------
import sys
import pathlib
sys.path.insert(0, str(pathlib.Path(__file__).absolute().parents[2]))
from examples.python.interface import control_test


def run(plot=False, customized_kpi_config=None):
    """Run test case.
    Parameters
    ----------
    plot : bool, optional
        True to plot timeseries results.
        Default is False.
    customized_kpi_config : string, optional
        The path of the json file which contains the customized kpi information.
        Default is None.

    Returns
    -------
    kpi : dict
        Dictionary of core KPI names and values.
        {kpi_name : value}
    res : dict
        Dictionary of trajectories of inputs and outputs.
    custom_kpi_result: dict
        Dictionary of tracked custom KPI calculations.
        Empty if no customized KPI calculations defined.

    """
    ########################################
    # config for the control test
    length = 48*3600
    step = 300
    control_module = 'examples.python.controllers.pidTwoZones'
    forecast_config = [
            'LowerSetp[North]',
            'UpperSetp[North]',
            'LowerSetp[South]',
            'UpperSetp[South]'
    ]
    ########################################
    kpi, df_res, custom_kpi_result, forecast_store = control_test(length=length,
                                                                    step=step,
                                                                    control_module=control_module,
                                                                    forecast_config=forecast_config)
    setpoints = forecast_store
    time = df_res.index.values/3600  # convert s --> hr
    setpoints.index = setpoints.index/3600  # convert s --> hr
    zone_temp_north = df_res['TRooAirNor_y'].values-273.15  # convert K --> C
    power_heat_north = df_res['PHeaNor_y'].values
    zone_temp_south = df_res['TRooAirSou_y'].values-273.15  # convert K --> C
    power_heat_south = df_res['PHeaSou_y'].values
    setpoints = setpoints - 273.15  # convert K --> C
    # Plot results
    if plot:
        try:
            from matplotlib import pyplot as plt
            plt.figure(1)
            plt.title('Zone Temperatures')
            plt.plot(time, zone_temp_north, label='TZoneNor')
            plt.plot(time, zone_temp_south, label='TZoneSou')
            for stp in setpoints.columns:
                plt.plot(setpoints[stp], '--', label=stp)
            plt.ylabel('Temperature [C]')
            plt.xlabel('Time [hr]')
            plt.legend()
            plt.figure(2)
            plt.title('Heater Powers')
            plt.plot(time, power_heat_north, label='PHeatNor')
            plt.plot(time, power_heat_south, label='PHeatSou')
            plt.ylabel('Electrical Power [W]')
            plt.xlabel('Time [hr]')
            plt.legend()
            plt.show()
        except ImportError:
            print("Cannot import numpy or matplotlib for plot generation")
    # --------------------

    return kpi, df_res


if __name__ == "__main__":
    kpi, df_res = run(customized_kpi_config='custom_kpi/custom_kpis_example.config')
