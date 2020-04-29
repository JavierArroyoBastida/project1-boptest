within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model ThreeWayValveTABS "controller of the mixing 3-way valve of TABS"
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Controls.Continuous.LimPID     con3WayHea(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Td=0,
    k=5,
    Ti(displayUnit="min") = 60,
    y_start=1)                  "Controller for 3-way valve"
    annotation (Placement(transformation(extent={{26,40},{46,60}})));
  Modelica.Blocks.Tables.CombiTable1D heaCurve_TABS(table=[273.15 - 8,
        273.15 + 26; 273.15,273.15 + 23.5; 273.15 + 5,273.15 + 22.5;
        273.15 + 15,273.15 + 21])
    "Infrax TABS heating curve"
    annotation (Placement(transformation(extent={{-66,40},{-46,60}})));
  Modelica.Blocks.Sources.Constant cooMode(k=1)
    "In cooling mode, valve is opened"
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Logical.Switch heaCheck "Checking if heating mode"
    annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  Modelica.Blocks.Logical.Switch neutralCheck
    annotation (Placement(transformation(extent={{52,16},{72,-4}})));
  Modelica.Blocks.Sources.Constant restMode(k=0)
    "In neutral mode valve is closed"
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=273.15 + 30, uMin=273.15
         + 23)
    annotation (Placement(transformation(extent={{-36,40},{-16,60}})));
  IDEAS.Controls.ControlHeating.RunningMeanTemperatureEN15251 rmot
    annotation (Placement(transformation(extent={{-96,40},{-76,60}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "TABS supply heating temperature", u(
      min=293.15,
      max=313.15,
      unit="K"))
    annotation (Placement(transformation(extent={{0,44},{12,56}})));
equation

  connect(signalBus.heatMode, heaCheck.u2) annotation (Line(
      points={{100,0},{100,20},{-24,20},{-24,-2},{-12,-2}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));

  connect(neutralCheck.y, signalBus.TABS_3way_signal) annotation (Line(
        points={{73,6},{100,6},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(signalBus.restMode, neutralCheck.u2) annotation (Line(
      points={{100,0},{100,20},{20,20},{20,6},{50,6}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(heaCheck.y, neutralCheck.u3) annotation (Line(points={{11,-2},{
          30,-2},{30,14},{50,14}}, color={0,0,127}));
  connect(restMode.y, neutralCheck.u1) annotation (Line(points={{21,-50},
          {40,-50},{40,-2},{50,-2}}, color={0,0,127}));
  connect(cooMode.y, heaCheck.u3)
    annotation (Line(points={{-39,-10},{-12,-10}}, color={0,0,127}));
  connect(dataBus.T24, con3WayHea.u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,26},{36,26},{36,38}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(con3WayHea.y, heaCheck.u1) annotation (Line(points={{47,50},{50,
          50},{50,24},{-18,24},{-18,6},{-12,6}}, color={0,0,127}));
  connect(limiter.u, heaCurve_TABS.y[1])
    annotation (Line(points={{-38,50},{-45,50}}, color={0,0,127}));
  connect(limiter.y, signalBus.T_TABS) annotation (Line(points={{-15,50},
          {-8,50},{-8,82},{100,82},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(rmot.TRm, heaCurve_TABS.u[1])
    annotation (Line(points={{-75.4,50},{-68,50}}, color={0,0,127}));
  connect(limiter.y, overwrite.u)
    annotation (Line(points={{-15,50},{-1.2,50}}, color={0,0,127}));
  connect(overwrite.y, con3WayHea.u_s)
    annotation (Line(points={{12.6,50},{24,50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ThreeWayValveTABS;
