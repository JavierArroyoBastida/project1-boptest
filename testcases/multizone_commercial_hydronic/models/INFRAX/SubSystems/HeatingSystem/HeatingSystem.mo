within INFRAX.SubSystems.HeatingSystem;
model HeatingSystem "detailed heating system for simulation with TACO"

   replaceable package MediumGlycol =
       IDEAS.Media.Antifreeze.Validation.BaseClasses.PropyleneGlycolWater (
           property_T=273.15,
           X_a=0.30) constrainedby Modelica.Media.Interfaces.PartialMedium;
//     replaceable package MediumGlycol = IDEAS.Media.Water;

  IDEAS.Fluid.Movers.SpeedControlled_y pump1(
    allowFlowReversal=false,
    addPowerToMedium=false,
    redeclare IDEAS.Fluid.Movers.Data.Pumps.Wilo.VeroLine50slash150dash4slash2
      per,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    y_start=0,
    tau=60,
    riseTime=120,
    use_inputFilter=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = MediumGlycol,
    VMachine_flow(start=0.005))
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-150,-52})));
  IDEAS.Fluid.Sources.Boundary_pT boundary(
    nPorts=2,
    redeclare package Medium = MediumGlycol,
    p=200000) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-28,-164})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t14(redeclare package Medium =
        IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p03_m_flow,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{-4,28},{-20,42}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t1(
    allowFlowReversal=false,
                           m_flow_nominal=24000/3600,
    tau=hydronic.sensorTau,
    transferHeat=false,
    redeclare package Medium = MediumGlycol,
    T_start=283.15,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{-166,-176},{-178,-162}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t7(
    allowFlowReversal=false,
                           m_flow_nominal=24000/3600,
    tau=hydronic.sensorTau,
    transferHeat=false,
    redeclare package Medium = MediumGlycol,
    T_start=283.15,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{6,-7},{-6,7}},
        rotation=90,
        origin={-102,-155})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t19(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p03_m_flow,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15)
             annotation (Placement(transformation(extent={{78,-16},{94,-2}})));
  IDEAS.Fluid.Movers.FlowControlled_dp pump3(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p03_m_flow,
    allowFlowReversal=false,
    addPowerToMedium=false,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare
      IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos65slash1to12_CAN_PN6slash10 per,
    y_start=1,
    tau=60,
    riseTime=120,
    use_inputFilter=false,
    dp_nominal(displayUnit="kPa") = 7.4*9804.139432,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(extent={{-26,26},{-44,44}})));
  Data.Parameters.Hydronic hydronic
    annotation (Placement(transformation(extent={{-200,120},{-180,140}})));
  IDEAS.Fluid.MixingVolumes.MixingVolume buffTank(
    redeclare package Medium = IDEAS.Media.Water,
    nPorts=3,
    V=hydronic.VolTank,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    allowFlowReversal=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=hydronic.p03_m_flow,
    mSenFac=1)          annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={6,68})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor insulationBuffTank(R=(0.026/
        0.04)*30.13)
    annotation (Placement(transformation(extent={{42,60},{26,76}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature basementTemperature(T=291.15)
    annotation (Placement(transformation(extent={{66,60},{50,76}})));
  IBPSA.Fluid.HeatPumps.ScrollWaterToWater     heaPum1(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium1 = IDEAS.Media.Water,
    T1_start=273.15 + 35,
    redeclare package ref = IBPSA.Media.Refrigerants.R410A,
    datHeaPum=INFRAX.Data.Parameters.DYNACIAT_200_LG_LGP_cissimmo_wetter(),
    dp1_nominal=48400,
    dp2_nominal=55500,
    tau1=200,
    tau2=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    m1_flow_nominal=hydronic.p03_m_flow/2,
    m2_flow_nominal=hydronic.p01_m_flow/2,
    enable_variable_speed=false,
    scaling_factor=1,
    redeclare package Medium2 = MediumGlycol,
    T2_start=288.15) "Heat pump 1 " annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-114,72})));
  IDEAS.Fluid.MixingVolumes.MixingVolume supplyCollector(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=24000/3600,
    nPorts=5,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    allowFlowReversal=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    V=0.5)          "supply collector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,-10})));
  IDEAS.Fluid.MixingVolumes.MixingVolume returnCollector(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=24000/3600,
    nPorts=5,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    allowFlowReversal=true,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    V=0.5)          "return collector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={156,-50})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t10(
    allowFlowReversal=false,
    m_flow_nominal=21000/3600,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(extent={{-112,-66},{-98,-52}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t11(
    allowFlowReversal=false,
    m_flow_nominal=21000/3600,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(extent={{-96,-88},{-110,-76}})));
  IDEAS.Fluid.Movers.SpeedControlled_y     pump5(
    allowFlowReversal=false,
    addPowerToMedium=false,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare
      IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos65slash1to12_CAN_PN6slash10 per,
    y_start=0,
    tau=60,
    riseTime=120,
    use_inputFilter=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = MediumGlycol)
               "passive cooling pump"
    annotation (Placement(transformation(extent={{-76,-70},{-60,-52}})));
  IBPSA.Fluid.HeatExchangers.DryCoilEffectivenessNTU e004(
    redeclare package Medium1 = IDEAS.Media.Water,
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
    m1_flow_nominal=19400/3600,
    m2_flow_nominal=20200/3600,
    dp1_nominal=40100,
    dp2_nominal=53200,
    Q_flow_nominal(displayUnit="W") = 90000,
    r_nominal=0.465/0.600,
    T_a1_nominal=293.15,
    T_a2_nominal=288.65,
    redeclare package Medium2 = MediumGlycol)
                         "passive cooling heat exchanger" annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-34,-70})));
  IBPSA.Fluid.HeatExchangers.DryCoilEffectivenessNTU e003(
    redeclare package Medium1 = IDEAS.Media.Water,
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    m1_flow_nominal=30300/3600,
    m2_flow_nominal=27100/3600,
    dp1_nominal=48700,
    dp2_nominal=49300,
    Q_flow_nominal(displayUnit="W") = 106000,
    configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
    r_nominal=0.461/0.593,
    T_a1_nominal=288.15,
    T_a2_nominal=284.15,
    redeclare package Medium2 = MediumGlycol)
                         "cooling heat exchanger" annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-40,-16})));
  IDEAS.Fluid.Movers.SpeedControlled_y     pump4(
    allowFlowReversal=false,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos80slash1to12_CAN_PN6
      per,
    tau=60,
    riseTime=120,
    inputType=IDEAS.Fluid.Types.InputType.Stages,
    use_inputFilter=false,
    addPowerToMedium=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = MediumGlycol)
                          "active cooling pump"
    annotation (Placement(transformation(extent={{-84,-18},{-64,2}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t9(
    allowFlowReversal=false,
                           m_flow_nominal=28300/3600,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(extent={{-94,-42},{-108,-28}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t8(
    allowFlowReversal=false,
                           m_flow_nominal=28300/3600,
    tau=hydronic.sensorTau,
    redeclare package Medium = MediumGlycol,
    transferHeat=false,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{-108,-14},{-96,-2}})));
  IDEAS.Fluid.FixedResistances.Junction jun(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=-90,
        origin={-120,-8})));
  IDEAS.Fluid.FixedResistances.Junction jun1(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-121,-35})));
  IDEAS.Fluid.FixedResistances.Junction jun2(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-121,-61})));
  IDEAS.Fluid.FixedResistances.Junction jun3(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-121,-85})));
  Components.CoolingTower coolingTower_detailed(redeclare package MediumGlycol =
        MediumGlycol)
    annotation (Placement(transformation(extent={{194,80},{218,100}})));
  Components.TABS tABS_detailed
    annotation (Placement(transformation(extent={{86,68},{106,88}})));
  Controllers.DataBus dataBus annotation (Placement(transformation(extent={{-220,
            -2},{-180,38}}), iconTransformation(extent={{-210,4},{-190,24}})));
  Controllers.SignalBus signalBus annotation (Placement(transformation(extent={
            {-218,-42},{-178,-2}}), iconTransformation(extent={{-210,-30},{-190,
            -10}})));
  IDEAS.Fluid.FixedResistances.Junction jun4(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-121,-101})));
  IDEAS.Fluid.FixedResistances.Junction jun5(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Bidirectional,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-5,5},{5,-5}},
        rotation=-90,
        origin={-121,-129})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t6(
                           m_flow_nominal=24000/3600,
    allowFlowReversal=false,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(extent={{6,-7},{-6,7}},
        rotation=90,
        origin={-122,-115})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t18(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p07_m_flow,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{6,-88},{-8,-76}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t17(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p07_m_flow,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{-10,-66},{4,-52}})));
  IDEAS.Fluid.FixedResistances.Junction jun6(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    tau=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={77,35})));
  IDEAS.Fluid.FixedResistances.Junction jun7(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    tau=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    annotation (Placement(transformation(
        extent={{5,5},{-5,-5}},
        rotation=-90,
        origin={47,35})));
  IDEAS.Fluid.Sources.Boundary_pT sink(redeclare package Medium =
        IDEAS.Media.Water,
    nPorts=2,
    p=200000)                        annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={8,26})));
  IDEAS.Fluid.FixedResistances.Junction jun8(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    tau=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-120,10})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[35] port_emb
    annotation (Placement(transformation(extent={{84,130},{104,150}})));
  IBPSA.Fluid.HeatExchangers.DryCoilEffectivenessNTU e005(
    redeclare package Medium1 = IDEAS.Media.Water,
    configuration=Buildings.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
    Q_flow_nominal(displayUnit="W") = 34000,
    r_nominal=0.473/0.619,
    dp1_nominal=49900,
    dp2_nominal=47200,
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    m1_flow_nominal=hydronic.p08_m_flow,
    m2_flow_nominal=hydronic.p09_m_flow,
    redeclare package Medium2 = MediumGlycol,
    T_a1_nominal=301.15,
    T_a2_nominal=306.15) "ahu(+) heat exchanger" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={170,48})));
  IDEAS.Fluid.Movers.SpeedControlled_y     pump8(
    allowFlowReversal=false,
    addPowerToMedium=false,
    redeclare package Medium = IDEAS.Media.Water,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    y_start=0,
    tau=60,
    riseTime=120,
    redeclare IDEAS.Fluid.Movers.Data.Pumps.Wilo.Stratos30slash1to12 per,
    inputType=IDEAS.Fluid.Types.InputType.Stages,
    use_inputFilter=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState)
    "pump for primary in e005 (ahu+)"
    annotation (Placement(transformation(extent={{-8,-9},{8,9}},
        rotation=90,
        origin={132,33})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t29(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p08_m_flow,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{142,34},{156,50}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t30(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p08_m_flow,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15)                        annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=-90,
        origin={187,19})));
  Modelica.Fluid.Interfaces.FluidPort_b AHUHeaCoi_b(redeclare package Medium =
        MediumGlycol)      "return from AHU heat coil"
    annotation (Placement(transformation(extent={{170,130},{190,150}})));
  Modelica.Fluid.Interfaces.FluidPort_a AHUHeaCoi_a(redeclare package Medium =
        MediumGlycol)      "supply to AHU heat coil"
    annotation (Placement(transformation(extent={{150,130},{170,150}})));
  Modelica.Fluid.Interfaces.FluidPort_a HeaCoi_a(redeclare package Medium =
        IDEAS.Media.Water) "supply to vav/ducts heat coil"
    annotation (Placement(transformation(extent={{110,130},{130,150}})));
  Modelica.Fluid.Interfaces.FluidPort_b HeaCoi_b(redeclare package Medium =
        IDEAS.Media.Water) "return from vav/duct heat coils"
    annotation (Placement(transformation(extent={{130,130},{150,150}})));
  Modelica.Fluid.Interfaces.FluidPort_b AHUCooCoi_b(redeclare package Medium =
        IDEAS.Media.Water) "return from AHU cooling coil"
    annotation (Placement(transformation(extent={{10,130},{30,150}})));
  Modelica.Fluid.Interfaces.FluidPort_a AHUCooCoi_a(redeclare package Medium =
        IDEAS.Media.Water) "supply to AHU cooling coil"
    annotation (Placement(transformation(extent={{-10,130},{10,150}})));
  IBPSA.Fluid.HeatPumps.ScrollWaterToWater     heaPum2(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    show_T=true,
    redeclare package Medium1 = IDEAS.Media.Water,
    T1_start=273.15 + 35,
    redeclare package ref = IBPSA.Media.Refrigerants.R410A,
    dp1_nominal=48400,
    dp2_nominal=55500,
    tau1=200,
    tau2=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    m1_flow_nominal=hydronic.p03_m_flow/2,
    m2_flow_nominal=hydronic.p01_m_flow/2,
    enable_variable_speed=false,
    scaling_factor=1,
    datHeaPum=Data.Parameters.DYNACIAT_200_LG_LGP_cissimmo_wetter(),
    redeclare package Medium2 = MediumGlycol,
    T2_start=288.15) "Heat pump 12" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-114,108})));
  IDEAS.Fluid.FixedResistances.Junction jun10(
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    tau=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-120,32})));
  IDEAS.Fluid.FixedResistances.Junction junHpConByp(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    tau=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-50,118})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_byPass_collector(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p03_m_flow,
    dp_nominal(displayUnit="kPa") = 0) "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=180,
        origin={62,35})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_E003(
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p04_m_flow,
    dp_nominal(displayUnit="kPa") = 3800,
    redeclare package Medium = MediumGlycol)
                                          "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=180,
        origin={-66,-35})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_E1(
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p05_m_flow,
    dp_nominal(displayUnit="kPa") = 4000,
    redeclare package Medium = MediumGlycol)
                                          "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=180,
        origin={-62,-85})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_E2(
    allowFlowReversal=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p06_m_flow,
    dp_nominal(displayUnit="kPa") = 10800) "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=270,
        origin={140,69})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_e005_primary(
    allowFlowReversal=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p08_m_flow,
    dp_nominal(displayUnit="kPa") = 2700) "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-8,7},{8,-7}},
        rotation=270,
        origin={187,-10})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_e004_TABS(
    allowFlowReversal=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p07_m_flow,
    dp_nominal(displayUnit="kPa") = 5100) "equilibrium valve" annotation (
      Placement(transformation(
        extent={{8,9},{-8,-9}},
        rotation=180,
        origin={30,-59})));
  Modelica.Blocks.Interfaces.RealOutput HP_P
    annotation (Placement(transformation(extent={{-200,-118},{-220,-98}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=heaPum1.P + heaPum2.P)
    annotation (Placement(transformation(extent={{-164,-118},{-184,-98}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=heaPum1.P + heaPum2.P
         + pump1.P + pump3.P + pump4.P + pump5.P + pump8.P +
        coolingTower_detailed.P_pumps + coolingTower_detailed.P_CT +
        tABS_detailed.P_pump)
    annotation (Placement(transformation(extent={{-164,-90},{-184,-70}})));
  Modelica.Blocks.Interfaces.RealOutput total_P
    annotation (Placement(transformation(extent={{-200,-90},{-220,-70}})));
  Components.IdealCircuitSwitch idealCircuitSwitch(
    setEqualPressureBC=false,
    allowBCOpen=false,
    redeclare package Medium = MediumGlycol)
    annotation (Placement(transformation(extent={{-160,20},{-140,0}})));
  Modelica.Blocks.MathBoolean.Not HPValEvaByp
    annotation (Placement(transformation(extent={{-174,70},{-166,78}})));
  Modelica.Blocks.Logical.Or HPValEva
    annotation (Placement(transformation(extent={{-198,60},{-186,72}})));
  Components.IdealCircuitSwitch idealCircuitSwitch1(
                           fra=0.5, redeclare package Medium = MediumGlycol)
                                    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-170,100})));
  Modelica.Blocks.Math.IntegerToBoolean HP1_boolean(threshold=1)
    annotation (Placement(transformation(extent={{-230,100},{-218,88}})));
  Modelica.Blocks.Math.IntegerToBoolean HP2_boolean(threshold=1)
    annotation (Placement(transformation(extent={{-230,100},{-218,112}})));
  Components.IdealCircuitSwitch idealCircuitSwitch2(
    redeclare package Medium = IDEAS.Media.Water,
    setEqualPressureBC=false,
    allowBCOpen=false,
    u_val2(start=true))
    annotation (Placement(transformation(extent={{-76,60},{-56,40}})));
  Components.IdealCircuitSwitch idealCircuitSwitch3(redeclare package Medium =
        IDEAS.Media.Water, fra=0.5)        annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={-70,80})));
  IDEAS.Fluid.FixedResistances.Junction junHpConRet(
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal={1,1,1},
    dp_nominal={0,0,0},
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Entering,
    tau=200,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-90,118})));
  Modelica.Blocks.Logical.Or HPValCon
    annotation (Placement(transformation(extent={{-40,72},{-48,64}})));
  Modelica.Blocks.MathBoolean.Not HPValConByp
    annotation (Placement(transformation(extent={{-52,62},{-56,66}})));
  IBPSA.Fluid.Geothermal.Borefields.TwoUTubes
    borField(
    allowFlowReversal=false,
    borFieDat=Data.Parameters.BorefieldData.INFRAX_bF(),
    redeclare package Medium = MediumGlycol,
    nSeg=5)          "borefield from INFRAX"
    annotation (Placement(transformation(extent={{-134,-176},{-154,-156}})));
  IDEAS.Fluid.FixedResistances.PressureDrop dp_fixed_HP(
    allowFlowReversal=false,
    redeclare package Medium = IDEAS.Media.Water,
    m_flow_nominal=hydronic.p03_m_flow,
    dp_nominal(displayUnit="Pa") = 48400) "equilibrium valve" annotation (
      Placement(transformation(
        extent={{-6,-7},{6,7}},
        rotation=180,
        origin={-54,35})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort t2(
    redeclare package Medium = IDEAS.Media.Water,
    allowFlowReversal=false,
    m_flow_nominal=24000/3600,
    tau=hydronic.sensorTau,
    transferHeat=false,
    TAmb=291.15)
    annotation (Placement(transformation(extent={{6,7},{-6,-7}},
        rotation=-90,
        origin={-160,41})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entSupTABS(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p07_m_flow) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,44})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entRetTABS(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p07_m_flow) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={124,-22})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entSupAHUHea(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p08_m_flow) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={132,12})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entRetAHUHea(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p08_m_flow) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={188,-28})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entSupVAV(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p06_m_flow) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={120,106})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entRetVAV(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p06_m_flow) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={140,110})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entSupCT(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p10_m_flow) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={204,50})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entRetCT(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p10_m_flow) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=90,
        origin={211,-15})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entSupCTCoo(
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p11_m_flow,
    redeclare package Medium = MediumGlycol)
                                        annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={55,-101})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entRetCTCoo(
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p11_m_flow,
    redeclare package Medium = MediumGlycol)
                                        annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={86,-130})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entSupTABSCoo(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p07_m_flow) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={69,-59})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entRetTABSCoo(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p07_m_flow) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=0,
        origin={88,-82})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entSupAHUCoo(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p13_m_flow) annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-14,-6})));
  IDEAS.Fluid.Sensors.EnthalpyFlowRate entRetAHUCoo(
    redeclare package Medium = IDEAS.Media.Water,
    tau=0,
    allowFlowReversal=false,
    m_flow_nominal=hydronic.p13_m_flow) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=0,
        origin={-22,-32})));
  Modelica.Blocks.Continuous.Integrator                borFieBal(k=1/3600000)
    annotation (Placement(transformation(extent={{-160,-150},{-180,-130}})));
  Modelica.Blocks.Interfaces.RealOutput accBorFie
    "accumulated borefield energy"
    annotation (Placement(transformation(extent={{-200,-150},{-220,-130}})));
  Modelica.Blocks.Sources.RealExpression groTemResQ(y=borField.groTemRes.QBor_flow)
    annotation (Placement(transformation(extent={{-130,-150},{-150,-130}})));
