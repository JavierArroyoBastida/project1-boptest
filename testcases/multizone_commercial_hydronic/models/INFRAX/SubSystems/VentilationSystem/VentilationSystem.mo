within INFRAX.SubSystems.VentilationSystem;
model VentilationSystem "detailed ventilation system for testing"

  IDEAS.Fluid.Sources.Boundary_pT bouAmb(
    use_T_in=true,
    nPorts=2,
    use_X_in=false,
    redeclare package Medium = MediumAir,
    use_Xi_in=MediumAir.nXi > 0,
    use_C_in=MediumAir.nC > 0)
              "ambient boundary"
    annotation (Placement(transformation(extent={{-160,-20},{-140,0}})));
  outer IDEAS.BoundaryConditions.SimInfoManager sim
    annotation (Placement(transformation(extent={{-200,80},{-180,100}})));
  INFRAX.Data.Parameters.Hydronic hydronic
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));

  final parameter Real s_co2[max(MediumAir.nC,1)] = {if Modelica.Utilities.Strings.isEqual(string1=if MediumAir.nC>0 then MediumAir.extraPropertiesNames[i] else "",
                                             string2="CO2",
                                             caseSensitive=false)
                                             then 1 else 0 for i in 1:max(MediumAir.nC,1)};

  replaceable IDEAS.Fluid.Interfaces.PartialTwoPortInterface[7] dp_ducts_supply "pressure drops in supply ducts"
    annotation (Placement(transformation(extent={{32,-56},{52,-36}})));
IDEAS.Fluid.Movers.FlowControlled_dp supplyFan(
      allowFlowReversal=false,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        addPowerToMedium=false,
        use_inputFilter=false,
        tau=60,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        m_flow_nominal=10000*1.225/3600,
        dp_nominal(displayUnit="Pa") = 180,
        redeclare INFRAX.Data.Parameters.INFRAX_AHU_Fans per,
        dp_start=180,
        redeclare package Medium = MediumAir,
        prescribeSystemPressure=true)
    "supply fan of the air handling unit"
    annotation (Placement(transformation(extent={{-36,-56},{-16,-36}})));
IDEAS.Fluid.Movers.FlowControlled_dp exhaustFan(
      allowFlowReversal=false,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        addPowerToMedium=false,
        tau=10,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=false,
        m_flow_nominal=8850*1.225/3600,
        redeclare INFRAX.Data.Parameters.INFRAX_AHU_Fans per,
        dp_nominal=150,
        constantHead=150,
        dp_start=150,
        redeclare package Medium = MediumAir,
        prescribeSystemPressure=true)
    annotation (Placement(transformation(extent={{-44,8},{-64,28}})));



  IDEAS.Fluid.Sensors.TemperatureTwoPort tAHUSupply(
    m_flow_nominal=10000*1.225/3600,
    allowFlowReversal=false,
    redeclare package Medium = MediumAir,
    tau=60)         annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={6,-46})));
  INFRAX.Data.Parameters.Air air
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  replaceable IDEAS.Fluid.Interfaces.PartialTwoPortInterface[15] vav_supply
    "vav supply ducts" annotation (Placement(transformation(
        extent={{-8.5,-8.5},{8.5,8.5}},
        rotation=0,
        origin={42.5,-79.5})));
  replaceable
  IDEAS.Fluid.HeatExchangers.BaseClasses.PartialEffectiveness[21] counterFlowHEX
    constrainedby IDEAS.Fluid.Interfaces.PartialFourPortInterface
    annotation (Placement(transformation(extent={{150,4},{128,-18}})));
