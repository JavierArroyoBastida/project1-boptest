within INFRAX.SubSystems.Controllers;
expandable connector SignalBus "Data bus that stores signal data"
  extends Modelica.Icons.SignalBus;

//   Boolean HP_onoff "heat pumps on or off";
//   Integer HP1_signal "heat pump 1 signal";
//   Integer HP2_signal "heat pump 2 signal";
//   Real P0102_mod "percentage of rpm of pump 01/02";
//   Real P03_mod "signal for pump 03";
//   Integer P04_signal "signal for pump 04";
//   Real P05_mod "modulation for pump 05";
//   Integer P06_signal "signal for pump 06";
//   Integer P07_signal "signal for pump 07";
//   Integer P08_signal "signal for pump 08";
//   Integer P09_signal "signal for pump 09";
//   Integer P13_signal "signal for pupmp 13";
//   Boolean heatMode "heating mode signal";
//   Boolean coolMode "cooling mode signal";
//   Boolean restMode "rest mode signal";
//   Real CT_signal "cooling tower signal";
//   Modelica.SIunits.Temperature Twet "wet bulb temperature";
//   Real TABS_3way_signal "TABS mixing 3 way valve signal";
//   Real HP_3way_signal "Bypass when HP is turned off";
//   Real PC_3way_signal "two way valves for choosing between heating, cooling or rest";
//   Real HeaCoi_3way_signal(start=0) "3 way valve mixing heating coil for VAV";
//   Real CooCoi_3way_signal(start=0) "3 way valve mixing cooling coil for VAV";
//   Real[4] CCA3_valve_signal "signal for two-way valve of 3rd floor CCA";
//   Real CCA3_val "DETAILED signal for 2way valve 3rd floor CCA";
//   Real[7] CCA2_valve_signal "signal for two-way valve of 2nd floor CCA";
//   Real CCA2_val "DETAILED signal for 2way valve 2nd floor CCA";
//   Real[9] CCA1_valve_signal "signal for two-way valve of 1st floor CCA";
//   Real CCA1_val "DETAILED signal for 2way valve 1st floor CCA";
//   Real[15] CCA0_valve_signal "signal for two-way valve of ground floor CCA";
//   Real CCA0_val "DETAILED signal for 2way valve ground floor CCA";
//   Boolean TABSheatingDemand "TABS heating demand";
//   Boolean TABScoolingDemand "TABS cooling demand";
//   Boolean AHUheatingDemand "AHU heating demand";
//   Boolean AHUcoolingDemand "AHU cooling demand";
//   Boolean VAVheatingDemand "VAV global heating demand";
//   Boolean VAVcoolingDemand "VAV global cooling demand";
//   Boolean VAVheatingDemandInd[21] "VAV individual heating demand";
//   Boolean VAVcoolingDemandInd[21] "VAV individual cooling demand";
//   Boolean heatingDemand "any heating demand on";
//   Boolean coolingDemand "any cooling demand on";
//   Boolean CC_2way_signal "two way valves for flow towards cooling circuit";
//   Boolean Hex_2way_signal "two way valves for flow towards heat exchanger";
//   Real CC_3way_signal;
//   Real Hex_3way_signal;
//   Integer P10_signal "signal for pump 10";
//   Real P10_real;
//   Real P11_real;
//   Integer P11_signal "signal for pump 11";
//   Real AHUsupply "signal for AHU supply fan";
//   Real AHUextract "signal for AHU extraction fan";
   Real[15] VAV_signal;
   Real[15] VAV_signal_extract "signal for ventilation extract";
   Real[21] Heacoils_signal(each start=0) "signal for ventilation heating coils";
//   Modelica.SIunits.Temperature[21] TSupplySetPoints "Supply temperature setpoints";
//   Modelica.SIunits.Temperature T_TABS "TABS supply water temperature setpoint";
//   Modelica.SIunits.Temperature T_AHU "air handling unit setpoint";
//   Real TW_3way_signal "thermal wheel minimum state (no working)";
//   Real NightVentilation "night ventilation on/off";

  annotation (
    defaultComponentName="weaBus",
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-20,2},{22,-2}},
          lineColor={255,204,51},
          lineThickness=0.5)}),
    Documentation(info="<html>
<p>
This component is an expandable connector that is used to implement a bus that contains the weather data.
</p>
</html>", revisions="<html>
<ul>
<li>
June 25, 2010, by Wangda Zuo:<br/>
First implementation.
</li>
</ul>
</html>"));
end SignalBus;
