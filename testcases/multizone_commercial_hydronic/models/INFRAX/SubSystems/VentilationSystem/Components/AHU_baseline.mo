within INFRAX.SubSystems.VentilationSystem.Components;
model AHU_baseline "Infrax AHU"

  extends
    INFRAX.SubSystems.VentilationSystem.Components.Dependencies.PartialAHU;

  IDEAS.Fluid.FixedResistances.Junction                       spl(
    dp_nominal={0,0,0},
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    tau=tau,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
    portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
    m_flow_nominal={mFlowAirSup_nominal,mFlowAirSup_nominal,mFlowAirSup_nominal},
    redeclare package Medium = MediumAir,
    portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving)
    annotation (Placement(transformation(extent={{26,-54},{14,-66}})));

  IDEAS.Fluid.Actuators.Valves.Simplified.ThreeWayValveMotor  threeWayValveMotor(
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    m_flow_nominal=mFlowAirSup_nominal,
    redeclare package Medium = MediumAir)
                                        annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=0,
        origin={-20,-60})));
  IBPSA.Fluid.HeatExchangers.ConstantEffectiveness
                                       cooCoi(
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    from_dp2=false,
    dp2_nominal=0,
    redeclare package Medium1 = MediumAir,
    redeclare package Medium2 = MediumCooCoi,
    m1_flow_nominal=mFlowAirSup_nominal,
    m2_flow_nominal=mFlowWatCooCoi_nominal,
    dp1_nominal=0,
    eps=0.85)
    "Cooling coil"
    annotation (Placement(transformation(extent={{-50,-76},{-70,-56}})));
  IBPSA.Fluid.HeatExchangers.DryCoilEffectivenessNTU
                                       heaCoi(
    m2_flow_nominal=mFlowAirSup_nominal,
    redeclare package Medium2 = MediumAir,
    m1_flow_nominal=mFlowWatHeaCoi_nominal,
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    dp2_nominal=620,
    dp1_nominal=0,
    redeclare package Medium1 = MediumHeaCoi,
    configuration=IBPSA.Fluid.Types.HeatExchangerConfiguration.CounterFlow,
    Q_flow_nominal=QHeaCoi_nominal,
    T_a2_nominal=THeaCoiAirSup_nominal,
    T_a1_nominal=THeaCoiWatSup_nominal)
    annotation (Placement(transformation(extent={{50,-56},{70,-76}})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort senTemSup(
    allowFlowReversal=false,
    m_flow_nominal=10,
    tau=0,
    redeclare package Medium = MediumAir) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-84,-60})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort senTemHea(
    allowFlowReversal=false,
    m_flow_nominal=10,
    tau=0,
    redeclare package Medium = MediumAir) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={38,-60})));
  IDEAS.Fluid.Sensors.TemperatureTwoPort senTemRecMix(
    allowFlowReversal=false,
    m_flow_nominal=10,
    tau=0,
    redeclare package Medium = MediumAir)
    "Temperature sensor after heat recovery unit, mixed" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-40,-60})));
  Modelica.Blocks.Interfaces.RealOutput TOutHea annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-110})));
  Modelica.Blocks.Interfaces.RealOutput TOutCoo annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-96,-110})));
  IBPSA.Fluid.HeatExchangers.ConstantEffectiveness
                                hexUA(
    redeclare package Medium2 = MediumAir,
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    from_dp2=false,
    redeclare package Medium1 = MediumAir,
    m1_flow_nominal=mFlowAirSup_nominal,
    dp2_nominal=0,
    m2_flow_nominal=mFlowAirRet_nominal,
    dp1_nominal=277,
    from_dp1=false,
    eps=0.7)   "Heat recovery wheel"
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
equation
  heatPort.T=273.15;

  connect(threeWayValveMotor.port_1, spl.port_2)
    annotation (Line(points={{-10,-60},{14,-60}}, color={0,127,255}));
  connect(heaCoi.port_a2, port_a2) annotation (Line(points={{70,-60},{86,-60},{
          86,-60},{100,-60}}, color={0,127,255}));
  connect(heaCoi.port_b1, portHeaCoi_b1)
    annotation (Line(points={{70,-72},{80,-72},{80,-100}}, color={0,127,255}));
  connect(heaCoi.port_a1, portHeaCoi_a1)
    annotation (Line(points={{50,-72},{40,-72},{40,-100}}, color={0,127,255}));
  connect(senTemSup.port_b, port_b2)
    annotation (Line(points={{-90,-60},{-100,-60}}, color={0,127,255}));
  connect(senTemHea.port_b, spl.port_1)
    annotation (Line(points={{32,-60},{26,-60}}, color={0,127,255}));
  connect(senTemHea.port_a, heaCoi.port_b2)
    annotation (Line(points={{44,-60},{50,-60}}, color={0,127,255}));
  connect(senTemRecMix.port_a, threeWayValveMotor.port_2)
    annotation (Line(points={{-34,-60},{-30,-60}}, color={0,127,255}));
  connect(senTemHea.T, TOutHea) annotation (Line(points={{38,-66.6},{38,-80},{
          20,-80},{20,-110}}, color={0,0,127}));
  connect(senTemSup.T, TOutCoo) annotation (Line(points={{-84,-66.6},{-84,-74},
          {-96,-74},{-96,-110}}, color={0,0,127}));
  connect(hexUA.port_b1, port_b1)
    annotation (Line(points={{10,16},{10,60},{100,60}}, color={0,127,255}));
  connect(hexUA.port_a1, port_a1)
    annotation (Line(points={{-10,16},{-10,60},{-100,60}}, color={0,127,255}));
  connect(hexUA.port_b2, threeWayValveMotor.port_3)
    annotation (Line(points={{-10,4},{-20,4},{-20,-50}}, color={0,127,255}));
  connect(spl.port_3, hexUA.port_a2)
    annotation (Line(points={{20,-54},{20,4},{10,4}}, color={0,127,255}));
  connect(threeWayValveMotor.ctrl, signalBus.TW_bypass) annotation (Line(points=
         {{-20,-70.8},{-20,-80},{-34,-80},{-34,80},{-80,80},{-80,100}}, color={
          0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(portCooCoi_a1, cooCoi.port_a2) annotation (Line(points={{-80,-100},{
          -80,-72},{-70,-72}}, color={0,127,255}));
  connect(portCooCoi_b1, cooCoi.port_b2) annotation (Line(points={{-40,-100},{
          -42,-100},{-42,-72},{-50,-72}}, color={0,127,255}));
  connect(senTemSup.port_a, cooCoi.port_b1)
    annotation (Line(points={{-78,-60},{-70,-60}}, color={0,127,255}));
  connect(cooCoi.port_a1, senTemRecMix.port_b)
    annotation (Line(points={{-50,-60},{-46,-60}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,58},{-40,18},{0,-22},{40,18},{0,58}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,60},{-26,60},{0,34},{26,60},{98,60}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{100,-62},{26,-62},{26,-26},{0,0},{-28,-28},{-28,-62},{-100,
              -62}},
          color={0,0,0},
          smooth=Smooth.None),
        Rectangle(
          extent={{-76,-36},{-50,-86}},
          lineColor={0,128,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{52,-34},{78,-84}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{58,-50},{70,-72}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="+"),
        Text(
          extent={{-76,-48},{-50,-70}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="-"),
        Line(
          points={{-38,-60},{-38,-84},{0,-100}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Text(
          extent={{-42,-40},{-32,-60}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash,
          textString="T"),
        Text(
          extent={{-74,-82},{-48,-104}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="-"),
        Text(
          extent={{54,-82},{66,-104}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="+")}),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end AHU_baseline;