IDEAS.Fluid.Movers.FlowControlled_dp pump6(
        tau=30,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=false,
        allowFlowReversal=false,
        addPowerToMedium=false,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        inputType=IDEAS.Fluid.Types.InputType.Stages,
        m_flow_nominal=hydronic.p06_m_flow,
        redeclare
          IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos40slash1to12CANPN6slash10 per,
        each dp_nominal(displayUnit="Pa") = 7.2*9804.139432,
        dp_start=0,
        redeclare package Medium = MediumWater)
                    "HeaCoi pump" annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={160,-72})));
  IDEAS.Fluid.Actuators.Valves.ThreeWayEqualPercentageLinear[21] TWVHeaCoi(
    each massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    each tau=200,
    each CvData=IDEAS.Fluid.Types.CvTypes.Kv,
    each portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    each portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    each portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    each riseTime=150,
    each y_start=0,
    each use_inputFilter=false,
    Kv=air.Kv,
    m_flow_nominal=air.m_nominal_water,
    R=air.R,
    redeclare package Medium = MediumWater,
    each fraK=1,
    from_dp=true,
    dpFixed_nominal=transpose(cat(
        1,
        {air.dp_water},
        {zeros(21)})),
    each energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                                      annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=90,
        origin={120,-32})));
  IDEAS.Fluid.FixedResistances.Junction[21] jun(
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    each m_flow_nominal={1,1,1},
    each dp_nominal={0,0,0},
    redeclare package Medium = MediumWater,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving)
    annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=-90,
        origin={160,-32})));
  IDEAS.Fluid.FixedResistances.PressureDrop[21] dp_HeaCoi_supply(
    allowFlowReversal=false,
    m_flow_nominal=air.m_nominal_water,
    redeclare package Medium = MediumWater,
    from_dp=true,
    dp_nominal=(air.dp_fixed_return + air.dp_fixed_supply))
    "pressure loses in pipe to heating coil"
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={160,-52})));
  replaceable IDEAS.Fluid.Interfaces.PartialTwoPortInterface[10] dp_ducts_extract
   "pressure drops in extract ducts"
    annotation (Placement(transformation(extent={{32,10},{12,30}})));
  replaceable IDEAS.Fluid.Interfaces.PartialTwoPortInterface[14] vav_extract
    "vav supply ducts" annotation (Placement(transformation(
        extent={{8.5,-8.5},{-8.5,8.5}},
        rotation=0,
        origin={22.5,52.5})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort tAHUExtract(
    m_flow_nominal=8850*1.225/3600,
    allowFlowReversal=false,
    redeclare package Medium = MediumAir,
    tau=60)         annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-28,20})));
  replaceable Components.AHU_baseline
                             aHU(
    dpAirCooCoi_nominal=0,
    dpAirHeaCoi_nominal=0,
    dpWatCooCoi_nominal(displayUnit="kPa") = 27100,
    dpWatHeaCoi_nominal(displayUnit="kPa") = 31600,
    redeclare package MediumHeaCoi = MediumGlycol,
    redeclare package MediumCooCoi = MediumWater,
    tau=60,
    tauWater=60,
    tauAir=60,
    tauSensor=60,
    QCooCoi_nominal=-59300,
    TCooCoiWatSup_nominal=285.15,
    TCooCoiWatRet_nominal=288.15,
    TCooCoiAirSup_nominal=299.65,
    TCooCoiAirRet_nominal=287.35,
    THeaCoiWatSup_nominal=305.15,
    THeaCoiWatRet_nominal=301.15,
    THeaCoiAirSup_nominal=265.15,
    THeaCoiAirRet_nominal=274.85)
  constrainedby
    INFRAX.SubSystems.VentilationSystem.Components.Dependencies.PartialAHU(
    mFlowAirSup_nominal=10000*1.225/3600,
    mFlowAirRet_nominal=8850*1.225/3600,
    mFlowWatHeaCoi_nominal=hydronic.p09_m_flow,
    mFlowWatCooCoi_nominal=hydronic.p13_m_flow,
    QHeaCoi_nominal=34000,
    epsRecovery=(0.693 + 0.716)/2,
    QCooCoi_nominal=-59300,
    dpAirRetTW_nominal=0,
    dpWatCooCoi_nominal(displayUnit="kPa") = 27100,
    dpAirCooCoi_nominal=0,
    dpWatHeaCoi_nominal(displayUnit="kPa") = 31600,
    dpAirHeaCoi_nominal=0,
    dpAirSupTW_nominal=0,
    tauWater=600,
    redeclare package MediumAir = MediumAir,
    redeclare package MediumCooCoi = MediumWater,
    redeclare package MediumHeaCoi = MediumGlycol,
    TCooCoiWatSup_nominal=285.15,
    TCooCoiWatRet_nominal=288.15,
    TCooCoiAirSup_nominal=299.65,
    TCooCoiAirRet_nominal=287.35,
    THeaCoiWatSup_nominal=305.15,
    THeaCoiWatRet_nominal=301.15,
    THeaCoiAirSup_nominal=265.15,
    THeaCoiAirRet_nominal=274.85)
    annotation (Placement(transformation(extent={{-84,-24},{-122,14}})));
  IDEAS.Fluid.Movers.FlowControlled_dp pump9(
        tau=30,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=false,
        allowFlowReversal=false,
        addPowerToMedium=false,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        m_flow_nominal=hydronic.p09_m_flow,
        redeclare
          IDEAS.Fluid.Movers.Data.Pumps.Wilo.VeroLine32slash160dash1comma1slash2
          per,
        each dp_nominal(displayUnit="kPa") = 14*9804.139432,
        inputType=IDEAS.Fluid.Types.InputType.Stages,
        redeclare package Medium = MediumGlycol)
                    "HeaCoi pump" annotation (Placement(transformation(
        extent={{6.5,-7.5},{-6.5,7.5}},
        rotation=0,
        origin={-160.5,-38.5})));
   IDEAS.Fluid.Movers.FlowControlled_dp pump13(
        tau=30,
        energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        use_inputFilter=false,
        allowFlowReversal=false,
        addPowerToMedium=false,
        massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
        m_flow_nominal=hydronic.p13_m_flow,
        redeclare
          IDEAS.Fluid.Movers.Data.Pumps.Wilo.VeroLine40slash120dash1comma5slash2
          per,
        redeclare package Medium = MediumWater,
        inputType=IDEAS.Fluid.Types.InputType.Continuous,
        each dp_nominal(displayUnit="kPa") = 40000,
        T_start=284.15)                                             "CooCoi pump" annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=90,
        origin={-80,-61})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t15(
                           m_flow_nominal=hydronic.p13_m_flow,
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    redeclare package Medium = MediumWater)                    annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-152,-96})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t16(
                           m_flow_nominal=hydronic.p13_m_flow,
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    redeclare package Medium = MediumWater)                    annotation (
      Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-170,-76})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t23(
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p09_m_flow,
    redeclare package Medium = MediumGlycol)
                                        annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-126,-38})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t22(
    tau=hydronic.sensorTau,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p09_m_flow,
    redeclare package Medium = MediumGlycol)
                                        annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-124,-60})));
  IDEAS.Fluid.Actuators.Valves.ThreeWayEqualPercentageLinear TWV_AHU_CooCoi(
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    tau=200,
    CvData=IDEAS.Fluid.Types.CvTypes.Kv,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    riseTime=150,
    y_start=0,
    use_inputFilter=false,
    Kv=31.5,
    R=100,
    m_flow_nominal=hydronic.p13_m_flow,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumWater,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
                                        "3way valve of cooling coiil of ahu"
                                               annotation (Placement(
        transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-94,-40})));
  IDEAS.Fluid.FixedResistances.Junction jun1(
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    each m_flow_nominal={1,1,1},
    each dp_nominal={0,0,0},
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumWater)
    annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={-80,-40})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_AHU_CooCoi(
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p13_m_flow,
    dp_nominal(displayUnit="kPa") = 0,
    redeclare package Medium = MediumWater)       "equilibrium valve"
    annotation (Placement(transformation(
        extent={{-8,-6},{8,6}},
        rotation=180,
        origin={-144,-76})));
  IDEAS.Fluid.Actuators.Valves.ThreeWayEqualPercentageLinear TWV_AHU_HeaCoi(
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    tau=200,
    CvData=IDEAS.Fluid.Types.CvTypes.Kv,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    riseTime=150,
    y_start=0,
    use_inputFilter=false,
    m_flow_nominal=hydronic.p09_m_flow,
    R=100,
    Kv=12.5,
    redeclare package Medium = MediumGlycol,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
             "3way valve of heating coiil of ahu" annotation (Placement(
        transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={-142,-38})));
  IDEAS.Fluid.FixedResistances.Junction jun2(
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    each m_flow_nominal={1,1,1},
    each dp_nominal={0,0,0},
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-142,-60})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_AHU_HeaCoi(
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p09_m_flow,
    dp_nominal(displayUnit="kPa") = 0,
    redeclare package Medium = MediumGlycol)      "equilibrium valve"
    annotation (Placement(transformation(
        extent={{8,-6},{-8,6}},
        rotation=180,
        origin={-166,-60})));
  Modelica.Fluid.Interfaces.FluidPort_b AHUHeaCoi_b(redeclare package Medium =
        MediumGlycol)      "return from AHU heating coil"
    annotation (Placement(transformation(extent={{-210,-50},{-190,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_a AHUHeaCoi_a(redeclare package Medium =
        MediumGlycol)      "supply to AHU heating coil"
    annotation (Placement(transformation(extent={{-210,-70},{-190,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b AHUCooCoi_b(redeclare package Medium =
        IDEAS.Media.Water) "return from AHU cooling coil"
    annotation (Placement(transformation(extent={{-210,-86},{-190,-66}})));
  Modelica.Fluid.Interfaces.FluidPort_a AHUCooCoi_a(redeclare package Medium =
        IDEAS.Media.Water) "supply to AHU cooling coil"
    annotation (Placement(transformation(extent={{-210,-106},{-190,-86}})));
  Modelica.Fluid.Interfaces.FluidPort_b HeaCoi_b(redeclare package Medium =
        MediumWater)       "return from the VAV/ducts coils"
    annotation (Placement(transformation(extent={{110,-110},{130,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a HeaCoi_a(redeclare package Medium =
        MediumWater)       "supply to VAV/ducts coils"
    annotation (Placement(transformation(extent={{150,-110},{170,-90}})));
  Controllers.SignalBus signalBus annotation (Placement(transformation(extent={
            {-214,20},{-186,48}}), iconTransformation(extent={{-210,-30},{-190,
            -10}})));
  Controllers.DataBus dataBus annotation (Placement(transformation(extent={{-214,
            44},{-184,72}}), iconTransformation(extent={{-210,4},{-190,24}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort[21] tAirSupply(
    m_flow_nominal=10000*1.225/3600,
    allowFlowReversal=false,
    redeclare package Medium = MediumAir,
    tau=60)  annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={160,0})));
  Modelica.Fluid.Interfaces.FluidPort_b[21] airSupply(redeclare package Medium =
        MediumAir)       "air supply"
    annotation (Placement(transformation(extent={{146,90},{166,110}})));
  Modelica.Fluid.Interfaces.FluidPort_a[21] airReturn(redeclare package Medium =
        MediumAir)       "air return"
    annotation (Placement(transformation(extent={{106,90},{126,110}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=supplyFan.P +
        exhaustFan.P + pump6.P + pump9.P + pump13.P)
    annotation (Placement(transformation(extent={{-98,64},{-118,84}})));
  Modelica.Blocks.Interfaces.RealOutput total_P
    annotation (Placement(transformation(extent={{-200,66},{-220,86}})));
  replaceable package MediumWater = IDEAS.Media.Water constrainedby
    Modelica.Media.Interfaces.PartialMedium;
   replaceable package MediumGlycol =
       IDEAS.Media.Antifreeze.Validation.BaseClasses.PropyleneGlycolWater (
           property_T=273.15,
           X_a=0.30) constrainedby Modelica.Media.Interfaces.PartialMedium;
//     replaceable package MediumGlycol = IDEAS.Media.Water;
  replaceable package MediumAir = IDEAS.Media.Air(extraPropertiesNames={"CO2"}) constrainedby
    Modelica.Media.Interfaces.PartialMedium;
  IDEAS.Fluid.Sensors.RelativePressure senRelPRet(redeclare package Medium =
        MediumAir)
    annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
  IDEAS.Fluid.Sensors.RelativePressure senRelPreSup(redeclare package Medium =
        MediumAir)
    annotation (Placement(transformation(extent={{-24,-22},{-44,-2}})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_server(
    allowFlowReversal=false,
    redeclare package Medium = MediumAir,
    m_flow_nominal=air.m_nominal_supply_duct[2],
    dp_nominal=0,
    linearized=true)
                  "pressure loses in pipe to heating coil" annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={68,18})));
protected
  IDEAS.Buildings.Components.Interfaces.WeaBus weaBus1(numSolBus=sim.numIncAndAziInBus,
      outputAngles=sim.outputAngles)
    annotation (Placement(transformation(extent={{-178,84},{-158,104}})));
  Modelica.Blocks.Sources.RealExpression CEnv[max(MediumAir.nC,1)](y=sim.CEnv.y*
        s_co2)
    annotation (Placement(transformation(extent={{-198,-26},{-180,-10}})));
equation
  connect(supplyFan.port_b, tAHUSupply.port_a)
    annotation (Line(points={{-16,-46},{-16,-46},{0,-46}}, color={0,127,255}));
  for i in 1:7 loop
    connect(tAHUSupply.port_b, dp_ducts_supply[i].port_a)
    annotation (Line(points={{12,-46},{32,-46}}, color={0,127,255}));
  end for;
  for i in 1:15 loop
    connect(tAHUSupply.port_b, vav_supply[i].port_a) annotation (Line(points={{12,
          -46},{12,-79.5},{34,-79.5}}, color={0,127,255}));
  end for;
  //flr3
  connect(vav_supply[1].port_b, counterFlowHEX[1].port_a2) annotation (Line(
        points={{51,-79.5},{88,-79.5},{88,0},{128,0},{128,-0.4}}, color={0,127,
          255}));
  connect(vav_supply[2].port_b, counterFlowHEX[2].port_a2);
  connect(dp_ducts_supply[1].port_b, counterFlowHEX[4].port_a2) annotation (
      Line(points={{52,-46},{88,-46},{88,-0.4},{128,-0.4}}, color={0,127,255}));
                                                                        //MT
  connect(vav_supply[3].port_b, counterFlowHEX[3].port_a2);
  //flr2
  connect(vav_supply[4].port_b, counterFlowHEX[5].port_a2);
  connect(vav_supply[5].port_b, counterFlowHEX[6].port_a2);
  connect(vav_supply[6].port_b, counterFlowHEX[7].port_a2);
  connect(vav_supply[7].port_b, counterFlowHEX[8].port_a2);
  //flr1
  connect(vav_supply[8].port_b, counterFlowHEX[9].port_a2);
  connect(vav_supply[9].port_b, counterFlowHEX[10].port_a2);
  connect(vav_supply[10].port_b, counterFlowHEX[11].port_a2);
  connect(vav_supply[11].port_b, counterFlowHEX[12].port_a2);
  connect(vav_supply[12].port_b, counterFlowHEX[13].port_a2);
  //flr0
  connect(dp_ducts_supply[5].port_b, counterFlowHEX[14].port_a2);
  connect(dp_ducts_supply[3].port_b, counterFlowHEX[15].port_a2);
  connect(vav_supply[13].port_b, counterFlowHEX[16].port_a2);
  connect(vav_supply[14].port_b, counterFlowHEX[17].port_a2);
  connect(vav_supply[15].port_b, counterFlowHEX[18].port_a2);
  connect(dp_ducts_supply[4].port_b, counterFlowHEX[19].port_a2);
  connect(dp_ducts_supply[6].port_b, counterFlowHEX[20].port_a2);
  connect(dp_ducts_supply[7].port_b, counterFlowHEX[21].port_a2);


  connect(pump6.port_b, dp_HeaCoi_supply[2].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[3].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[4].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[5].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[6].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[7].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[8].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[9].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[10].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[11].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[12].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[13].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[14].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[15].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[16].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[17].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[18].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[19].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[20].port_a);
  connect(pump6.port_b, dp_HeaCoi_supply[21].port_a);
  connect(counterFlowHEX.port_b1, TWVHeaCoi.port_1) annotation (Line(points={{
          128,-13.6},{120,-13.6},{120,-24}}, color={0,127,255}));
  connect(jun.port_2, counterFlowHEX.port_a1) annotation (Line(points={{160,-24},
          {160,-13.6},{150,-13.6}}, color={0,127,255}));
  connect(TWVHeaCoi.port_3, jun.port_3) annotation (Line(points={{128,-32},{152,
          -32}},           color={0,127,255}));
  for i in 1:21 loop
    connect(TWVHeaCoi[i].port_2, HeaCoi_b)
    annotation (Line(points={{120,-40},{120,-100}},color={0,127,255}));
  end for;
  connect(dp_HeaCoi_supply.port_b, jun.port_1) annotation (Line(points={{160,-44},
          {160,-40}},           color={0,127,255}));
  connect(pump6.port_b, dp_HeaCoi_supply[1].port_a) annotation (Line(points={{160,-64},
          {160,-60}},                color={0,127,255}));


  connect(tAHUExtract.port_b, exhaustFan.port_a)
    annotation (Line(points={{-34,20},{-40,20},{-40,18},{-44,18}},
                                                          color={0,127,255}));

  //Extraction
  connect(tAHUExtract.port_a, dp_ducts_extract[1].port_b)
    annotation (Line(points={{-22,20},{-14,20},{12,20}},  color={0,127,255}));
  connect(tAHUExtract.port_a, dp_ducts_extract[2].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[3].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[4].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[5].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[6].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[7].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[8].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[9].port_b);
  connect(tAHUExtract.port_a, dp_ducts_extract[10].port_b);
  connect(vav_extract[1].port_b, tAHUExtract.port_a) annotation (Line(points={{14,52.5},
          {-10,52.5},{-10,20},{-22,20}},       color={0,127,255}));
  connect(vav_extract[2].port_b, tAHUExtract.port_a);
  connect(vav_extract[3].port_b, tAHUExtract.port_a);
  connect(vav_extract[4].port_b, tAHUExtract.port_a);
  connect(vav_extract[5].port_b, tAHUExtract.port_a);
  connect(vav_extract[6].port_b, tAHUExtract.port_a);
  connect(vav_extract[7].port_b, tAHUExtract.port_a);
  connect(vav_extract[8].port_b, tAHUExtract.port_a);
  connect(vav_extract[9].port_b, tAHUExtract.port_a);
  connect(vav_extract[10].port_b, tAHUExtract.port_a);
  connect(vav_extract[11].port_b, tAHUExtract.port_a);
  connect(vav_extract[12].port_b, tAHUExtract.port_a);
  connect(vav_extract[13].port_b, tAHUExtract.port_a);
  connect(vav_extract[14].port_b, tAHUExtract.port_a);
  connect(tAHUSupply.T, aHU.TSupply) annotation (Line(points={{6,-39.4},{6,58},
          {-114,58},{-114,14},{-113.64,14},{-113.64,12.1}},color={0,0,127},
      visible=false));
  connect(exhaustFan.port_b, aHU.port_a1) annotation (Line(points={{-64,18},{
          -74,18},{-74,6.4},{-84,6.4}},
                                    color={0,127,255}));
  connect(aHU.port_b1, bouAmb.ports[1]) annotation (Line(points={{-122,6.4},{-140,
          6.4},{-140,-8}}, color={0,127,255}));
  connect(bouAmb.ports[2], aHU.port_a2) annotation (Line(points={{-140,-12},{-140,
          -16.4},{-122,-16.4}}, color={0,127,255}));
  connect(aHU.port_b2, supplyFan.port_a) annotation (Line(points={{-84,-16.4},{-74,
          -16.4},{-74,-46},{-36,-46}}, color={0,127,255}));

  connect(t15.port_b, pump13.port_a) annotation (Line(points={{-146,-96},{-120,
          -96},{-80,-96},{-80,-68}}, color={0,127,255}));
  connect(t23.port_a, aHU.portHeaCoi_b1) annotation (Line(points={{-120,-38},{-120,
          -38},{-120,-24},{-118.2,-24}}, color={0,127,255}));
  connect(t22.port_b, aHU.portHeaCoi_a1) annotation (Line(points={{-118,-60},{
          -110,-60},{-110,-24},{-110.6,-24}}, color={0,127,255}));
  connect(TWV_AHU_CooCoi.port_1, aHU.portCooCoi_b1) annotation (Line(points={{-94,
          -34},{-95.4,-34},{-95.4,-24}}, color={0,127,255}));
  connect(TWV_AHU_CooCoi.port_3, jun1.port_3)
    annotation (Line(points={{-88,-40},{-86,-40}}, color={0,127,255}));
  connect(pump13.port_b, jun1.port_1) annotation (Line(points={{-80,-54},{-80,-50},
          {-80,-46}}, color={0,127,255}));
  connect(jun1.port_2, aHU.portCooCoi_a1) annotation (Line(points={{-80,-34},{
          -80,-28},{-87.8,-28},{-87.8,-24}}, color={0,127,255}));
  connect(t16.port_a, dp_fixed_AHU_CooCoi.port_b) annotation (Line(points={{
          -164,-76},{-158,-76},{-152,-76}}, color={0,127,255}));
  connect(dp_fixed_AHU_CooCoi.port_a, TWV_AHU_CooCoi.port_2) annotation (Line(
        points={{-136,-76},{-94,-76},{-94,-46}}, color={0,127,255}));
  connect(t23.port_b, TWV_AHU_HeaCoi.port_1) annotation (Line(points={{-132,-38},
          {-134,-38},{-136,-38}}, color={0,127,255}));
  connect(TWV_AHU_HeaCoi.port_2, pump9.port_a) annotation (Line(points={{-148,-38},
          {-154,-38},{-154,-38.5}}, color={0,127,255}));
  connect(t22.port_a, jun2.port_2) annotation (Line(points={{-130,-60},{-133,
          -60},{-136,-60}}, color={0,127,255}));
  connect(dp_fixed_AHU_HeaCoi.port_b, jun2.port_1) annotation (Line(points={{
          -158,-60},{-153,-60},{-148,-60}}, color={0,127,255}));
  connect(TWV_AHU_HeaCoi.port_3, jun2.port_3) annotation (Line(points={{-142,
          -44},{-142,-49},{-142,-54}}, color={0,127,255}));
  connect(t15.port_a, AHUCooCoi_a) annotation (Line(points={{-158,-96},{-200,
          -96}},       color={0,127,255}));
  connect(t16.port_b, AHUCooCoi_b) annotation (Line(points={{-176,-76},{-200,
          -76}},       color={0,127,255}));
  connect(dp_fixed_AHU_HeaCoi.port_a, AHUHeaCoi_a) annotation (Line(points={{-174,
          -60},{-200,-60}},            color={0,127,255}));
  connect(pump9.port_b, AHUHeaCoi_b) annotation (Line(points={{-167,-38.5},{-183.5,
          -38.5},{-183.5,-40},{-200,-40}}, color={0,127,255}));
  connect(pump6.port_a, HeaCoi_a) annotation (Line(points={{160,-80},{160,-100}},
                       color={0,127,255}));
  connect(tAHUSupply.T, dataBus.TAirSupplyAHU) annotation (Line(points={{6,
          -39.4},{6,-39.4},{6,58},{6,58.07},{-198.925,58.07}}, color={0,0,127},
      visible=false),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(pump9.stage, signalBus.P09_signal) annotation (Line(
      points={{-160.5,-29.5},{-160.5,34},{-200,34}},
      color={255,127,0},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(pump13.dp_in, signalBus.P13_signal) annotation (Line(
      points={{-89.6,-61},{-200,-61},{-200,34}},
      color={255,127,0},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(AHUHeaCoi_a, AHUHeaCoi_a) annotation (Line(points={{-200,-60},{-194,
          -60},{-194,-60},{-200,-60}}, color={0,127,255}));
  connect(TWV_AHU_HeaCoi.y, signalBus.HeaCoi_3way_signal) annotation (Line(
        points={{-142,-30.8},{-140,-30.8},{-140,28},{-140,34},{-200,34}},
        color={0,0,127},
      visible=false),     Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(tAHUExtract.T, dataBus.TAirExtractAHU) annotation (Line(points={{-28,
          26.6},{-28,58.07},{-198.925,58.07}}, color={0,0,127},
      visible=false),                                            Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(counterFlowHEX.port_b2, tAirSupply.port_a) annotation (Line(points={{
          150,-0.4},{151,-0.4},{151,0},{154,0}}, color={0,127,255}));
  connect(tAirSupply.T, dataBus.TAirSupplyVAV) annotation (Line(points={{160,6.6},
          {160,58},{-20,58},{-20,58.07},{-198.925,58.07}}, color={0,0,127},
      visible=false),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(pump6.stage, signalBus.P06_signal) annotation (Line(points={{150.4,-72},
          {150.4,34},{-200,34}},          color={255,127,0},
      visible=false),                                         Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(TWV_AHU_CooCoi.y, signalBus.CooCoi_3way_signal) annotation (Line(
        points={{-101.2,-40},{-146,-40},{-146,-42},{-200,-42},{-200,34}},
        color={0,0,127},
      visible=false),     Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TWVHeaCoi.y, signalBus.Heacoils_signal) annotation (Line(points={{110.4,
          -32},{84,-32},{84,34.07},{-199.93,34.07}},       color={0,0,127},
      visible=false),
      Text(
     string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  //flr3
  connect(tAirSupply[1].port_b, airSupply[1]) annotation (Line(points={{166,0},
          {176,0},{176,78},{156,78},{156,90.4762}},color={0,127,255}));
  connect(tAirSupply[2].port_b, airSupply[2]);
  connect(tAirSupply[3].port_b, airSupply[3]);
  connect(tAirSupply[4].port_b, airSupply[4]);
  //flr2
  connect(tAirSupply[5].port_b, airSupply[5]);
  connect(tAirSupply[6].port_b, airSupply[6]);
  connect(tAirSupply[7].port_b, airSupply[7]);
  connect(tAirSupply[8].port_b, airSupply[8]);
  //flr1
  connect(tAirSupply[9].port_b, airSupply[9]);
  connect(tAirSupply[10].port_b, airSupply[10]);
  connect(tAirSupply[11].port_b, airSupply[11]);
  connect(tAirSupply[12].port_b, airSupply[12]);
  connect(tAirSupply[13].port_b, airSupply[13]);
  //flr0                                                                             //server room
  connect(tAirSupply[14].port_b, airSupply[19]); //balie
  connect(tAirSupply[15].port_b, airSupply[15]); //ehbo
  connect(tAirSupply[16].port_b, airSupply[16]); //refter vav
  connect(tAirSupply[17].port_b, airSupply[17]); // meeting1 vav
  connect(tAirSupply[18].port_b, airSupply[18]); // meeting2 vav
  connect(tAirSupply[19].port_b, airSupply[19]); //sas
  connect(tAirSupply[20].port_b, airSupply[20]);
  connect(tAirSupply[21].port_b, airSupply[21]);


  //flr3
  connect(airReturn[1], vav_extract[1].port_a) annotation (Line(points={{116,
          90.4762},{116,90.4762},{116,56},{31,56},{31,52.5}},
                                                     color={0,127,255}));
  connect(airReturn[2], vav_extract[2].port_a);
  connect(airReturn[3], vav_extract[3].port_a);
  //flr2
  connect(airReturn[5], vav_extract[4].port_a);
  connect(airReturn[6], vav_extract[5].port_a);
  connect(airReturn[7], vav_extract[6].port_a);
  connect(airReturn[8], vav_extract[7].port_a);
  //flr1
  connect(airReturn[9], vav_extract[8].port_a);
  connect(airReturn[11], vav_extract[9].port_a);
  connect(airReturn[12], vav_extract[10].port_a);
  connect(airReturn[13], vav_extract[11].port_a);
  //flr0
  connect(airReturn[16], vav_extract[12].port_a);
  connect(airReturn[17], vav_extract[13].port_a);
  connect(airReturn[18], vav_extract[14].port_a);

  connect(airReturn[3], dp_ducts_extract[1].port_a) annotation (Line(points={{116,
          92.381},{116,92.381},{116,56},{40,56},{40,20},{32,20}},
        color={0,127,255}));
  connect(airReturn[2], dp_ducts_extract[2].port_a);
  connect(airReturn[4], dp_ducts_extract[3].port_a);
  connect(airReturn[14], dp_ducts_extract[4].port_a);
  connect(airReturn[15], dp_ducts_extract[5].port_a);
  connect(airReturn[10], dp_ducts_extract[6].port_a); //storage room
  connect(airReturn[19], dp_ducts_extract[7].port_a);
  connect(airReturn[19], dp_ducts_extract[8].port_a);
  connect(airReturn[20], dp_ducts_extract[9].port_a);
  connect(airReturn[21], dp_ducts_extract[10].port_a);

  connect(exhaustFan.dp_in, signalBus.AHUextract) annotation (Line(
      points={{-54,30},{-54,34},{-200,34}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(supplyFan.dp_in, signalBus.AHUsupply) annotation (Line(
      points={{-26,-34},{-26,-34},{-26,34},{-200,34}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(realExpression2.y, total_P)
    annotation (Line(points={{-119,74},{-210,74},{-210,76}}, color={0,0,127}));
  if MediumAir.nXi>0 then
    connect(bouAmb.Xi_in[1], weaBus1.X_wEnv) annotation (Line(points={{-162,-14},{
          -167.95,-14},{-167.95,94.05}}, color={0,0,127}));
  end if;
  connect(signalBus, aHU.signalBus) annotation (Line(
      points={{-200,34},{-134,34},{-134,-8.8},{-65,-8.8}},
      color={255,204,51},
      thickness=0.5));
  connect(sim.weaBus, weaBus1) annotation (Line(
      points={{-181,93},{-176,93},{-176,94},{-168,94}},
      color={255,204,51},
      thickness=0.5));
  connect(bouAmb.T_in, weaBus1.Te) annotation (Line(points={{-162,-6},{-167.95,-6},
          {-167.95,94.05}}, color={0,0,127}));
  if MediumAir.nC>0 then
  end if;
  connect(senRelPRet.port_a, aHU.port_b1) annotation (Line(points={{-56,52},{
          -122,52},{-122,6.4}}, color={0,127,255}));
  connect(exhaustFan.port_a,senRelPRet. port_b) annotation (Line(points={{-44,
          18},{-42,18},{-42,38},{-36,38},{-36,52}}, color={0,127,255}));
  connect(senRelPreSup.port_b, aHU.port_a2) annotation (Line(points={{-44,-12},
          {-54,-12},{-54,-32},{-122,-32},{-122,-16.4}}, color={0,127,255}));
  connect(senRelPreSup.port_a, supplyFan.port_b) annotation (Line(points={{-24,
          -12},{-16,-12},{-16,-46}}, color={0,127,255}));
  connect(senRelPRet.p_rel, exhaustFan.dpMea)
    annotation (Line(points={{-46,43},{-46,30}}, color={0,0,127}));
  connect(senRelPreSup.p_rel, supplyFan.dpMea)
    annotation (Line(points={{-34,-21},{-34,-34}}, color={0,0,127}));
  connect(CEnv.y, bouAmb.C_in)
    annotation (Line(points={{-179.1,-18},{-162,-18}}, color={0,0,127}));
  connect(dp_server.port_b, airSupply[14]) annotation (Line(points={{68,26},{68,
          42},{156,42},{156,102.857}}, color={0,127,255}));
  connect(dp_server.port_a, dp_ducts_supply[2].port_b)
    annotation (Line(points={{68,10},{68,-46},{52,-46}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(extent={{-200,-100},{180,100}})), Icon(
        coordinateSystem(extent={{-200,-100},{180,100}})));
end VentilationSystem;
