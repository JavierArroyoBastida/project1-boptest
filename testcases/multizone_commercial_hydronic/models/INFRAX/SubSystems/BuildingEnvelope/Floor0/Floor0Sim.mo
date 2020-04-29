within INFRAX.SubSystems.BuildingEnvelope.Floor0;
model Floor0Sim
  extends Floor0(redeclare IDEAS.Fluid.Actuators.Valves.TwoWayPressureIndependent
                                                                   bath_duct(
    allowFlowReversal=false,
    m_flow_nominal=300*1.225/3600,
    redeclare package Medium = Medium,
    from_dp=true,
      dpValve_nominal=50,
      use_inputFilter=false),
    MT1(nPorts=2),
    MT2(nPorts=2),
    bathroomZone(nPorts=2),
    storage(nPorts=2),
    FirstAid(nPorts=2));
  Modelica.Blocks.Sources.Constant                       cav(k=1)
    annotation (Placement(transformation(extent={{-136,56},{-128,64}})));
equation
  connect(cav.y, bath_duct.y) annotation (Line(points={{-127.6,60},{-120,60},{
          -120,58},{-111,58},{-111,66.6}}, color={0,0,127}));
end Floor0Sim;
