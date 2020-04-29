within INFRAX.SubSystems.HeatingSystem.Components;
model CoolingTower
  import INFRAX;
//   replaceable package MediumGlycol =
//       IDEAS.Media.Antifreeze.Validation.BaseClasses.PropyleneGlycolWater (
//           property_T=273.15,
//           X_a=0.30) constrainedby Modelica.Media.Interfaces.PartialMedium;
    replaceable package MediumGlycol = IDEAS.Media.Water;
Buildings.Fluid.HeatExchangers.CoolingTowers.YorkCalc coolingTower(
    allowFlowReversal=false,
    redeclare final package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p11_m_flow,
    dp_nominal=35000,
    TAirInWB_nominal=273.15 + 22.2,
    TRan_nominal=5,
    PFan_nominal=4700,
    TApp_nominal=7.5,
    fraPFan_nominal=coolingTower.PFan_nominal/hydronic.p11_m_flow,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    tau=3600,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                        "cooling tower"
    annotation (Placement(transformation(extent={{6,76},{26,96}})));

  IDEAS.Fluid.Sensors.TemperatureTwoPort t26(
    m_flow_nominal=hydronic.p11_m_flow,
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    TAmb=289.15,
    transferHeat=false,
    redeclare package Medium = MediumGlycol)      annotation (Placement(
        transformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-14,67})));
  IDEAS.Fluid.Movers.SpeedControlled_y     p11(
    allowFlowReversal=false,
    addPowerToMedium=false,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    redeclare IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos80slash1to12_CAN_PN6
      per,
    inputType=IDEAS.Fluid.Types.InputType.Stages,
    riseTime=300,
    tau=60,
    use_inputFilter=false,
    redeclare package Medium = MediumGlycol)
                              "TABS pump" annotation (Placement(
        transformation(
        extent={{-6,-8},{6,8}},
        rotation=90,
        origin={-14,44})));
  IBPSA.Fluid.HeatExchangers.DryCoilEffectivenessNTU e006(
    redeclare package Medium1 = IDEAS.Media.Water,
    configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
    m1_flow_nominal=26000/3600,
    dp1_nominal=39300,
    dp2_nominal=47500,
    Q_flow_nominal(displayUnit="W") = 150000,
    r_nominal=0.474/0.621,
    m2_flow_nominal=27000/3600,
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    redeclare package Medium2 = MediumGlycol,
    T_a1_nominal=308.15,
    T_a2_nominal=302.65) "cooling tower heat exchanger" annotation (Placement(
        transformation(
        extent={{7,-8},{-7,8}},
        rotation=180,
        origin={17,-20})));

  IDEAS.Fluid.Movers.SpeedControlled_y     p10(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    addPowerToMedium=false,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    redeclare
      IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos65slash1to12_CAN_PN6slash10
      per,
    inputType=IDEAS.Fluid.Types.InputType.Stages,
    riseTime=300,
    T_start=284.15,
    tau=60,
    use_inputFilter=false)    "TABS pump" annotation (Placement(
        transformation(
        extent={{-7,-9},{7,9}},
        rotation=90,
        origin={-1,-59})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t31(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p10_m_flow,
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    transferHeat=false)     annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-1,-31})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t32(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p10_m_flow,
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    transferHeat=false)     annotation (Placement(transformation(
        extent={{5,-4},{-5,4}},
        rotation=90,
        origin={30,-39})));
  INFRAX.Data.Parameters.Hydronic hydronic
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Interfaces.RealOutput TLvg annotation (Placement(
        transformation(rotation=0, extent={{100,-70},{120,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare final package Medium =
        IDEAS.Media.Water) annotation (Placement(transformation(rotation=0,
          extent={{-12,-110},{10,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare final package Medium =
        IDEAS.Media.Water) annotation (Placement(transformation(rotation=0,
          extent={{18,-110},{42,-90}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t27(
    m_flow_nominal=hydronic.p11_m_flow,
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    TAmb=289.15,
    transferHeat=false,
    redeclare package Medium = MediumGlycol)
                    annotation (Placement(transformation(
        extent={{-7,-6.5},{7,6.5}},
        rotation=-90,
        origin={61.5,65})));
  INFRAX.SubSystems.Controllers.DataBus dataBus annotation (Placement(
        transformation(extent={{-158,0},{-118,40}}), iconTransformation(extent=
            {{-150,6},{-130,26}})));
  INFRAX.SubSystems.Controllers.SignalBus signalBus annotation (Placement(
        transformation(extent={{-158,-40},{-118,0}}), iconTransformation(extent
          ={{-150,-28},{-130,-8}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(redeclare package Medium =
        MediumGlycol)      annotation (Placement(transformation(rotation=0,
          extent={{88,0},{112,20}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(redeclare package Medium =
        MediumGlycol)      annotation (Placement(transformation(rotation=0,
          extent={{88,20},{112,40}})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_hex_sup(
    use_inputFilter=false,
    m_flow_nominal=hydronic.p11_m_flow,
    dpValve_nominal=0.01,
    l=1e-10,
    redeclare package Medium = MediumGlycol)
                          annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-14,-6})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_hex_ret(
    use_inputFilter=false,
    m_flow_nominal=hydronic.p11_m_flow,
    dpValve_nominal=0.01,
    l=1e-10,
    redeclare package Medium = MediumGlycol)
                          annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={60,-6})));
  IDEAS.Fluid.FixedResistances.Junction jun(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={61,31})));
  IDEAS.Fluid.FixedResistances.Junction jun1(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={-13,13})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_cc_sup(
    use_inputFilter=false,
    m_flow_nominal=hydronic.p11_m_flow,
    dpValve_nominal=0.01,
    allowFlowReversal=false,
    l=1e-10,
    redeclare package Medium = MediumGlycol)
                           annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=0,
        origin={27,13})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_cc_ret(
    use_inputFilter=false,
    m_flow_nominal=hydronic.p11_m_flow,
    dpValve_nominal=0.01,
    allowFlowReversal=false,
    l=1e-10,
    redeclare package Medium = MediumGlycol)
                          annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={83,31})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal[2]
    annotation (Placement(transformation(extent={{-88,-12},{-72,4}})));
                                                      //1 to hex, 2 to cc
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_e006_primary(
    allowFlowReversal=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p10_m_flow,
    dp_nominal(displayUnit="kPa") = 2900) "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-8,8},{8,-8}},
        rotation=270,
        origin={30,-70})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_e006_primary1(
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p11_m_flow,
    dp_nominal(displayUnit="kPa") = 2700,
    redeclare package Medium = MediumGlycol)
                                          "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-8,8},{8,-8}},
        rotation=0,
        origin={42,86})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_e006_primary2(
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p11_m_flow,
    dp_nominal(displayUnit="kPa") = 33800,
    redeclare package Medium = MediumGlycol)
                                           "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-8,8},{8,-8}},
        rotation=180,
        origin={82,12})));
  Modelica.Blocks.Interfaces.RealOutput P_pumps annotation (Placement(
        transformation(rotation=0, extent={{100,62},{120,82}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{82,66},{94,78}})));
  Modelica.Blocks.Interfaces.RealOutput P_CT annotation (Placement(
        transformation(rotation=0, extent={{100,80},{120,100}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=coolingTower.PFan)
    annotation (Placement(transformation(extent={{72,80},{92,100}})));
  Modelica.Blocks.Interfaces.RealOutput P10 annotation (Placement(
        transformation(rotation=0, extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealOutput P11 annotation (Placement(
        transformation(rotation=0, extent={{100,-48},{120,-28}})));
equation
  connect(p10.port_b,t31. port_a)
    annotation (Line(points={{-1,-52},{-1,-36}},          color={0,127,255}));
  connect(e006.port_a1,t31. port_b) annotation (Line(points={{10,-24.8},{-1,-24.8},
          {-1,-26}},       color={0,127,255}));
  connect(e006.port_b1,t32. port_a) annotation (Line(points={{24,-24.8},{30,-24.8},
          {30,-34}},       color={0,127,255}));
  connect(p11.port_b,t26. port_a)
    annotation (Line(points={{-14,50},{-14,62}},          color={0,127,255}));
  connect(t26.port_b,coolingTower. port_a)
    annotation (Line(points={{-14,72},{-14,86},{6,86}},   color={0,127,255}));
  connect(TLvg, coolingTower.TLvg) annotation (Line(points={{110,-60},{110,
          -60},{70,-60},{70,80},{27,80}},
                              color={0,0,127}));
  connect(port_a, p10.port_a)
    annotation (Line(points={{-1,-100},{-1,-66}},       color={0,127,255}));
  connect(t26.T, dataBus.T26);
  connect(t27.T, dataBus.T27);
  connect(t31.T, dataBus.T31);
  connect(t32.T, dataBus.T32);
  connect(coolingTower.TAir, signalBus.Twet);
  connect(p11.stage, signalBus.P11_signal);
  connect(p10.stage, signalBus.P10_signal);
  connect(e006.port_b2, val_hex_sup.port_a) annotation (Line(points={{10,-15.2},
          {-2,-15.2},{-2,-14},{-14,-14},{-14,-12}}, color={0,127,255}));
  connect(e006.port_a2, val_hex_ret.port_b) annotation (Line(points={{24,-15.2},
          {42,-15.2},{42,-16},{60,-16},{60,-12}},color={0,127,255}));
  connect(jun.port_2, val_hex_ret.port_a)
    annotation (Line(points={{61,26},{60,26},{60,-8.88178e-16}},
                                                      color={0,127,255}));
  connect(jun.port_1, t27.port_b) annotation (Line(points={{61,36},{62,36},{
          62,40},{61.5,40},{61.5,58}},
                              color={0,127,255}));
  connect(val_hex_sup.port_b, jun1.port_1)
    annotation (Line(points={{-14,0},{-14,8},{-13,8}}, color={0,127,255}));
  connect(jun1.port_2, p11.port_a)
    annotation (Line(points={{-13,18},{-14,18},{-14,38}}, color={0,127,255}));
  connect(jun1.port_3, val_cc_sup.port_b)
    annotation (Line(points={{-8,13},{20,13}}, color={0,127,255}));
  connect(port_b1, val_cc_ret.port_b) annotation (Line(points={{100,30},{96,30},
          {96,31},{90,31}}, color={0,127,255}));
  connect(jun.port_3, val_cc_ret.port_a)
    annotation (Line(points={{66,31},{68,31},{76,31}}, color={0,127,255}));
  connect(booleanToReal[1].u, signalBus.Hex_2way_signal) annotation (Line(
        points={{-89.6,-4},{-138,-4},{-138,-20}},       color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(booleanToReal[1].y, val_hex_sup.y) annotation (Line(points={{-71.2,-4},
          {-48,-4},{-21.2,-4},{-21.2,-6}}, color={0,0,127},
      visible=false));
  connect(booleanToReal[1].y, val_hex_ret.y) annotation (Line(points={{-71.2,-4},
          {-10,-4},{-10,-6},{52.8,-6}},
                                      color={0,0,127},
      visible=false));
  connect(booleanToReal[2].u, signalBus.CC_2way_signal) annotation (Line(points={{-89.6,
          -4},{-112,-4},{-138,-4},{-138,-20}},              color={255,0,255}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(booleanToReal[2].y, val_cc_sup.y) annotation (Line(points={{-71.2,-4},
          {-66,-4},{-66,32},{26,32},{26,21.4},{27,21.4}}, color={0,0,127},
      visible=false));
  connect(booleanToReal[2].y, val_cc_ret.y) annotation (Line(points={{-71.2,-4},
          {-66,-4},{-66,56},{83,56},{83,39.4}}, color={0,0,127},
      visible=false));
  connect(t32.port_b, dp_fixed_e006_primary.port_a) annotation (Line(points={
          {30,-44},{30,-53},{30,-62}}, color={0,127,255}));
  connect(dp_fixed_e006_primary.port_b, port_b) annotation (Line(points={{30,
          -78},{30,-78},{30,-100}}, color={0,127,255}));
  connect(coolingTower.port_b, dp_fixed_e006_primary1.port_a)
    annotation (Line(points={{26,86},{34,86}}, color={0,127,255}));
  connect(dp_fixed_e006_primary1.port_b, t27.port_a) annotation (Line(points=
          {{50,86},{61.5,86},{61.5,72}}, color={0,127,255}));
  connect(port_a1, dp_fixed_e006_primary2.port_a) annotation (Line(points={{
          100,10},{95,10},{95,12},{90,12}}, color={0,127,255}));
  connect(dp_fixed_e006_primary2.port_b, val_cc_sup.port_a)
    annotation (Line(points={{74,12},{34,12},{34,13}}, color={0,127,255}));
  connect(add.y, P_pumps)
    annotation (Line(points={{94.6,72},{110,72},{110,72}}, color={0,0,127}));
  connect(p11.P, add.u1) annotation (Line(
      points={{-21.2,50.6},{-21.2,75.6},{80.8,75.6}},
      color={0,0,127},
      visible=false));
  connect(p10.P, add.u2) annotation (Line(
      points={{-9.1,-51.3},{-9.1,68.4},{80.8,68.4}},
      color={0,0,127},
      visible=false));
  connect(realExpression.y, P_CT)
    annotation (Line(points={{93,90},{110,90}}, color={0,0,127}));
  connect(coolingTower.y, signalBus.CT_signal) annotation (Line(points={{4,94},
          {-138,94},{-138,-20}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(p10.P, P10) annotation (Line(points={{-9.1,-51.3},{-9.1,-20},{110,-20}},
        color={0,0,127}));
  connect(p11.P, P11) annotation (Line(points={{-21.2,50.6},{-21.2,-38},{110,
          -38}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-140,-100},{100,100}})));
end CoolingTower;