equation
  connect(t1.port_b, pump1.port_a) annotation (Line(points={{-178,-169},{-178,
          -116},{-150,-116},{-150,-62}},
                             color={0,127,255}));
  connect(t14.port_b, pump3.port_a) annotation (Line(points={{-20,35},{-26,35}},
                              color={0,127,255}));
  connect(buffTank.heatPort, insulationBuffTank.port_b)
    annotation (Line(points={{16,68},{26,68}}, color={191,0,0}));
  connect(basementTemperature.port, insulationBuffTank.port_a)
    annotation (Line(points={{50,68},{42,68}}, color={191,0,0}));

  connect(t14.port_a, buffTank.ports[1]) annotation (Line(points={{-4,35},{4,35},
          {4,58},{8.66667,58}},      color={0,127,255}));
  connect(t19.port_b, supplyCollector.ports[1]) annotation (Line(points={{94,-9},
          {94,0},{113.2,0}},                   color={0,127,255}));
  connect(pump5.port_a, t10.port_b) annotation (Line(points={{-76,-61},{-76,-59},
          {-98,-59}}, color={0,127,255}));
  connect(pump5.port_b, e004.port_a2) annotation (Line(points={{-60,-61},{-60,
          -60},{-44,-60},{-40,-60}},                     color={0,127,255}));
  connect(e003.port_a2, pump4.port_b)
    annotation (Line(points={{-46,-6},{-64,-6},{-64,-8}}, color={0,127,255}));
  connect(t8.port_b, pump4.port_a) annotation (Line(points={{-96,-8},{-84,-8}},
                             color={0,127,255}));
  connect(jun.port_3, t8.port_a) annotation (Line(points={{-114,-8},{-108,-8}},
                     color={0,127,255}));
  connect(jun.port_2, jun1.port_1) annotation (Line(points={{-120,-14},{-121,-14},
          {-121,-30}},      color={0,127,255}));
  connect(jun1.port_3, t9.port_b) annotation (Line(points={{-116,-35},{-112,-35},
          {-108,-35}}, color={0,127,255}));
  connect(jun2.port_3, t10.port_a) annotation (Line(points={{-116,-61},{-112,
          -61},{-112,-59}}, color={0,127,255}));
  connect(jun2.port_1, jun1.port_2) annotation (Line(points={{-121,-56},{-121,
          -56},{-121,-40}}, color={0,127,255}));
  connect(jun3.port_3, t11.port_b) annotation (Line(points={{-116,-85},{-114,
          -85},{-114,-82},{-110,-82}}, color={0,127,255}));
  connect(jun3.port_1, jun2.port_2) annotation (Line(points={{-121,-80},{-121,
          -73},{-121,-66}}, color={0,127,255}));
  connect(t8.T, dataBus.T8);
  connect(t9.T, dataBus.T9);
  connect(t10.T, dataBus.T10);
  connect(t11.T, dataBus.T11);
  connect(t7.T, dataBus.T7);
  connect(t1.T, dataBus.T1);
  connect(t14.T, dataBus.T14);
  connect(t19.T, dataBus.T19);
  connect(pump1.y, signalBus.P0102_mod);
