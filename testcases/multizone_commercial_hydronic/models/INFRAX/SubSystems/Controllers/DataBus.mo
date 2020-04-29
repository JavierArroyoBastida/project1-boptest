within INFRAX.SubSystems.Controllers;
expandable connector DataBus "Data bus that stores sensor data"
  extends Modelica.Icons.SignalBus;

  Modelica.SIunits.Temperature T1;
  Modelica.SIunits.Temperature T2;
  Modelica.SIunits.Temperature T3;
  Modelica.SIunits.Temperature T4;
  Modelica.SIunits.Temperature T5;
  Modelica.SIunits.Temperature T6;
  Modelica.SIunits.Temperature T7;
  Modelica.SIunits.Temperature T8;
  Modelica.SIunits.Temperature T9;
  Modelica.SIunits.Temperature T10;
  Modelica.SIunits.Temperature T11;
  Modelica.SIunits.Temperature T12;
  Modelica.SIunits.Temperature T13;
  Modelica.SIunits.Temperature T14;
  Modelica.SIunits.Temperature T15;
  Modelica.SIunits.Temperature T16;
  Modelica.SIunits.Temperature T17;
  Modelica.SIunits.Temperature T18;
  Modelica.SIunits.Temperature T19;
  Modelica.SIunits.Temperature T20;
  Modelica.SIunits.Temperature T21;
  Modelica.SIunits.Temperature T22;
  Modelica.SIunits.Temperature T23;
  Modelica.SIunits.Temperature T24;
  Modelica.SIunits.Temperature T25;
  Modelica.SIunits.Temperature T26;
  Modelica.SIunits.Temperature T27;
  Modelica.SIunits.Temperature T28;
  Modelica.SIunits.Temperature T29;
  Modelica.SIunits.Temperature T30;
  Modelica.SIunits.Temperature T31;
  Modelica.SIunits.Temperature T32;
  Modelica.SIunits.Temperature T33;
  Modelica.SIunits.Temperature T34;
  Modelica.SIunits.Temperature TretCCA0;
  Modelica.SIunits.Temperature TretCCA1;
  Modelica.SIunits.Temperature TretCCA2;
  Modelica.SIunits.Temperature TretCCA3;
  Modelica.SIunits.Temperature TAirSupplyAHU;
  Modelica.SIunits.Temperature TAirExtractAHU;
  Modelica.SIunits.Temperature[21] TAirSupplyVAV;
  //Floor sensors
    //3rdFloor
  Modelica.SIunits.Temperature T3rdFlr_SZ;
  Modelica.SIunits.Temperature T3rdFlr_MTR;
  Modelica.SIunits.Temperature T3rdFlr_CPR;
  Modelica.SIunits.Temperature T3rdFlr_SmaR;
    //2ndFloor
  Modelica.SIunits.Temperature T2ndFlr_NZ;
  Modelica.SIunits.Temperature T2ndFlr_SZ;
  Modelica.SIunits.Temperature T2ndFlr_MT1;
  Modelica.SIunits.Temperature T2ndFlr_MT2;
    //1stFloor
  Modelica.SIunits.Temperature T1stFlr_NZ;
  Modelica.SIunits.Temperature T1stFlr_SZ1;
  Modelica.SIunits.Temperature T1stFlr_SZ2;
  Modelica.SIunits.Temperature T1stFlr_MT1;
  Modelica.SIunits.Temperature T1stFlr_MT2;
    //GndFloor
  Modelica.SIunits.Temperature TGndFlr_SVR;
  Modelica.SIunits.Temperature TGndFlr_1stAid;
  Modelica.SIunits.Temperature TGndFlr_KTR;
  Modelica.SIunits.Temperature TGndFlr_MT1;
  Modelica.SIunits.Temperature TGndFlr_MT2;
  Modelica.SIunits.Temperature TGndFlr_hall;
    //Stairs
  Modelica.SIunits.Temperature TGndFlr_WStairs;
  Modelica.SIunits.Temperature TGndFlr_EStairs;
    //3rdFloor
  Real CO2_3rdFlr_SZ;
  Real CO2_3rdFlr_MTR;
  Real CO2_3rdFlr_CPR;
  Real CO2_3rdFlr_SmaR;
    //2ndFloor
  Real CO2_2ndFlr_NZ;
  Real CO2_2ndFlr_SZ;
  Real CO2_2ndFlr_MT1;
  Real CO2_2ndFlr_MT2;
    //1stFloor
  Real CO2_1stFlr_NZ;
  Real CO2_1stFlr_SZ1;
  Real CO2_1stFlr_SZ2;
  Real CO2_1stFlr_MT1;
  Real CO2_1stFlr_MT2;
    //GndFloor
  Real CO2_GndFlr_SVR;
  Real CO2_GndFlr_1stAid;
  Real CO2_GndFlr_KTR;
  Real CO2_GndFlr_MT1;
  Real CO2_GndFlr_MT2;
  Real CO2_GndFlr_hall;
    //Stairs
  Real CO2_GndFlr_WStairs;
  Real CO2_GndFlr_EStairs;

   //Average
  Modelica.SIunits.Temperature Tavg_3rdFlr "average temperature of the 3rd floor";
  Modelica.SIunits.Temperature Tavg_2ndFlr "average temperature of the 2nd floor";
  Modelica.SIunits.Temperature Tavg_1stFlr "average temperature of the 1st floor";
  Modelica.SIunits.Temperature Tavg_GndFlr "average temperature of the ground floor";
  Modelica.SIunits.Temperature Tavg_building  "average temperature of the building";
  //Pump mass flows
  //Modelica.SIunits.MassFlowRate p04_m_flow "current mass flow on pump 04";
  //Modelica.SIunits.MassFlowRate p05_m_flow "current mass flow on pump 05";
  //Modelica.SIunits.MassFlowRate p13_m_flow "current mass flow on pump 13";

  //Mass flow rate to outside in storage room, 1st floor
  //Modelica.SIunits.MassFlowRate m_dist;
  //Mass flow rate to outside in south zone, 3rd floor
  //Modelica.SIunits.MassFlowRate m_dist1;
  //Shading control for building
  Real eastShading2nd "movable east windows shading signal, 2nd floor";
  Real eastShading3rd "movable east windows shading signal, 3rd floor";
  Real southShading "movable south windows shading signal";
  Real westShading "movable west windows shading signal";

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
end DataBus;
