within INFRAX.SubSystems.HeatingSystem.Components;
model TABS "TABS System for the TACO approach"

  INFRAX.Data.Parameters.Structure structure
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  INFRAX.Data.Parameters.Hydronic hydronic
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t24(redeclare package Medium =
        IDEAS.Media.Water, m_flow_nominal=hydronic.p07_m_flow,
    allowFlowReversal=false,
    tau=hydronic.sensorTau) "supply temperature of TABS"       annotation (
      Placement(transformation(
        extent={{-5,-6},{5,6}},
        rotation=90,
        origin={-60,-27})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t25(redeclare package Medium =
        IDEAS.Media.Water, m_flow_nominal=hydronic.p07_m_flow,
    allowFlowReversal=false,
    tau=hydronic.sensorTau)                                    annotation (
      Placement(transformation(
        extent={{5,-6},{-5,6}},
        rotation=90,
        origin={70,-31})));
  IDEAS.Fluid.HeatExchangers.RadiantSlab.EmbeddedPipe[15] cca0(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare each INFRAX.Data.Parameters.INFRAXTABS RadSlaCha,
    redeclare each package Medium = IDEAS.Media.Water,
    each massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    each nDiscr=3,
    m_flow_nominal=hydronic.m_flow_GndFlr,
    A_floor=structure.CCA_Areas[21:35],
    nParCir=structure.CCA_paralel_circuits[21:35],
    dp_nominal=hydronic.dp_nominal_GndFlr,
    each mSenFac=1)                          "TABS ground floor"
    annotation (Placement(transformation(extent={{-24,-22},{-4,-2}})));
  Modelica.Fluid.Interfaces.FluidPort_a heaSupply(redeclare package Medium =
        IDEAS.Media.Water) "supply of TABS"
    annotation (Placement(transformation(extent={{-70,-150},{-50,-130}})));
  Modelica.Fluid.Interfaces.FluidPort_b heaReturn(redeclare package Medium =
        IDEAS.Media.Water) "return of TABS"
    annotation (Placement(transformation(extent={{60,-150},{80,-130}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort tcca0(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=(9.8/3600)*sum(structure.CCA_Areas[21:35]),
    tau=hydronic.sensorTau)
    "return temperature of CCA in ground floor" annotation (Placement(
        transformation(
        extent={{7,6},{-7,-6}},
        rotation=180,
        origin={45,-12})));
  IDEAS.Fluid.Actuators.Valves.ThreeWayEqualPercentageMixedLinear
                                                             TWVTABS(
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=hydronic.p07_m_flow,
    CvData=IDEAS.Fluid.Types.CvTypes.Kv,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    riseTime=150,
    y_start=0,
    use_inputFilter=false,
    Kv=80,
    y(start=1, fixed=false),
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                                     annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-60,-84})));
  IDEAS.Fluid.Movers.FlowControlled_dp     pump7(
    redeclare package Medium = IDEAS.Media.Water,
    addPowerToMedium=false,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    allowFlowReversal=false,
    redeclare
      IDEAS.Fluid.Movers.Data.Pumps.Wilo.VeroLine40slash130dash2comma2slash2
      per,
    y_start=1,
    tau=60,
    riseTime=120,
    use_inputFilter=false,
    m_flow_nominal=hydronic.p07_m_flow,
    dp_nominal(displayUnit="kPa") = 6*9.81*1000,
    inputType=IDEAS.Fluid.Types.InputType.Stages,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(extent={{-7,-8},{7,8}},
        rotation=90,
        origin={-60,-43})));
  IDEAS.Fluid.HeatExchangers.RadiantSlab.EmbeddedPipe[9] cca1(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare INFRAX.Data.Parameters.INFRAXTABS RadSlaCha,
    redeclare each package Medium = IDEAS.Media.Water,
    each massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    each nDiscr=3,
    m_flow_nominal=hydronic.m_flow_1stFlr,
    A_floor=structure.CCA_Areas[12:20],
    nParCir=structure.CCA_paralel_circuits[12:20],
    dp_nominal=hydronic.dp_nominal_1stFlr,
    each mSenFac=1)             "TABS 1st floor"
    annotation (Placement(transformation(extent={{-24,8},{-4,28}})));
  IDEAS.Fluid.HeatExchangers.RadiantSlab.EmbeddedPipe[7] cca2(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare each INFRAX.Data.Parameters.INFRAXTABS RadSlaCha,
    redeclare each package Medium = IDEAS.Media.Water,
    each massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    each nDiscr=3,
    m_flow_nominal=hydronic.m_flow_2ndFlr,
    A_floor=structure.CCA_Areas[5:11],
    nParCir=structure.CCA_paralel_circuits[5:11],
    dp_nominal=hydronic.dp_nominal_2ndFlr,
    each mSenFac=1)             "TABS 2nd floor"
    annotation (Placement(transformation(extent={{-24,36},{-4,56}})));
  IDEAS.Fluid.HeatExchangers.RadiantSlab.EmbeddedPipe[4] cca3(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare each INFRAX.Data.Parameters.INFRAXTABS RadSlaCha,
    redeclare each package Medium = IDEAS.Media.Water,
    each massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    each nDiscr=3,
    m_flow_nominal=hydronic.m_flow_3rdFlr,
    A_floor=structure.CCA_Areas[1:4],
    nParCir=structure.CCA_paralel_circuits[1:4],
    dp_nominal=hydronic.dp_nominal_3rdFlr,
    each mSenFac=1)             "TABS 3rd floor"
    annotation (Placement(transformation(extent={{-24,64},{-4,84}})));
  IDEAS.Fluid.FixedResistances.Junction jun0(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving)
    annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=-90,
        origin={-60,-12})));
  IDEAS.Fluid.FixedResistances.Junction jun1(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving)
    annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=-90,
        origin={-60,18})));
  IDEAS.Fluid.FixedResistances.Junction jun2(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving)
    annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=-90,
        origin={-60,46})));
  IDEAS.Fluid.FixedResistances.Junction jun3(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={70,-12})));
  IDEAS.Fluid.FixedResistances.Junction jun4(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={70,18})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort tcca1(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=(9.8/3600)*sum(structure.CCA_Areas[21:35]),
    tau=hydronic.sensorTau)
    "return temperature of CCA in ground floor" annotation (Placement(
        transformation(
        extent={{7,6},{-7,-6}},
        rotation=180,
        origin={45,18})));
  IDEAS.Fluid.FixedResistances.Junction jun5(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={70,46})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort tcca2(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=(9.8/3600)*sum(structure.CCA_Areas[21:35]),
    tau=hydronic.sensorTau)
    "return temperature of CCA in ground floor" annotation (Placement(
        transformation(
        extent={{7,6},{-7,-6}},
        rotation=180,
        origin={47,46})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort tcca3(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=(9.8/3600)*sum(structure.CCA_Areas[21:35]),
    tau=hydronic.sensorTau)
    "return temperature of CCA in ground floor" annotation (Placement(
        transformation(
        extent={{7,6},{-7,-6}},
        rotation=180,
        origin={47,74})));
  IDEAS.Fluid.FixedResistances.Junction jun6(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={70,-84})));
  Controllers.DataBus dataBus annotation (Placement(transformation(extent={{-120,
            -2},{-80,38}}), iconTransformation(extent={{-112,6},{-92,26}})));
  Controllers.SignalBus signalBus annotation (Placement(transformation(extent={
            {-118,-42},{-78,-2}}), iconTransformation(extent={{-112,-28},{-92,-8}})));
  IDEAS.Fluid.FixedResistances.Junction jun7(
    redeclare package Medium = IDEAS.Media.Water,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    m_flow_nominal={1,hydronic.p07_m_flow,1},
    dp_nominal={0,70000,0})
    annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=-90,
        origin={-60,-60})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_heat_sup(
    from_dp=true,
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p11_m_flow,
    allowFlowReversal=false,
    dpValve_nominal=1000) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-60,-120})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_coo_sup(
    from_dp=true,
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p11_m_flow,
    allowFlowReversal=false,
    dpValve_nominal=1000) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=0,
        origin={-22,-60})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_heat_ret(
    from_dp=true,
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p11_m_flow,
    allowFlowReversal=false,
    dpValve_nominal=1000) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={70,-120})));
  IDEAS.Fluid.FixedResistances.Junction jun(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving)
    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={70,-50})));
  IDEAS.Fluid.Actuators.Valves.TwoWayLinear val_coo_ret(
    from_dp=true,
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p11_m_flow,
    allowFlowReversal=false,
    dpValve_nominal=1000) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={90,-50})));
  Modelica.Fluid.Interfaces.FluidPort_a cooSupply(redeclare package Medium =
        IDEAS.Media.Water) "supply of TABS"
    annotation (Placement(transformation(extent={{110,-80},{130,-60}})));
  Modelica.Fluid.Interfaces.FluidPort_b cooReturn(redeclare package Medium =
        IDEAS.Media.Water) "return of TABS"
    annotation (Placement(transformation(extent={{110,-50},{130,-30}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal[2]
    annotation (Placement(transformation(extent={{-94,-126},{-82,-114}})));
  IDEAS.Fluid.Actuators.Valves.TwoWayQuickOpening
                                            val_cca0(
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p07_m_flow/4,
    allowFlowReversal=false,
    dpValve_nominal=2000) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={18,-12})));
  IDEAS.Fluid.Actuators.Valves.TwoWayQuickOpening
                                            val_cca1(
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p07_m_flow/4,
    allowFlowReversal=false,
    dpValve_nominal=2000) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={18,18})));
  IDEAS.Fluid.Actuators.Valves.TwoWayQuickOpening
                                            val_cca2(
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p07_m_flow/4,
    allowFlowReversal=false,
    dpValve_nominal=2000) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={18,46})));
  IDEAS.Fluid.Actuators.Valves.TwoWayQuickOpening
                                            val_cca3(
    use_inputFilter=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p07_m_flow/4,
    allowFlowReversal=false,
    dpValve_nominal=2000) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={18,74})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[35] port_emb
    annotation (Placement(transformation(extent={{-24,92},{-4,112}})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_byPass_TABS(
    allowFlowReversal=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p07_m_flow,
    dp_nominal(displayUnit="kPa") = 2*83000)
                                           "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-8,8},{8,-8}},
        rotation=180,
        origin={10,-84})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_retCollector_TABS(
    allowFlowReversal=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p07_m_flow,
  dp_nominal=64000 + 20000)                "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-6,-8},{6,8}},
        rotation=270,
        origin={70,-104})));
  Modelica.Blocks.Interfaces.RealOutput P_pump
    annotation (Placement(transformation(extent={{-100,-60},{-120,-40}})));
