within INFRAX.SubSystems.Controllers.SubControllers.Pumps;
model P3 "hydraulic pumps logic"

  Modelica.Blocks.Tables.CombiTable1D P3_HP_off(table=[-5,3*9806.38; 5,10*9806.38])
    "P3 action if HPs are off"
    annotation (Placement(transformation(extent={{-22,-10},{-2,10}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{120,
            20}}), iconTransformation(extent={{92,-10},{112,10}})));
  Modelica.Blocks.Math.Feedback delta "delta T19-T14"
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Logical.Switch HPSwitch
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Sources.Constant setPoiIfHPisOn(k=12*9806.38)
    "only one HP working"
    annotation (Placement(transformation(extent={{-20,36},{0,56}})));
  Modelica.Blocks.Math.IntegerToBoolean hpIsOn
    annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMin=0, uMax=12*9806.38)
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "condenser pump pressure difference", u(
      min=0,
      max=120000,
      unit="Pa"))
    annotation (Placement(transformation(extent={{70,22},{86,38}})));
equation

  connect(delta.y, P3_HP_off.u[1])
    annotation (Line(points={{-31,0},{-24,0}}, color={0,0,127}));
  connect(dataBus.T19, delta.u1) annotation (Line(
      points={{-99.9,0.1},{-72,0.1},{-72,0},{-48,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T14, delta.u2) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-40,-20},{-40,-8}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(setPoiIfHPisOn.y, HPSwitch.u1) annotation (Line(points={{1,46},{
          14,46},{14,38},{38,38}}, color={0,0,127}));
  connect(hpIsOn.y, HPSwitch.u2)
    annotation (Line(points={{-29,30},{38,30}}, color={255,0,255}));
  connect(signalBus.HP1_signal, hpIsOn.u) annotation (Line(
      points={{100,0},{100,80},{-60,80},{-60,30},{-52,30}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(limiter.u, P3_HP_off.y[1])
    annotation (Line(points={{10,0},{-1,0}}, color={0,0,127}));
  connect(limiter.y, HPSwitch.u3) annotation (Line(points={{33,0},{34,0},{
          34,22},{38,22}}, color={0,0,127}));
  connect(HPSwitch.y, overwrite.u)
    annotation (Line(points={{61,30},{68.4,30}}, color={0,0,127}));
  connect(overwrite.y, signalBus.P03_mod) annotation (Line(points={{86.8,30},
          {96,30},{96,0},{100,0}}, color={0,0,127}), Text(
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
          textString="P3")}),    Diagram(coordinateSystem(preserveAspectRatio=false)));
end P3;
