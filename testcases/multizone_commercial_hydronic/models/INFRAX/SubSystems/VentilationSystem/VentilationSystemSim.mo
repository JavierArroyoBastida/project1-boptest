within INFRAX.SubSystems.VentilationSystem;
model VentilationSystemSim
  extends VentilationSystem(
      redeclare IDEAS.Fluid.Movers.FlowControlled_dp exhaustFan(
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
        prescribeSystemPressure=true),
      redeclare IDEAS.Fluid.Movers.FlowControlled_dp supplyFan(
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
        prescribeSystemPressure=true),
      redeclare IDEAS.Fluid.Movers.FlowControlled_dp pump13(
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
        T_start=284.15),
      redeclare IDEAS.Fluid.Movers.FlowControlled_dp pump6(
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
        redeclare package Medium = MediumWater),
      redeclare IDEAS.Fluid.Movers.FlowControlled_dp pump9(
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
        redeclare package Medium = MediumGlycol),
        redeclare IDEAS.Fluid.Actuators.Valves.TwoWayPressureIndependent dp_ducts_supply(
      allowFlowReversal=false,
          m_flow_nominal=air.m_nominal_supply_duct,
          redeclare package Medium = MediumAir,
          from_dp=true,
          dpFixed_nominal=100,
      dpValve_nominal=50,
      use_inputFilter=false),
        redeclare IDEAS.Fluid.Actuators.Valves.TwoWayPressureIndependent dp_ducts_extract(
      allowFlowReversal=false,
          m_flow_nominal=air.m_nominal_extract_duct,
          redeclare package Medium = MediumAir,
          from_dp=true,
      dpValve_nominal=50,
      use_inputFilter=false),
          redeclare IDEAS.Fluid.Actuators.Valves.TwoWayPressureIndependent    vav_supply(
      allowFlowReversal=false,
            use_inputFilter=false,
            m_flow_nominal=air.m_nominal_supply_vav,
            redeclare package Medium = MediumAir,
            from_dp=true,
            each dpValve_nominal=60,
            dpFixed_nominal=100,
            deltaM=0.02,
            deltax=0.02),
          redeclare IDEAS.Fluid.Actuators.Valves.TwoWayPressureIndependent    vav_extract(
      allowFlowReversal=false,
            use_inputFilter=false,
            m_flow_nominal=air.m_nominal_extract_vav,
            each dpValve_nominal=150,
            redeclare package Medium = MediumAir,
            from_dp=true),
    redeclare IBPSA.Fluid.HeatExchangers.DryCoilEffectivenessNTU counterFlowHEX(
      allowFlowReversal1=false,
      m1_flow_nominal=air.m_nominal_water,
      m2_flow_nominal=air.m_nominal_air,
      dp1_nominal=0,
      dp2_nominal=0,
      Q_flow_nominal=air.Q_nominal,
      allowFlowReversal2=false,
      redeclare package Medium2 = MediumAir,
      configuration=IBPSA.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
      T_a1_nominal=air.TWatSup_nominal,
      T_a2_nominal=air.TAirSup_nominal,
      redeclare package Medium1 = MediumWater),
    aHU(QCooCoi_nominal=59300),
    dp_server(allowFlowReversal=true),
    tAirSupply(allowFlowReversal=true),
    tAHUSupply(allowFlowReversal=false),
    tAHUExtract(allowFlowReversal=false));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant supplyCAV[7](k=1)
    annotation (Placement(transformation(extent={{12,-16},{22,-6}})));
  Buildings.Controls.OBC.CDL.Continuous.Sources.Constant extractCAV[10](k=1)
    annotation (Placement(transformation(extent={{-20,64},{-8,76}})));
  Modelica.Blocks.Sources.RealExpression extractVAV[14](y={air.m_nominal_extract_vav_min[
        i]/air.m_nominal_extract_vav[i] + (1 - air.m_nominal_extract_vav_min[i]
        /air.m_nominal_extract_vav[i])*signalBus.VAV_signal_extract[i] for i in
            1:14})
    annotation (Placement(transformation(extent={{2,80},{30,100}})));
  Modelica.Blocks.Sources.RealExpression supplyVAV[15](y={air.m_nominal_supply_vav_min[
        i]/air.m_nominal_supply_vav[i] + (1 - air.m_nominal_supply_vav_min[i]/
        air.m_nominal_supply_vav[i])*signalBus.VAV_signal[i] for i in 1:15})
    annotation (Placement(transformation(extent={{-40,-92},{-12,-72}})));
equation
  connect(supplyCAV.y, dp_ducts_supply.y)
    annotation (Line(points={{22.5,-11},{42,-11},{42,-34}}, color={0,0,127}));
  connect(extractCAV.y, dp_ducts_extract.y) annotation (Line(points={{-7.4,70},
          {0,70},{0,36},{22,36},{22,32}}, color={0,0,127}));
  connect(supplyVAV.y, vav_supply.y) annotation (Line(points={{-10.6,-82},{2,
          -82},{2,-69.3},{42.5,-69.3}}, color={0,0,127}));
  connect(extractVAV.y, vav_extract.y) annotation (Line(points={{31.4,90},{44,
          90},{44,74},{22.5,74},{22.5,62.7}}, color={0,0,127}));
end VentilationSystemSim;