equation

  connect(pump7.port_b, t24.port_a)
    annotation (Line(points={{-60,-36},{-60,-36},{-60,-32}},
                                                   color={0,127,255}));
  connect(t24.port_b, jun0.port_1) annotation (Line(points={{-60,-22},{-60,
          -22},{-60,-18}}, color={0,127,255}));
  connect(jun0.port_2, jun1.port_1)
    annotation (Line(points={{-60,-6},{-60,12}}, color={0,127,255}));
  connect(jun1.port_2, jun2.port_1)
    annotation (Line(points={{-60,24},{-60,40}}, color={0,127,255}));
  connect(t25.port_a, jun3.port_2)
    annotation (Line(points={{70,-26},{70,-18}}, color={0,127,255}));
  connect(tcca0.port_b, jun3.port_3) annotation (Line(points={{52,-12},{52,
          -12},{64,-12}}, color={0,127,255}));
  connect(jun3.port_1, jun4.port_2)
    annotation (Line(points={{70,-6},{70,3},{70,12}}, color={0,127,255}));
  connect(jun4.port_3, tcca1.port_b)
    annotation (Line(points={{64,18},{58,18},{52,18}}, color={0,127,255}));
  connect(tcca2.port_b, jun5.port_3)
    annotation (Line(points={{54,46},{59,46},{64,46}}, color={0,127,255}));
  connect(jun5.port_2, jun4.port_1)
    annotation (Line(points={{70,40},{70,32},{70,24}}, color={0,127,255}));
  connect(tcca3.port_b, jun5.port_1)
    annotation (Line(points={{54,74},{70,74},{70,52}}, color={0,127,255}));
  connect(t24.T, dataBus.T24);
  connect(t25.T, dataBus.T25);
  connect(TWVTABS.y, signalBus.TABS_3way_signal);
  connect(tcca0.T, dataBus.TretCCA0);
  connect(tcca1.T, dataBus.TretCCA1);
  connect(tcca2.T, dataBus.TretCCA2);
  connect(tcca3.T, dataBus.TretCCA3);

  connect(heaSupply, val_heat_sup.port_a)
    annotation (Line(points={{-60,-140},{-60,-126}}, color={0,127,255}));
  connect(heaReturn, val_heat_ret.port_b)
    annotation (Line(points={{70,-140},{70,-126}}, color={0,127,255}));
  connect(val_coo_sup.port_b, jun7.port_3)
    annotation (Line(points={{-30,-60},{-54,-60}},   color={0,127,255}));
  connect(val_coo_ret.port_a, jun.port_3)
    annotation (Line(points={{82,-50},{82,-50},{76,-50}}, color={0,127,255}));
  connect(val_coo_ret.port_b, cooReturn)
    annotation (Line(points={{98,-50},{110,-50},{110,-40},{120,-40}},
                                                  color={0,127,255}));
  connect(val_coo_sup.port_a, cooSupply) annotation (Line(points={{-14,-60},{
          40,-60},{40,-70},{120,-70}},
                             color={0,127,255}));
  connect(booleanToReal[1].u, signalBus.heatMode) annotation (Line(points={{-95.2,
          -120},{-98,-120},{-98,-22}},       color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(booleanToReal[1].y, val_heat_sup.y);
  connect(val_heat_ret.y, booleanToReal[1].y);
  connect(booleanToReal[2].u, signalBus.coolMode) annotation (Line(points={{-95.2,
          -120},{-98,-120},{-98,-22},{-98,-22}},       color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(val_coo_ret.y, booleanToReal[2].y);
  connect(val_coo_sup.y, booleanToReal[2].y);
  connect(val_cca3.port_b, tcca3.port_a)
    annotation (Line(points={{26,74},{34,74},{40,74}}, color={0,127,255}));
  connect(val_cca2.port_b, tcca2.port_a)
    annotation (Line(points={{26,46},{34,46},{40,46}}, color={0,127,255}));
  connect(val_cca1.port_b, tcca1.port_a)
    annotation (Line(points={{26,18},{32,18},{38,18}}, color={0,127,255}));
  connect(val_cca0.port_b, tcca0.port_a)
    annotation (Line(points={{26,-12},{32,-12},{38,-12}}, color={0,127,255}));
    //HeatFlow connections
  connect(cca3[1].heatPortEmb[1], port_emb[1]) annotation (Line(points={{-14,
          83.3333},{-14,92.2857}},      color={191,0,0}));
  connect(cca3[2].heatPortEmb[1], port_emb[2]);
  connect(cca3[3].heatPortEmb[1], port_emb[3]);
  connect(cca3[4].heatPortEmb[1], port_emb[4]);
  connect(cca2[1].heatPortEmb[1], port_emb[5]);
  connect(cca2[2].heatPortEmb[1], port_emb[6]);
  connect(cca2[3].heatPortEmb[1], port_emb[7]);
  connect(cca2[4].heatPortEmb[1], port_emb[8]);
  connect(cca2[5].heatPortEmb[1], port_emb[9]);
  connect(cca2[6].heatPortEmb[1], port_emb[10]);
  connect(cca2[7].heatPortEmb[1], port_emb[11]);
  connect(cca1[1].heatPortEmb[1], port_emb[12]);
  connect(cca1[2].heatPortEmb[1], port_emb[13]);
  connect(cca1[3].heatPortEmb[1], port_emb[14]);
  connect(cca1[4].heatPortEmb[1], port_emb[15]);
  connect(cca1[5].heatPortEmb[1], port_emb[16]);
  connect(cca1[6].heatPortEmb[1], port_emb[17]);
  connect(cca1[7].heatPortEmb[1], port_emb[18]);
  connect(cca1[8].heatPortEmb[1], port_emb[19]);
  connect(cca1[9].heatPortEmb[1], port_emb[20]);
  connect(cca0[1].heatPortEmb[1], port_emb[21]);
  connect(cca0[2].heatPortEmb[1], port_emb[22]);
  connect(cca0[3].heatPortEmb[1], port_emb[23]);
  connect(cca0[4].heatPortEmb[1], port_emb[24]);
  connect(cca0[5].heatPortEmb[1], port_emb[25]);
  connect(cca0[6].heatPortEmb[1], port_emb[26]);
  connect(cca0[7].heatPortEmb[1], port_emb[27]);
  connect(cca0[8].heatPortEmb[1], port_emb[28]);
  connect(cca0[9].heatPortEmb[1], port_emb[29]);
  connect(cca0[10].heatPortEmb[1], port_emb[30]);
  connect(cca0[11].heatPortEmb[1], port_emb[31]);
  connect(cca0[12].heatPortEmb[1], port_emb[32]);
  connect(cca0[13].heatPortEmb[1], port_emb[33]);
  connect(cca0[14].heatPortEmb[1], port_emb[34]);
  connect(cca0[15].heatPortEmb[1], port_emb[35]);
  connect(cca3[1].heatPortEmb[2], port_emb[1]);
  connect(cca3[2].heatPortEmb[2], port_emb[2]);
  connect(cca3[3].heatPortEmb[2], port_emb[3]);
  connect(cca3[4].heatPortEmb[2], port_emb[4]);
  connect(cca2[1].heatPortEmb[2], port_emb[5]);
  connect(cca2[2].heatPortEmb[2], port_emb[6]);
  connect(cca2[3].heatPortEmb[2], port_emb[7]);
  connect(cca2[4].heatPortEmb[2], port_emb[8]);
  connect(cca2[5].heatPortEmb[2], port_emb[9]);
  connect(cca2[6].heatPortEmb[2], port_emb[10]);
  connect(cca2[7].heatPortEmb[2], port_emb[11]);
  connect(cca1[1].heatPortEmb[2], port_emb[12]);
  connect(cca1[2].heatPortEmb[2], port_emb[13]);
  connect(cca1[3].heatPortEmb[2], port_emb[14]);
  connect(cca1[4].heatPortEmb[2], port_emb[15]);
  connect(cca1[5].heatPortEmb[2], port_emb[16]);
  connect(cca1[6].heatPortEmb[2], port_emb[17]);
  connect(cca1[7].heatPortEmb[2], port_emb[18]);
  connect(cca1[8].heatPortEmb[2], port_emb[19]);
  connect(cca1[9].heatPortEmb[2], port_emb[20]);
  connect(cca0[1].heatPortEmb[2], port_emb[21]);
  connect(cca0[2].heatPortEmb[2], port_emb[22]);
  connect(cca0[3].heatPortEmb[2], port_emb[23]);
  connect(cca0[4].heatPortEmb[2], port_emb[24]);
  connect(cca0[5].heatPortEmb[2], port_emb[25]);
  connect(cca0[6].heatPortEmb[2], port_emb[26]);
  connect(cca0[7].heatPortEmb[2], port_emb[27]);
  connect(cca0[8].heatPortEmb[2], port_emb[28]);
  connect(cca0[9].heatPortEmb[2], port_emb[29]);
  connect(cca0[10].heatPortEmb[2], port_emb[30]);
  connect(cca0[11].heatPortEmb[2], port_emb[31]);
  connect(cca0[12].heatPortEmb[2], port_emb[32]);
  connect(cca0[13].heatPortEmb[2], port_emb[33]);
  connect(cca0[14].heatPortEmb[2], port_emb[34]);
  connect(cca0[15].heatPortEmb[2], port_emb[35]);
  connect(cca3[1].heatPortEmb[3], port_emb[1]);
  connect(cca3[2].heatPortEmb[3], port_emb[2]);
  connect(cca3[3].heatPortEmb[3], port_emb[3]);
  connect(cca3[4].heatPortEmb[3], port_emb[4]);
  connect(cca2[1].heatPortEmb[3], port_emb[5]);
  connect(cca2[2].heatPortEmb[3], port_emb[6]);
  connect(cca2[3].heatPortEmb[3], port_emb[7]);
  connect(cca2[4].heatPortEmb[3], port_emb[8]);
  connect(cca2[5].heatPortEmb[3], port_emb[9]);
  connect(cca2[6].heatPortEmb[3], port_emb[10]);
  connect(cca2[7].heatPortEmb[3], port_emb[11]);
  connect(cca1[1].heatPortEmb[3], port_emb[12]);
  connect(cca1[2].heatPortEmb[3], port_emb[13]);
  connect(cca1[3].heatPortEmb[3], port_emb[14]);
  connect(cca1[4].heatPortEmb[3], port_emb[15]);
  connect(cca1[5].heatPortEmb[3], port_emb[16]);
  connect(cca1[6].heatPortEmb[3], port_emb[17]);
  connect(cca1[7].heatPortEmb[3], port_emb[18]);
  connect(cca1[8].heatPortEmb[3], port_emb[19]);
  connect(cca1[9].heatPortEmb[3], port_emb[20]);
  connect(cca0[1].heatPortEmb[3], port_emb[21]);
  connect(cca0[2].heatPortEmb[3], port_emb[22]);
  connect(cca0[3].heatPortEmb[3], port_emb[23]);
  connect(cca0[4].heatPortEmb[3], port_emb[24]);
  connect(cca0[5].heatPortEmb[3], port_emb[25]);
  connect(cca0[6].heatPortEmb[3], port_emb[26]);
  connect(cca0[7].heatPortEmb[3], port_emb[27]);
  connect(cca0[8].heatPortEmb[3], port_emb[28]);
  connect(cca0[9].heatPortEmb[3], port_emb[29]);
  connect(cca0[10].heatPortEmb[3], port_emb[30]);
  connect(cca0[11].heatPortEmb[3], port_emb[31]);
  connect(cca0[12].heatPortEmb[3], port_emb[32]);
  connect(cca0[13].heatPortEmb[3], port_emb[33]);
  connect(cca0[14].heatPortEmb[3], port_emb[34]);
  connect(cca0[15].heatPortEmb[3], port_emb[35]);
  //Fluid connections
  //CCA0
  connect(jun0.port_3, cca0[1].port_a) annotation (Line(points={{-54,-12},{-39,-12},
          {-24,-12}}, color={0,127,255}));
  connect(jun0.port_3, cca0[2].port_a);
  connect(jun0.port_3, cca0[3].port_a);
  connect(jun0.port_3, cca0[4].port_a);
  connect(jun0.port_3, cca0[5].port_a);
  connect(jun0.port_3, cca0[6].port_a);
  connect(jun0.port_3, cca0[7].port_a);
  connect(jun0.port_3, cca0[8].port_a);
  connect(jun0.port_3, cca0[9].port_a);
  connect(jun0.port_3, cca0[10].port_a);
  connect(jun0.port_3, cca0[11].port_a);
  connect(jun0.port_3, cca0[12].port_a);
  connect(jun0.port_3, cca0[13].port_a);
  connect(jun0.port_3, cca0[14].port_a);
  connect(jun0.port_3, cca0[15].port_a);
  connect(cca0[1].port_b, val_cca0.port_a)
    annotation (Line(points={{-4,-12},{3,-12},{10,-12}}, color={0,127,255}));
  connect(cca0[2].port_b, val_cca0.port_a);
  connect(cca0[3].port_b, val_cca0.port_a);
  connect(cca0[4].port_b, val_cca0.port_a);
  connect(cca0[5].port_b, val_cca0.port_a);
  connect(cca0[6].port_b, val_cca0.port_a);
  connect(cca0[7].port_b, val_cca0.port_a);
  connect(cca0[8].port_b, val_cca0.port_a);
  connect(cca0[9].port_b, val_cca0.port_a);
  connect(cca0[10].port_b, val_cca0.port_a);
  connect(cca0[11].port_b, val_cca0.port_a);
  connect(cca0[12].port_b, val_cca0.port_a);
  connect(cca0[13].port_b, val_cca0.port_a);
  connect(cca0[14].port_b, val_cca0.port_a);
  connect(cca0[15].port_b, val_cca0.port_a);
  //CCA1

  connect(jun1.port_3, cca1[1].port_a)
    annotation (Line(points={{-54,18},{-39,18},{-24,18}}, color={0,127,255}));
  connect(jun1.port_3, cca1[2].port_a);
  connect(jun1.port_3, cca1[3].port_a);
  connect(jun1.port_3, cca1[4].port_a);
  connect(jun1.port_3, cca1[5].port_a);
  connect(jun1.port_3, cca1[6].port_a);
  connect(jun1.port_3, cca1[7].port_a);
  connect(jun1.port_3, cca1[8].port_a);
  connect(jun1.port_3, cca1[9].port_a);
  connect(cca1[1].port_b, val_cca1.port_a)
    annotation (Line(points={{-4,18},{10,18}},         color={0,127,255}));
  connect(cca1[2].port_b, val_cca1.port_a);
  connect(cca1[3].port_b, val_cca1.port_a);
  connect(cca1[4].port_b, val_cca1.port_a);
  connect(cca1[5].port_b, val_cca1.port_a);
  connect(cca1[6].port_b, val_cca1.port_a);
  connect(cca1[7].port_b, val_cca1.port_a);
  connect(cca1[8].port_b, val_cca1.port_a);
  connect(cca1[9].port_b, val_cca1.port_a);
  connect(jun2.port_3, cca2[1].port_a)
    annotation (Line(points={{-54,46},{-24,46}},          color={0,127,255}));
  connect(jun2.port_3, cca2[2].port_a);
  connect(jun2.port_3, cca2[3].port_a);
  connect(jun2.port_3, cca2[4].port_a);
  connect(jun2.port_3, cca2[5].port_a);
  connect(jun2.port_3, cca2[6].port_a);
  connect(jun2.port_3, cca2[7].port_a);
  connect(cca2[1].port_b, val_cca2.port_a)
    annotation (Line(points={{-4,46},{3,46},{10,46}}, color={0,127,255}));
  connect(cca2[2].port_b, val_cca2.port_a);
  connect(cca2[3].port_b, val_cca2.port_a);
  connect(cca2[4].port_b, val_cca2.port_a);
  connect(cca2[5].port_b, val_cca2.port_a);
  connect(cca2[6].port_b, val_cca2.port_a);
  connect(cca2[7].port_b, val_cca2.port_a);
  connect(jun2.port_2, cca3[1].port_a) annotation (Line(points={{-60,52},{-60,
          52},{-60,74},{-24,74}},      color={0,127,255}));
  connect(jun2.port_2, cca3[2].port_a);
  connect(jun2.port_2, cca3[3].port_a);
  connect(jun2.port_2, cca3[4].port_a);
  connect(cca3[1].port_b, val_cca3.port_a)
    annotation (Line(points={{-4,74},{4,74},{10,74}}, color={0,127,255}));
  connect(cca3[2].port_b, val_cca3.port_a);
  connect(cca3[3].port_b, val_cca3.port_a);
  connect(cca3[4].port_b, val_cca3.port_a);
  connect(val_cca3.y, signalBus.CCA3_val) annotation (Line(points={{18,83.6},
          {-98,83.6},{-98,-22}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(val_cca2.y, signalBus.CCA2_val) annotation (Line(points={{18,55.6},
          {-98,55.6},{-98,-22}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(val_cca1.y, signalBus.CCA1_val) annotation (Line(points={{18,27.6},
          {-98,27.6},{-98,-22}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(val_cca0.y, signalBus.CCA0_val) annotation (Line(points={{18,-2.4},
          {-98,-2.4},{-98,-22}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(dp_fixed_retCollector_TABS.port_b, val_heat_ret.port_a) annotation (
     Line(points={{70,-110},{70,-112},{70,-114}}, color={0,127,255}));
  connect(val_heat_sup.port_b, TWVTABS.port_1)
    annotation (Line(points={{-60,-114},{-60,-92}}, color={0,127,255}));
  connect(TWVTABS.port_2, jun7.port_1)
    annotation (Line(points={{-60,-76},{-60,-66}}, color={0,127,255}));
  connect(TWVTABS.port_3, dp_fixed_byPass_TABS.port_b) annotation (Line(
        points={{-52,-84},{-26,-84},{2,-84}}, color={0,127,255}));
  connect(jun7.port_2, pump7.port_a) annotation (Line(points={{-60,-54},{-60,
          -54},{-60,-50}}, color={0,127,255}));
  connect(dp_fixed_retCollector_TABS.port_a, jun6.port_2)
    annotation (Line(points={{70,-98},{70,-90}}, color={0,127,255}));
  connect(jun6.port_1, jun.port_2)
    annotation (Line(points={{70,-78},{70,-56}}, color={0,127,255}));
  connect(jun.port_1, t25.port_b) annotation (Line(points={{70,-44},{70,-44},
          {70,-36}}, color={0,127,255}));
  connect(dp_fixed_byPass_TABS.port_a, jun6.port_3) annotation (Line(points={
          {18,-84},{18,-84},{64,-84}}, color={0,127,255}));
  connect(pump7.P, P_pump) annotation (Line(points={{-67.2,-35.3},{-67.2,-32},
          {-84,-32},{-84,-50},{-110,-50}}, color={0,0,127}));
  connect(pump7.stage, signalBus.P07_signal) annotation (Line(points={{-69.6,
          -43},{-84.8,-43},{-84.8,-22},{-98,-22}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},
            {120,100}}),                                        graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),                                       Text(
          extent={{-70,76},{70,-64}},
          lineColor={28,108,200},
          textString="TABS")}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={
            {-100,-140},{120,100}})));
end TABS;
