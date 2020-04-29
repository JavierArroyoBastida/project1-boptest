within INFRAX.SubSystems.Controllers.Components;
model Clock
  "Computation of hour and day assuming time = epoch time stamp +1 day and no daylight savings"
  parameter Modelica.SIunits.Time timZon = 0 "Time zone, GMT+1 = 3600 s";

  Modelica.Blocks.Sources.RealExpression hourExp(y=mod((time + timZon)/3600, 24))
    "Hour computation"
    annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Modelica.Blocks.Interfaces.RealOutput hour "Hour of the day"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Sources.RealExpression weekDayExp(y=1 + mod((time + timZon)/
        86400 + 4, 7)) "Day computation, monday=1, sunday=7"
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Blocks.Interfaces.RealOutput weekDay
    "Day of the week, monday=1, sunday=7"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
equation
  connect(hourExp.y, hour) annotation (Line(points={{1,20},{52,20},{52,20},{110,
          20}}, color={0,0,127}));
  connect(weekDayExp.y, weekDay)
    annotation (Line(points={{1,-20},{110,-20}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255}),
        Ellipse(extent={{-80,80},{80,-80}}, lineColor={160,160,164},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(points={{0,80},{0,60}}, color={160,160,164}),
        Line(points={{80,0},{60,0}}, color={160,160,164}),
        Line(points={{0,-80},{0,-60}}, color={160,160,164}),
        Line(points={{-80,0},{-60,0}}, color={160,160,164}),
        Line(points={{37,70},{26,50}}, color={160,160,164}),
        Line(points={{70,38},{49,26}}, color={160,160,164}),
        Line(points={{71,-37},{52,-27}}, color={160,160,164}),
        Line(points={{39,-70},{29,-51}}, color={160,160,164}),
        Line(points={{-39,-70},{-29,-52}}, color={160,160,164}),
        Line(points={{-71,-37},{-50,-26}}, color={160,160,164}),
        Line(points={{-71,37},{-54,28}}, color={160,160,164}),
        Line(points={{-38,70},{-28,51}}, color={160,160,164}),
        Line(
          points={{0,0},{-50,50}},
          thickness=0.5),
        Line(
          points={{0,0},{40,0}},
          thickness=0.5)}),                                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Clock;
