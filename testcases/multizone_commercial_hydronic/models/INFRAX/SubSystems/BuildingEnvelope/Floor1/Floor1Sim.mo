within INFRAX.SubSystems.BuildingEnvelope.Floor1;
model Floor1Sim
  extends Floor1(redeclare IDEAS.Fluid.Actuators.Valves.TwoWayPressureIndependent
                                                                   bath_duct(
    allowFlowReversal=false,
    m_flow_nominal=350*1.225/3600,
    redeclare package Medium = Medium,
    from_dp=true,
      show_T=false,
      dpValve_nominal=50),
    hall(nPorts=2),
    meetingRoom2(nPorts=2),
    meetingRoom1(nPorts=2),
    northZone(nPorts=2),
    bathroomZone(nPorts=2));
  Modelica.Blocks.Sources.Constant                       cav(k=1)
    annotation (Placement(transformation(extent={{-136,56},{-128,64}})));
equation
  connect(cav.y, bath_duct.y) annotation (Line(points={{-127.6,60},{-110,60},{
          -110,62},{-95,62},{-95,72.6}}, color={0,0,127}));
end Floor1Sim;
