within INFRAX.SubSystems.Controllers.SubControllers.Pumps;
model P1 "hydraulic pumps logic"

  Modelica.Blocks.Tables.CombiTable1D P1_HP_off(table=[-5,0.30; 0,0.1; 5,
        0.70]) "P1 action if HP is off"
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{120,
            20}}), iconTransformation(extent={{92,-10},{112,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{52,10},{72,-10}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{0,-20},{20,-40}})));
  Modelica.Blocks.Sources.Constant twoHPs(k=0.8) "two HPs working"
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Sources.Constant oneHP(k=0.55) "only one HP working"
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Math.RealToBoolean HPAreOn(threshold=1.5) "Both HP are on"
    annotation (Placement(transformation(extent={{40,-70},{20,-50}})));
  Modelica.Blocks.Math.RealToBoolean HPIsOn(threshold=0.5)
    "At least one HP is on"
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=1, uMin=0)
    annotation (Placement(transformation(extent={{10,40},{30,60}})));
  Modelica.Blocks.MathBoolean.Or  Off(nu=3) "multiple off conditions"
    annotation (Placement(transformation(extent={{44,54},{56,66}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{68,54},{80,66}})));
  Modelica.Blocks.Logical.Switch isOffCheck "P01 is off"
    annotation (Placement(transformation(extent={{66,22},{84,40}})));
  Modelica.Blocks.Sources.Constant off(k=0) "HPs are off"
    annotation (Placement(transformation(extent={{52,34},{60,42}})));
  Modelica.Blocks.Math.IntegerToReal realToInteger[2]
    annotation (Placement(transformation(extent={{94,-70},{74,-50}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{64,-68},{48,-52}})));
  Modelica.Blocks.Math.IntegerToBoolean P04signal "Check if P04 is on"
    annotation (Placement(transformation(extent={{78,76},{68,86}})));
  Modelica.Blocks.Math.RealToBoolean    P05signal(threshold=0.01)
                                                  "Check if P06 is on"
    annotation (Placement(transformation(extent={{78,88},{68,98}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "evaporator pump speed", u(
      min=0,
      max=1,
      unit="1"))
    annotation (Placement(transformation(extent={{90,28},{96,34}})));
equation
  connect(dataBus.T1, add.u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,56},{-52,56}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T7, add.u2) annotation (Line(
      points={{-99.9,0.1},{-99.9,44},{-52,44}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(add.y, P1_HP_off.u[1])
    annotation (Line(points={{-29,50},{-22,50}}, color={0,0,127}));
  connect(oneHP.y, switch2.u3) annotation (Line(points={{-39,-10},{-12,-10},{-12,
          -22},{-2,-22}}, color={0,0,127}));
  connect(twoHPs.y, switch2.u1) annotation (Line(points={{-39,-50},{-12,-50},{-12,
          -38},{-2,-38}}, color={0,0,127}));
  connect(switch2.y, switch1.u1) annotation (Line(points={{21,-30},{30,-30},
          {40,-30},{40,-8},{50,-8}},
                                 color={0,0,127}));
  connect(HPAreOn.y, switch2.u2) annotation (Line(points={{19,-60},{-20,-60},{-20,
          -30},{-2,-30}}, color={255,0,255}));
  connect(HPIsOn.y, switch1.u2)
    annotation (Line(points={{33,0},{50,0}}, color={255,0,255}));
  connect(P1_HP_off.y[1], limiter.u)
    annotation (Line(points={{1,50},{8,50}}, color={0,0,127}));
  connect(limiter.y, switch1.u3)
    annotation (Line(points={{31,50},{40,50},{40,8},{50,8}}, color={0,0,127}));
  connect(Off.y, not1.u)
    annotation (Line(points={{56.9,60},{66.8,60}}, color={255,0,255}));

  connect(not1.y, isOffCheck.u2) annotation (Line(points={{80.6,60},{86,60},
          {86,46},{50,46},{50,31},{64.2,31}},
                                          color={255,0,255}));
  connect(off.y, isOffCheck.u1) annotation (Line(points={{60.4,38},{65.25,
          38},{65.25,38.2},{64.2,38.2}},
                              color={0,0,127}));
  connect(switch1.y, isOffCheck.u3) annotation (Line(points={{73,0},{80,0},
          {80,16},{60,16},{60,23.8},{64.2,23.8}},
                                          color={0,0,127}));
  connect(realToInteger[1].u, signalBus.HP1_signal) annotation (Line(points={{96,
          -60},{100,-60},{100,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(realToInteger[2].u, signalBus.HP2_signal) annotation (Line(points={{96,
          -60},{100,-60},{100,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HPAreOn.u, add1.y)
    annotation (Line(points={{42,-60},{47.2,-60}}, color={0,0,127}));
  connect(realToInteger[1].y, add1.u1) annotation (Line(points={{73,-60},{70,-60},
          {70,-55.2},{65.6,-55.2}}, color={0,0,127}));
  connect(realToInteger[2].y, add1.u2) annotation (Line(points={{73,-60},{70,-60},
          {70,-64.8},{65.6,-64.8}}, color={0,0,127}));
  connect(add1.y,HPIsOn. u) annotation (Line(points={{47.2,-60},{46,-60},{46,-16},
          {0,-16},{0,0},{10,0}}, color={0,0,127}));
  connect(HPIsOn.y, Off.u[1]) annotation (Line(points={{33,0},{38,0},{38,
          62.8},{44,62.8}}, color={255,0,255}));
  connect(P04signal.u, signalBus.P04_signal) annotation (Line(points={{79,
          81},{100,81},{100,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P04signal.y, Off.u[2]) annotation (Line(points={{67.5,81},{44,81},
          {44,60}}, color={255,0,255}));
  connect(P05signal.y, Off.u[3]) annotation (Line(points={{67.5,93},{44,93},
          {44,57.2}}, color={255,0,255}));
  connect(P05signal.u, signalBus.P05_mod) annotation (Line(points={{79,93},
          {100,93},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(isOffCheck.y, overwrite.u) annotation (Line(points={{84.9,31},{
          87.45,31},{87.45,31},{89.4,31}}, color={0,0,127}));
  connect(overwrite.y, signalBus.P0102_mod) annotation (Line(points={{96.3,
          31},{96.3,32},{100,32},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),                                       Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="P1")}),    Diagram(coordinateSystem(preserveAspectRatio=false)));
end P1;
