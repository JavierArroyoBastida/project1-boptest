within INFRAX.SubSystems.Controllers.SubControllers;
model TABS "Controls of TABS loop for baseline"

  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Sources.IntegerConstant p7Con(k=1) "P07 is always on"
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  Valves.TwoWayValvesTABS twoWayTABSCon
    "Control logic of TABS two way valves"
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  outer IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},
        {IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Valves.ThreeWayValveTABS threeWayTABSCon
    "Control logic of TABS 3 way valves"
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Pumps.P5 p5Con "Pump for passive cooling"
    annotation (Placement(transformation(extent={{-10,-60},{10,-40}})));
  OverwriteInteger overwriteInteger(
    description="TABS pump signal",
    min=0,
    max=1,
    unit="1") annotation (Placement(transformation(extent={{52,60},{72,80}})));
equation
  connect(twoWayTABSCon.signalBus, signalBus) annotation (Line(
      points={{10.2,30},{100,30},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(twoWayTABSCon.dataBus, dataBus) annotation (Line(
      points={{-10,30},{-100,30},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus, threeWayTABSCon.dataBus) annotation (Line(
      points={{-100,0},{-100,-10},{-10,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(threeWayTABSCon.signalBus, signalBus) annotation (Line(
      points={{10.2,-10},{100,-10},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(dataBus, p5Con.dataBus) annotation (Line(
      points={{-100,0},{-100,-50},{-10,-50}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(p5Con.signalBus, signalBus) annotation (Line(
      points={{10.2,-50},{100,-50},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(p7Con.y, overwriteInteger.u)
    annotation (Line(points={{11,70},{50,70}}, color={255,127,0}));
  connect(overwriteInteger.y, signalBus.P07_signal) annotation (Line(points={
          {74,70},{100,70},{100,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="TABS")}),
                              Diagram(coordinateSystem(preserveAspectRatio=
            false), graphics={Text(
          extent={{0,-94},{0,-84}},
          lineColor={28,108,200},
          fontSize=14,
          textStyle={TextStyle.Bold},
          textString=
              "On-off heating/cooling selector valves are controlled with the mode selector")}));
end TABS;
