within INFRAX.SubSystems.Controllers.SubControllers.Valves.BaseClasses;
model TwoWayValveCCA
  "controller of the two way valve in the ground floor of TABS"
  import INFRAX;

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},
            {-80,20}}),iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Utilities.Math.Average FloorAvg
    "Average temperature of the floor zones"
    annotation (Placement(transformation(extent={{-90,-30},{-70,-10}})));
  Modelica.Blocks.Tables.CombiTable1D floorSetPoint(table=[1,3; 2,2; 3,1])
    "TABS temperature difference setpoint (per floor)"
    annotation (Placement(transformation(extent={{-8,-18},{12,2}})));
  IDEAS.Controls.Continuous.LimPID valvePID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=1,
    Ti(displayUnit="min") = 1800,
    y_start=1,
    reverseAction=true,
    yMin=0.05)
    annotation (Placement(transformation(extent={{36,-18},{56,2}})));
  Modelica.Blocks.Math.Add deltaTABS(k2=-1)
    "TABS temperature difference (per floor)"
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Blocks.Logical.Switch neutralCheck
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  Modelica.Blocks.Sources.Constant neutralOpen(k=0.2)
    "Valve opening in neutral mode or absence of demand"
    annotation (Placement(transformation(extent={{20,12},{40,32}})));
  Modelica.Blocks.Math.Add deltaSetPoint(k2=-1)
    "Base setpoint and floor average temperature difference"
    annotation (Placement(transformation(extent={{-60,-18},{-40,2}})));
  Modelica.Blocks.Math.Abs abs "Absolute value of deltaTABS"
    annotation (Placement(transformation(extent={{0,-80},{20,-60}})));
  Modelica.Blocks.Math.Abs abs1
                               "Absolute value of deltaTABS"
    annotation (Placement(transformation(extent={{-32,-18},{-12,2}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "TABS temperature difference set-point", u(
      min=-5,
      max=5,
      unit="K"))
    annotation (Placement(transformation(extent={{18,-14},{30,-2}})));
equation
  connect(dataBus.T24, deltaTABS.u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-64},{-42,-64}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));

  connect(FloorAvg.y, deltaSetPoint.u2) annotation (Line(points={{-69,-20},
          {-68,-20},{-68,-14},{-62,-14}}, color={0,0,127}));
  connect(deltaTABS.y, abs.u)
    annotation (Line(points={{-19,-70},{-2,-70}}, color={0,0,127}));
  connect(abs.y, valvePID.u_m) annotation (Line(points={{21,-70},{46,-70},
          {46,-20}}, color={0,0,127}));
  connect(valvePID.y, neutralCheck.u3) annotation (Line(points={{57,-8},{
          66,-8}},                                   color={0,0,127}));
  connect(neutralOpen.y, neutralCheck.u1) annotation (Line(points={{41,22},
          {42,22},{42,8},{66,8}}, color={0,0,127}));
  connect(signalBus.restMode, neutralCheck.u2) annotation (Line(
      points={{100,0},{100,-20},{58,-20},{58,0},{66,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(signalBus.baseSetpoint, deltaSetPoint.u1) annotation (Line(
      points={{100,0},{100,40},{-70,40},{-70,-2},{-62,-2}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(deltaSetPoint.y, abs1.u)
    annotation (Line(points={{-39,-8},{-34,-8}}, color={0,0,127}));
  connect(abs1.y, floorSetPoint.u[1])
    annotation (Line(points={{-11,-8},{-10,-8}},color={0,0,127}));
  connect(floorSetPoint.y[1], overwrite.u)
    annotation (Line(points={{13,-8},{16.8,-8}}, color={0,0,127}));
  connect(overwrite.y, valvePID.u_s)
    annotation (Line(points={{30.6,-8},{34,-8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TwoWayValveCCA;
