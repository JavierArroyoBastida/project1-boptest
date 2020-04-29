within INFRAX.SubSystems.Controllers.SubControllers.Situations;
model SituationSelector
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Logical.GreaterThreshold activeCoolingSetPoint(threshold=
        273.15 + 5)  "set point to activate active cooling"
    annotation (Placement(transformation(extent={{14,-96},{34,-76}})));
  Modelica.Blocks.Interfaces.BooleanOutput sit1
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput sit2
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.BooleanOutput sit3
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(
    uLow=273.15 + 38,
    uHigh=273.15 + 40,
    pre_y_start=false)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=273.15 + 38)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Logical.Hysteresis       activeCoolingSetPoint1(uLow=
        273.15 + 12, uHigh=273.15 + 15)
                     "set point to activate active cooling"
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Blocks.Logical.And and2
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Logical.And and3
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Blocks.Logical.And and4
    annotation (Placement(transformation(extent={{14,-62},{34,-42}})));
  Modelica.Blocks.Logical.And and5
    annotation (Placement(transformation(extent={{44,-88},{64,-68}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Buildings.Components.Interfaces.WeaBus weaBus(numSolBus=5)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-60,-96},{-40,-76}})));
  Modelica.Blocks.Logical.And and6
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Modelica.Blocks.Logical.And and7
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  Modelica.Blocks.Logical.And and8
    annotation (Placement(transformation(extent={{74,-70},{94,-50}})));
  Modelica.Blocks.Math.IntegerToBoolean integerToBoolean
    annotation (Placement(transformation(extent={{4,-6},{-8,6}})));
equation
  connect(dataBus.T14, hysteresis.u) annotation (Line(
      points={{-99.9,0.1},{-99.9,20},{-62,20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(hysteresis.y, and1.u1)
    annotation (Line(points={{-39,20},{-39,20},{-22,20}},
                                                 color={255,0,255}));
  connect(dataBus.T14, lessThreshold.u) annotation (Line(
      points={{-99.9,0.1},{-99.9,-10},{-62,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(lessThreshold.y, and2.u1) annotation (Line(points={{-39,-10},{-32,
          -10},{-32,-30},{-22,-30}}, color={255,0,255}));
  connect(activeCoolingSetPoint1.y, and2.u2) annotation (Line(points={{-39,
          -40},{-30,-40},{-30,-38},{-22,-38}}, color={255,0,255}));
  connect(and2.y, and3.u2) annotation (Line(points={{1,-30},{8,-30},{8,-28},{
          18,-28}}, color={255,0,255}));
  connect(sim.weaBus, weaBus) annotation (Line(
      points={{-81,93},{-78,93},{-78,70},{-70,70}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(weaBus.Te, add.u2) annotation (Line(
      points={{-69.95,70.05},{-73.95,70.05},{-73.95,-92},{-62,-92}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(add.y, activeCoolingSetPoint.u) annotation (Line(points={{-39,-86},
          {-14,-86},{12,-86}}, color={0,0,127}));
  connect(activeCoolingSetPoint.y, and5.u2) annotation (Line(points={{35,
          -86},{35,-86},{42,-86}}, color={255,0,255}));
  connect(not1.y, and4.u2)
    annotation (Line(points={{1,-60},{12,-60}}, color={255,0,255}));
  connect(and4.u1, and2.y) annotation (Line(points={{12,-52},{8,-52},{8,-30},
          {1,-30}}, color={255,0,255}));
  connect(and4.y, and5.u1) annotation (Line(points={{35,-52},{38,-52},{38,
          -62},{38,-78},{42,-78}}, color={255,0,255}));
  connect(and1.y, and6.u1)
    annotation (Line(points={{1,20},{10,20},{18,20}}, color={255,0,255}));
  connect(signalBus.coolMode, and6.u2) annotation (Line(
      points={{100,0},{56,0},{10,0},{10,12},{18,12}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(and6.y, sit1)
    annotation (Line(points={{41,20},{110,20}}, color={255,0,255}));
  connect(and7.y, sit2) annotation (Line(points={{81,-20},{110,-20},{110,
          -20}}, color={255,0,255}));
  connect(and5.y, and8.u2) annotation (Line(points={{65,-78},{68,-78},{68,
          -68},{72,-68}}, color={255,0,255}));
  connect(and8.y, sit3) annotation (Line(points={{95,-60},{110,-60},{110,
          -60}}, color={255,0,255}));
  connect(signalBus.coolMode, and8.u1) annotation (Line(
      points={{100,0},{76,0},{52,0},{52,-60},{72,-60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(and3.y, and7.u1) annotation (Line(points={{41,-20},{50,-20},{58,
          -20}}, color={255,0,255}));
  connect(signalBus.coolMode, and7.u2) annotation (Line(
      points={{100,0},{76,0},{52,0},{52,-28},{58,-28}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T7, activeCoolingSetPoint1.u) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-42},{-99.9,-40},{-62,-40}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T7, add.u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-82},{-99.9,-80},{-62,-80}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(signalBus.HP1_signal, integerToBoolean.u) annotation (Line(
      points={{100,0},{5.2,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(integerToBoolean.y, and1.u2) annotation (Line(points={{-8.6,0},{
          -26,0},{-26,12},{-22,12}}, color={255,0,255}));
  connect(integerToBoolean.y, not1.u) annotation (Line(points={{-8.6,0},{
          -26,0},{-26,-60},{-22,-60}}, color={255,0,255}));
  connect(and3.u1, not1.u) annotation (Line(points={{18,-20},{8,-20},{8,-12},
          {-26,-12},{-26,-60},{-22,-60}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SituationSelector;
