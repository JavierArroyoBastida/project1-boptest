within INFRAX.SubSystems.Controllers.SubControllers.Pumps;
model P7off "P07 turning off conditions"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{120,
            20}}), iconTransformation(extent={{92,-10},{112,10}})));
  outer IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Components.Clock
                clock
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=273.15 + 24)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Logical.And conditions
    annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=if (((clock.day
         == 6 or clock.day == 7) and (clock.hour == 0 or clock.hour == 1
         or clock.hour == 3 or clock.hour == 4 or clock.hour == 6 or clock.hour
         == 7 or clock.hour == 9 or clock.hour == 10 or clock.hour == 12
         or clock.hour == 13 or clock.hour == 15 or clock.hour == 16 or
        clock.hour == 18 or clock.hour == 19 or clock.hour == 21 or clock.hour
         == 22)) or ((clock.day == 1 or clock.day == 2 or clock.day == 3
         or clock.day == 4 or clock.day == 5) and (clock.hour == 21 or
        clock.hour == 22 or clock.hour == 0 or clock.hour == 1 or clock.hour
         == 3 or clock.hour == 4))) and conditions.y == true then 0 else 1)
    annotation (Placement(transformation(extent={{0,-66},{20,-46}})));
  Modelica.Blocks.Interfaces.RealOutput onoff_gain
    annotation (Placement(transformation(extent={{100,-44},{120,-24}})));
equation

  connect(dataBus.Tavg_building, lessThreshold.u) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-30},{-62,-30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(lessThreshold.y, conditions.u2) annotation (Line(points={{-39,-30},
          {-32,-30},{-32,-18},{-22,-18}}, color={255,0,255}));
  connect(signalBus.coolMode, conditions.u1) annotation (Line(
      points={{100,0},{100,20},{-30,20},{-30,-10},{-22,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(realExpression.y, onoff_gain) annotation (Line(points={{21,-56},{
          62,-56},{62,-34},{110,-34}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),                                       Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="P7_off")}),Diagram(coordinateSystem(preserveAspectRatio=false)));
end P7off;
