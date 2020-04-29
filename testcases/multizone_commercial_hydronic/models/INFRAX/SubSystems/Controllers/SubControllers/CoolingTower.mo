within INFRAX.SubSystems.Controllers.SubControllers;
model CoolingTower "CoolingTower PID"

  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Sources.Constant TSetLea(k=273.15 + 29)
    "Setpoint for leaving temperature"
                 annotation (Placement(transformation(extent={{-78,-60},{-58,
            -40}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Utilities.Psychrometrics.TWetBul_TDryBulXi wetBul(redeclare package
      Medium = IDEAS.Media.Air)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  IDEAS.Buildings.Components.Interfaces.WeaBus weaBus(numSolBus=5)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant Patm(k=101325)
    annotation (Placement(transformation(extent={{-80,36},{-68,48}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{24,-68},{44,-48}})));
  Modelica.Blocks.Sources.Constant off(k=0) "off cooling tower"
    annotation (Placement(transformation(extent={{-20,-100},{0,-80}})));
  Modelica.Blocks.Interfaces.BooleanInput sit1
    annotation (Placement(transformation(extent={{20,-20},{-20,20}},
        rotation=90,
        origin={-28,100})));
  Modelica.Blocks.Interfaces.BooleanInput sit2
    annotation (Placement(transformation(extent={{20,-20},{-20,20}},
        rotation=90,
        origin={10,100})));
  Modelica.Blocks.Interfaces.BooleanInput sit3
    annotation (Placement(transformation(extent={{20,-20},{-20,20}},
        rotation=90,
        origin={50,100})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=sit1 or sit2
         or sit3)
    annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
  IDEAS.Controls.Continuous.LimPID conFan(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=2,
    Ti=40) annotation (Placement(transformation(extent={{-24,-60},{-4,-40}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "Cooling tower leaving water temperature set-point", u(
      min=288.15,
      max=323.15,
      unit="K"))
    annotation (Placement(transformation(extent={{-48,-56},{-36,-44}})));
equation
  connect(sim.weaBus, weaBus) annotation (Line(
      points={{-81,93},{-78,93},{-78,70},{-70,70}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(weaBus.Te, wetBul.TDryBul) annotation (Line(
      points={{-69.95,70.05},{-56,70.05},{-56,58},{-41,58}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(weaBus.X_wEnv, wetBul.Xi[1]) annotation (Line(
      points={{-69.95,70.05},{-56,70.05},{-56,50},{-41,50}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(wetBul.TWetBul, signalBus.Twet) annotation (Line(points={{-19,50},{
          100,50},{100,0},{100,0}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(Patm.y, wetBul.p) annotation (Line(points={{-67.4,42},{-67.4,42},{
          -41,42}}, color={0,0,127}));
  connect(switch1.y, signalBus.CT_signal) annotation (Line(points={{45,-58},{
          70,-58},{100,-58},{100,0}},       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(off.y, switch1.u3) annotation (Line(points={{1,-90},{10,-90},{10,
          -66},{22,-66}}, color={0,0,127}));
  connect(booleanExpression.y, switch1.u2) annotation (Line(points={{-43,0},{
          -16,0},{8,0},{8,-58},{22,-58}}, color={255,0,255}));
  connect(conFan.y, switch1.u1)
    annotation (Line(points={{-3,-50},{22,-50}}, color={0,0,127}));
  connect(conFan.u_m, dataBus.T27) annotation (Line(points={{-14,-62},{-14,
          -74},{-99.9,-74},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(TSetLea.y, overwrite.u)
    annotation (Line(points={{-57,-50},{-49.2,-50}}, color={0,0,127}));
  connect(overwrite.y, conFan.u_s)
    annotation (Line(points={{-35.4,-50},{-26,-50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="CT")}), Diagram(coordinateSystem(preserveAspectRatio=
            false)));
end CoolingTower;
