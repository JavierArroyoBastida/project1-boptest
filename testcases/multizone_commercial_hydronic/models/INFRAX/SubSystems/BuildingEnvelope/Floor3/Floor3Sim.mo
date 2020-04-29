within INFRAX.SubSystems.BuildingEnvelope.Floor3;
model Floor3Sim
  extends Floor3(redeclare IDEAS.Fluid.Actuators.Valves.TwoWayPressureIndependent
                                                                   bath_duct(
    allowFlowReversal=false,
    m_flow_nominal=250*1.225/3600,
    redeclare package Medium = Medium,
    from_dp=true,
      dpValve_nominal=50,
      use_inputFilter=false));
  Modelica.Blocks.Sources.Constant                       cav(k=1)
    annotation (Placement(transformation(extent={{-136,56},{-128,64}})));
equation
  connect(cav.y, bath_duct.y) annotation (Line(points={{-127.6,60},{-95,60},{
          -95,70.6}}, color={0,0,127}));
end Floor3Sim;