//  connect(heaPum1.y, signalBus.HP_mod);
  connect(pump3.dp_in, signalBus.P03_mod);
  connect(dataBus, tABS_detailed.dataBus);
  connect(signalBus, tABS_detailed.signalBus);
  connect(signalBus, coolingTower_detailed.signalBus);
  connect(dataBus, coolingTower_detailed.dataBus);
  connect(jun4.port_1, jun3.port_2) annotation (Line(points={{-121,-96},{-121,
          -96},{-121,-90}}, color={0,127,255}));
  connect(jun5.port_2, t7.port_a) annotation (Line(points={{-121,-134},{-120,
          -134},{-120,-149},{-102,-149}}, color={0,127,255}));
  connect(jun5.port_1, t6.port_b) annotation (Line(points={{-121,-124},{-122,
          -124},{-122,-121}}, color={0,127,255}));
  connect(jun4.port_2, t6.port_a) annotation (Line(points={{-121,-106},{-122,
          -106},{-122,-109}}, color={0,127,255}));
  connect(e004.port_a1, t18.port_b) annotation (Line(points={{-28,-80},{-20,-80},
          {-20,-82},{-8,-82}}, color={0,127,255}));
  connect(e004.port_b1, t17.port_a) annotation (Line(points={{-28,-60},{-20,-60},
          {-20,-59},{-10,-59}}, color={0,127,255}));
  connect(t19.port_a, jun6.port_2) annotation (Line(points={{78,-9},{78,-9},{78,
          30},{77,30}}, color={0,127,255}));
  connect(returnCollector.ports[1], jun7.port_1) annotation (Line(points={{159.2,
          -40},{47,-40},{47,30}},         color={0,127,255}));
  connect(jun7.port_2, buffTank.ports[2]) annotation (Line(points={{47,40},{46,
          40},{46,48},{44,48},{6,48},{6,58}}, color={0,127,255}));
  connect(pump5.y, signalBus.P05_mod);
  connect(t17.T, dataBus.T17);
  connect(t18.T, dataBus.T18);
  connect(sink.ports[1], buffTank.ports[3]) annotation (Line(points={{9.2,32},{9.2,
          58},{3.33333,58}},          color={0,127,255}));
  connect(tABS_detailed.port_emb, port_emb) annotation (Line(points={{93.8182,
          88.1667},{93.8182,95.0833},{94,95.0833},{94,140}},   color={191,0,0}));
  connect(e005.port_a1, t29.port_b)
    annotation (Line(points={{160,42},{156,42}},          color={0,127,255}));
  connect(t29.port_a, pump8.port_b) annotation (Line(points={{142,42},{132,42},{
          132,41}},                             color={0,127,255}));
  connect(e005.port_b1, t30.port_a)
    annotation (Line(points={{180,42},{187,42},{187,26}}, color={0,127,255}));
  connect(e005.port_a2, AHUHeaCoi_b)
    annotation (Line(points={{180,54},{180,96},{180,140}},
                                                  color={0,127,255}));
  connect(e005.port_b2, AHUHeaCoi_a)
    annotation (Line(points={{160,54},{160,140}},          color={0,127,255}));
  connect(jun8.port_1, jun10.port_2) annotation (Line(points={{-120,16},{-120,26}},
                          color={0,127,255}));
  connect(jun8.port_2, jun.port_1) annotation (Line(points={{-120,4},{-120,-2}},
                      color={0,127,255}));
  connect(heaPum1.stage, signalBus.HP1_signal) annotation (Line(points={{-111,60},
          {-111,-22},{-198,-22}},           color={255,127,0},
      visible=false),                                           Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(heaPum2.stage, signalBus.HP2_signal) annotation (Line(points={{-111,96},
          {-112,96},{-112,-24},{-112,-22},{-198,-22}},           color={255,127,
          0},
      visible=false),
               Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(jun6.port_1, junHpConByp.port_2) annotation (Line(points={{77,40},{76,
          40},{76,118},{-44,118}}, color={0,127,255}));
  connect(jun7.port_3, dp_fixed_byPass_collector.port_b)
    annotation (Line(points={{52,35},{56,35}}, color={0,127,255}));
  connect(jun6.port_3, dp_fixed_byPass_collector.port_a)
    annotation (Line(points={{72,35},{72,35},{68,35}}, color={0,127,255}));
  connect(dp_fixed_E003.port_a, e003.port_b2) annotation (Line(points={{-60,-35},
          {-46,-35},{-46,-26}}, color={0,127,255}));
  connect(dp_fixed_E003.port_b, t9.port_a) annotation (Line(points={{-72,-35},{
          -82,-35},{-94,-35}}, color={0,127,255}));
  connect(t11.port_a, dp_fixed_E1.port_b) annotation (Line(points={{-96,-82},{
          -68,-82},{-68,-85}}, color={0,127,255}));
  connect(dp_fixed_E1.port_a, e004.port_b2) annotation (Line(points={{-56,-85},
          {-52,-85},{-52,-86},{-40,-86},{-40,-80}}, color={0,127,255}));
  connect(dp_fixed_E2.port_b, returnCollector.ports[2]) annotation (Line(points={{140,63},
          {140,63},{140,-32},{157.6,-32},{157.6,-40}},          color={0,127,
          255}));
  connect(t30.port_b, dp_fixed_e005_primary.port_a)
    annotation (Line(points={{187,12},{187,12},{187,-2}}, color={0,127,255}));
  connect(t17.port_b, dp_fixed_e004_TABS.port_a)
    annotation (Line(points={{4,-59},{14,-59},{22,-59}}, color={0,127,255}));
  connect(boundary.ports[1], AHUHeaCoi_b) annotation (Line(points={{-26.8,-170},
          {196,-170},{196,72},{180,72},{180,140}},                   color={0,127,
          255}));
  connect(pump4.stage, signalBus.P04_signal) annotation (Line(points={{-74,4},{-74,
          12},{-112,12},{-112,-22},{-198,-22}},           color={255,127,0},
      visible=false),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(pump8.stage, signalBus.P08_signal) annotation (Line(points={{121.2,33},
          {-112,33},{-112,-22},{-198,-22}},       color={255,127,0},
      visible=false),                                                 Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(realExpression.y, HP_P) annotation (Line(points={{-185,-108},{-196,
          -108},{-210,-108}}, color={0,0,127}));
  connect(realExpression1.y, total_P) annotation (Line(points={{-185,-80},{-196,
          -80},{-210,-80}}, color={0,0,127}));
  connect(jun10.port_1, heaPum1.port_b2) annotation (Line(points={{-120,38},{
          -120,62}},           color={0,127,255}));
  connect(jun10.port_3, heaPum2.port_b2) annotation (Line(points={{-126,32},{-136,
          32},{-136,98},{-120,98}},      color={0,127,255}));
  connect(HPValEvaByp.y, idealCircuitSwitch.u_val2) annotation (Line(
      points={{-165.2,74},{-144,74},{-144,20.6}},
      color={255,0,255},
      visible=false));
  connect(HPValEva.y, HPValEvaByp.u) annotation (Line(
      points={{-185.4,66},{-180,66},{-180,74},{-175.6,74}},
      color={255,0,255},
      visible=false));
  connect(HPValEva.y, idealCircuitSwitch.u_val1) annotation (Line(points={{-185.4,
          66},{-156,66},{-156,20.6}}, color={255,0,255},
      visible=false));
  connect(idealCircuitSwitch.port_c, pump1.port_b) annotation (Line(points={{-150,0},
          {-150,-42}},             color={0,127,255}));
  connect(idealCircuitSwitch.port_b, jun8.port_3) annotation (Line(points={{-140.2,
          10},{-126,10}},                     color={0,127,255}));
  connect(idealCircuitSwitch1.port_b, heaPum2.port_a2) annotation (Line(points={
          {-170,109.8},{-170,118},{-120,118}}, color={0,127,255}));
  connect(idealCircuitSwitch1.port_a, heaPum1.port_a2) annotation (Line(points={{-170,
          89.8},{-170,82},{-120,82}},       color={0,127,255}));
  connect(HPValEva.u2, idealCircuitSwitch1.u_val2) annotation (Line(points={{-199.2,
          61.2},{-199.2,106},{-180.6,106}}, color={255,0,255},
      visible=false));
  connect(HPValEva.u1, idealCircuitSwitch1.u_val1) annotation (Line(points={{-199.2,
          66},{-199.2,94},{-180.6,94}}, color={255,0,255},
      visible=false));
  connect(HP2_boolean.u, signalBus.HP2_signal) annotation (Line(
      points={{-231.2,106},{-240,106},{-240,-22},{-198,-22}},
      color={255,127,0},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(HP1_boolean.u, signalBus.HP1_signal) annotation (Line(
      points={{-231.2,94},{-238,94},{-238,-22},{-198,-22}},
      color={255,127,0},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(idealCircuitSwitch2.port_a, idealCircuitSwitch3.port_c) annotation (
      Line(points={{-76.2,50},{-80,50},{-80,80}}, color={0,127,255}));
  connect(idealCircuitSwitch3.port_a, heaPum1.port_a1) annotation (Line(points={{-70,
          69.8},{-70,62},{-108,62}},       color={0,127,255}));
  connect(idealCircuitSwitch3.port_b, heaPum2.port_a1) annotation (Line(points=
          {{-70,89.8},{-70,98},{-108,98}}, color={0,127,255}));
  connect(idealCircuitSwitch2.port_b, junHpConByp.port_3) annotation (Line(
        points={{-56.2,50},{-50,50},{-50,112}}, color={0,127,255}));
  connect(junHpConRet.port_1, heaPum2.port_b1)
    annotation (Line(points={{-96,118},{-108,118}}, color={0,127,255}));
  connect(junHpConRet.port_3, heaPum1.port_b1) annotation (Line(points={{-90,112},
          {-90,82},{-108,82}},      color={0,127,255}));
  connect(junHpConRet.port_2, junHpConByp.port_1)
    annotation (Line(points={{-84,118},{-56,118}}, color={0,127,255}));
  connect(HP2_boolean.y, idealCircuitSwitch1.u_val2) annotation (Line(
      points={{-217.4,106},{-180.6,106}},
      color={255,0,255},
      visible=false));
  connect(HP1_boolean.y, idealCircuitSwitch1.u_val1) annotation (Line(
      points={{-217.4,94},{-180.6,94}},
      color={255,0,255},
      visible=false));
  connect(HP2_boolean.y, idealCircuitSwitch3.u_val2) annotation (Line(
      points={{-217.4,106},{-40,106},{-40,86},{-59.4,86}},
      color={255,0,255},
      visible=false));
  connect(idealCircuitSwitch1.u_val1, idealCircuitSwitch3.u_val1) annotation (
      Line(
      points={{-180.6,94},{-40,94},{-40,74},{-59.4,74}},
      color={255,0,255},
      visible=false));
  connect(HPValCon.y, idealCircuitSwitch2.u_val1) annotation (Line(points={{
          -48.4,68},{-72,68},{-72,60.6}}, color={255,0,255}));
  connect(HPValCon.u2, idealCircuitSwitch3.u_val2) annotation (Line(
      points={{-39.2,71.2},{-39.2,86},{-59.4,86}},
      color={255,0,255},
      visible=false));
  connect(HPValCon.u1, idealCircuitSwitch3.u_val1) annotation (Line(
      points={{-39.2,68},{-40,68},{-40,74},{-59.4,74}},
      color={255,0,255},
      visible=false));
  connect(HPValConByp.u, HPValCon.y)
    annotation (Line(points={{-51.2,64},{-50,64},{-50,68},{-48.4,68}},
                                                     color={255,0,255}));
  connect(HPValConByp.y, idealCircuitSwitch2.u_val2) annotation (Line(points={{-56.4,
          64},{-60,64},{-60,60.6}},       color={255,0,255}));
  connect(t1.port_a, borField.port_b) annotation (Line(points={{-166,-169},{
          -159,-169},{-159,-166},{-154,-166}},
                                          color={0,127,255}));
  connect(t7.port_b, borField.port_a) annotation (Line(points={{-102,-161},{
          -102,-166},{-134,-166}},
                              color={0,127,255}));
  connect(pump3.port_b, dp_fixed_HP.port_a)
    annotation (Line(points={{-44,35},{-48,35}}, color={0,127,255}));
  connect(dp_fixed_HP.port_b, idealCircuitSwitch2.port_c)
    annotation (Line(points={{-60,35},{-66,35},{-66,40}}, color={0,127,255}));
  connect(idealCircuitSwitch1.port_c, t2.port_b) annotation (Line(points={{-160,
          100},{-160,52},{-160.2,52},{-160,47}}, color={0,127,255}));
  connect(t2.port_a, idealCircuitSwitch.port_a) annotation (Line(points={{-160,
          35},{-160,22.5},{-160.2,22.5},{-160.2,10}}, color={0,127,255}));
  connect(t2.T, dataBus.T2) annotation (Line(points={{-167.7,41},{-200,41},{
          -200,38},{-199.9,38},{-199.9,18.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(supplyCollector.ports[2], entSupTABS.port_a)
    annotation (Line(points={{111.6,0},{90,0},{90,34}}, color={0,127,255}));
  connect(entSupTABS.port_b, tABS_detailed.heaSupply) annotation (Line(points={{90,54},
          {90,61},{89.6364,61},{89.6364,68}},        color={0,127,255}));
  connect(returnCollector.ports[3], entRetTABS.port_b) annotation (Line(points={
          {156,-40},{158,-40},{158,-36},{124,-36},{124,-32}}, color={0,127,255}));
  connect(entRetTABS.port_a, tABS_detailed.heaReturn) annotation (Line(points={{124,-12},
          {124,68},{101.455,68}},          color={0,127,255}));
  connect(supplyCollector.ports[3], entSupAHUHea.port_a)
    annotation (Line(points={{110,0},{132,0},{132,6}}, color={0,127,255}));
  connect(entSupAHUHea.port_b, pump8.port_a)
    annotation (Line(points={{132,18},{132,25}}, color={0,127,255}));
  connect(dp_fixed_e005_primary.port_b, entRetAHUHea.port_a) annotation (Line(
        points={{187,-18},{188,-18},{188,-22}}, color={0,127,255}));
  connect(entRetAHUHea.port_b, returnCollector.ports[4]) annotation (Line(
        points={{188,-34},{188,-40},{154.4,-40}}, color={0,127,255}));
  connect(supplyCollector.ports[4], entSupVAV.port_a) annotation (Line(points={{
          108.4,0},{108.4,48},{120,48},{120,100}}, color={0,127,255}));
  connect(entSupVAV.port_b, HeaCoi_a)
    annotation (Line(points={{120,112},{120,140}}, color={0,127,255}));
  connect(dp_fixed_E2.port_a, entRetVAV.port_b)
    annotation (Line(points={{140,75},{140,104}}, color={0,127,255}));
  connect(entRetVAV.port_a, HeaCoi_b)
    annotation (Line(points={{140,116},{140,140}}, color={0,127,255}));
  connect(supplyCollector.ports[5], entSupCT.port_a) annotation (Line(points={{106.8,
          0},{106.8,2},{204,2},{204,44}}, color={0,127,255}));
  connect(entSupCT.port_b, coolingTower_detailed.port_a) annotation (Line(
        points={{204,56},{204,80},{207.9,80}}, color={0,127,255}));
  connect(returnCollector.ports[5], entRetCT.port_b) annotation (Line(points={{152.8,
          -40},{211,-40},{211,-20}}, color={0,127,255}));
  connect(entRetCT.port_a, coolingTower_detailed.port_b)
    annotation (Line(points={{211,-10},{211,80}}, color={0,127,255}));
  connect(jun4.port_3, entSupCTCoo.port_a)
    annotation (Line(points={{-116,-101},{48,-101}}, color={0,127,255}));
  connect(entSupCTCoo.port_b, coolingTower_detailed.port_a1) annotation (Line(
        points={{62,-101},{220,-101},{220,91},{218,91}}, color={0,127,255}));
  connect(jun5.port_3, entRetCTCoo.port_b) annotation (Line(points={{-116,-129},
          {58,-129},{58,-130},{80,-130}}, color={0,127,255}));
  connect(entRetCTCoo.port_a, coolingTower_detailed.port_b1) annotation (Line(
        points={{92,-130},{232,-130},{232,90},{224,90},{224,93},{218,93}},
        color={0,127,255}));
  connect(dp_fixed_e004_TABS.port_b, entSupTABSCoo.port_a)
    annotation (Line(points={{38,-59},{62,-59}}, color={0,127,255}));
  connect(entSupTABSCoo.port_b, tABS_detailed.cooSupply) annotation (Line(
        points={{76,-59},{106,-59},{106,73.8333}}, color={0,127,255}));
  connect(t18.port_a, entRetTABSCoo.port_b)
    annotation (Line(points={{6,-82},{80,-82}}, color={0,127,255}));
  connect(entRetTABSCoo.port_a, tABS_detailed.cooReturn) annotation (Line(
        points={{96,-82},{106,-82},{106,76.3333}}, color={0,127,255}));
  connect(e003.port_b1, entSupAHUCoo.port_a)
    annotation (Line(points={{-34,-6},{-22,-6}}, color={0,127,255}));
  connect(entSupAHUCoo.port_b, AHUCooCoi_a)
    annotation (Line(points={{-6,-6},{0,-6},{0,140}}, color={0,127,255}));
  connect(entRetAHUCoo.port_b, e003.port_a1) annotation (Line(points={{-30,-32},
          {-34,-32},{-34,-26}}, color={0,127,255}));
  connect(entRetAHUCoo.port_a, AHUCooCoi_b)
    annotation (Line(points={{-14,-32},{20,-32},{20,140}}, color={0,127,255}));
  connect(sink.ports[2], AHUCooCoi_b) annotation (Line(points={{6.8,32},{6.8,-32},
          {20,-32},{20,140}}, color={0,127,255}));
  connect(borFieBal.y, accBorFie)
    annotation (Line(points={{-181,-140},{-210,-140}}, color={0,0,127}));
  connect(groTemResQ.y, borFieBal.u)
    annotation (Line(points={{-151,-140},{-158,-140}}, color={0,0,127}));
  connect(boundary.ports[2], borField.port_a) annotation (Line(points={{-29.2,
          -170},{-120,-170},{-120,-166},{-134,-166}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -180},{220,140}}), graphics={
        Rectangle(
          extent={{-180,100},{220,-100}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor={191,0,0}),
        Line(
          points={{72,-20},{52,0}},
          color={0,0,127}),
        Line(
          points={{52,0},{22,-30}},
          color={0,0,127},
          pattern=LinePattern.Dash),
        Line(
          points={{52,0},{14,0}},
          color={191,0,0},
          thickness=0.5),
        Line(
          points={{-6,-20},{-106,-20}},
          color={191,0,0},
          thickness=0.5),
        Line(
          points={{-6,20},{-106,20}},
          color={191,0,0},
          thickness=0.5),
        Line(
          points={{14,0},{-6,-20}},
          color={191,0,0},
          thickness=0.5),
        Line(
          points={{14,0},{-6,20}},
          color={191,0,0},
          thickness=0.5),
        Polygon(
          points={{-106,0},{-106,40},{-136,20},{-106,0}},
          lineColor={191,0,0},
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-106,-40},{-106,0},{-136,-20},{-106,-40}},
          lineColor={191,0,0},
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-136,40},{-156,-40}},
          lineColor={191,0,0},
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{222,0},{52,0}},
          color={85,170,255},
          smooth=Smooth.None),
        Line(points={{52,70},{52,40}}),
        Line(points={{74.9,32.8},{92.2,57.3}}),
        Line(points={{29.1,32.8},{11.8,57.3}}),
        Line(points={{89.6,13.7},{117.8,23.9}}),
        Ellipse(
          lineColor={64,64,64},
          fillColor={215,215,215},
          extent={{40,-12},{64,12}},
          fillPattern=FillPattern.Solid),
        Polygon(
          origin={52,0},
          rotation=-17.5,
          fillColor={64,64,64},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-5.0,0.0},{-2.0,60.0},{0.0,65.0},{2.0,60.0},{5.0,0.0}}),
        Ellipse(
          fillColor={64,64,64},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{45,-7},{59,7}}),
        Line(
          points={{82,-30},{72,-20}},
          color={0,0,127},
          pattern=LinePattern.Dash),
        Line(
          points={{22,-100},{22,-30}},
          color={0,0,127},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Line(
          points={{82,-100},{82,-30}},
          color={0,0,127},
          smooth=Smooth.None,
          pattern=LinePattern.Dash)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-180},{220,140}})),
    experiment(
      StopTime=604800,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=30,
      __Dymola_Algorithm="Euler"));
end HeatingSystem;
