within INFRAX.SubSystems.Controllers.SubControllers;
model HP_ByPass "On/Off Logic for the HPs according to baseline"

  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
//  Modelica.Blocks.Sources.RealExpression hpMod(y=HP1.y + HP2.y)
//    "fake modulation level of the GSHP, used for control logic of the borefield pump"
//    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Math.IntegerToBoolean HP2_boolean(threshold=1)
    annotation (Placement(transformation(extent={{-92,64},{-80,76}})));
  Modelica.Blocks.Math.IntegerToBoolean HP1_boolean(threshold=1)
    annotation (Placement(transformation(extent={{-92,64},{-80,52}})));
  Modelica.Blocks.MathBoolean.Not HPValByp
    annotation (Placement(transformation(extent={{-34,32},{-26,40}})));
  Modelica.Blocks.Logical.Or HPVal
    annotation (Placement(transformation(extent={{-56,14},{-44,26}})));
equation
      //  connect(hpMod.y, signalBus.HP_mod)
      // annotation (Line(points={{81,60},{100,60},{
  //        100,0}}, color={0,0,127}), Text(
    //  string="%second",
  //    index=1,
  //    extent={{6,3},{6,3}},
  //    horizontalAlignment=TextAlignment.Left));
  connect(HPVal.y, HPValByp.u) annotation (Line(points={{-43.4,20},{-40,20},{
          -40,36},{-35.6,36}}, color={255,0,255}));
  connect(signalBus.HP1_signal, HP1_boolean.u) annotation (Line(
      points={{100,0},{100,100},{-100,100},{-100,58},{-93.2,58}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(signalBus.HP2_signal, HP2_boolean.u) annotation (Line(
      points={{100,0},{100,100},{-100,100},{-100,70},{-93.2,70}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(HP1_boolean.y, HPVal.u2) annotation (Line(points={{-79.4,58},{-64,
          58},{-64,15.2},{-57.2,15.2}}, color={255,0,255}));
  connect(HP2_boolean.y, HPVal.u1) annotation (Line(points={{-79.4,70},{-60,
          70},{-60,20},{-57.2,20}}, color={255,0,255}));
  connect(HPValByp.y, signalBus.HPByPas) annotation (Line(points={{-25.2,36},
          {100,36},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HPVal.y, signalBus.HPVal) annotation (Line(points={{-43.4,20},{100,
          20},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HP1_boolean.y, signalBus.HP1Val) annotation (Line(points={{-79.4,58},
          {100,58},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HP2_boolean.y, signalBus.HP2Val) annotation (Line(points={{-79.4,70},
          {100,70},{100,0}}, color={255,0,255}), Text(
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
          textString="ByPass")}),
                              Diagram(coordinateSystem(preserveAspectRatio=
            false)));
end HP_ByPass;
