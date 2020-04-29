within INFRAX.SubSystems.Controllers.SubControllers.Situations;
model Situations
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  SituationSelector sitSel
    "Control logic that decides how the cooling tower is working depending on the situation"
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
  SituationActions comCon
    "signals to the different components of the cooling tower system"
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  CoolingTower cooTowCon
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  OverwriteBoolean overwriteBoolean2(
    description="Heat dissipattion boolean",
    min=0,
    max=1,
    unit="1")
    annotation (Placement(transformation(extent={{-36,2},{-32,6}})));
  OverwriteBoolean overwriteBoolean1(
    description="Relief borefield load boolean",
    min=0,
    max=1,
    unit="1")
    annotation (Placement(transformation(extent={{-34,-4},{-30,0}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-20,-12},{-14,-6}})));
equation
  connect(dataBus, sitSel.dataBus) annotation (Line(
      points={{-100,0},{-80,0},{-62,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(sitSel.signalBus, signalBus) annotation (Line(
      points={{-41.8,0},{-24,0},{-24,36},{100,36},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(cooTowCon.sit1, comCon.sit1) annotation (Line(points={{7.2,-30},{
          8,-30},{8,-20},{-26,-20},{-26,4},{0,4}}, color={255,0,255}));
  connect(dataBus, cooTowCon.dataBus) annotation (Line(
      points={{-100,0},{-100,0},{-100,-40},{0,-40}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(cooTowCon.signalBus, signalBus) annotation (Line(
      points={{20.2,-40},{60,-40},{100,-40},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(comCon.p10, signalBus.P10_signal) annotation (Line(points={{21,6},
          {56,6},{98,6},{98,4},{98,0},{100,0},{100,0}}, color={255,127,0}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(comCon.p11, signalBus.P11_signal) annotation (Line(points={{21,2},
          {100,2},{100,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(comCon.twv_cc, signalBus.CC_2way_signal) annotation (Line(points=
          {{21,-2},{94,-2},{94,0},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(comCon.twv_hex, signalBus.Hex_2way_signal) annotation (Line(
        points={{21,-6},{100,-6},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(sitSel.sit1, overwriteBoolean2.u) annotation (Line(points={{-41,2},
          {-38,2},{-38,4},{-36.4,4}}, color={255,0,255}));
  connect(overwriteBoolean2.y, comCon.sit1)
    annotation (Line(points={{-31.6,4},{0,4}}, color={255,0,255}));
  connect(overwriteBoolean1.y, cooTowCon.sit2) annotation (Line(points={{
          -29.6,-2},{-10,-2},{-10,-18},{11,-18},{11,-30}}, color={255,0,255}));
  connect(overwriteBoolean1.y, comCon.sit2) annotation (Line(points={{-29.6,
          -2},{-16,-2},{-16,0},{0,0}}, color={255,0,255}));
  connect(sitSel.sit2, overwriteBoolean1.u)
    annotation (Line(points={{-41,-2},{-34.4,-2}}, color={255,0,255}));
  connect(booleanConstant.y, comCon.sit3) annotation (Line(points={{-13.7,
          -9},{-8.85,-9},{-8.85,-4},{0,-4}}, color={255,0,255}));
  connect(cooTowCon.sit3, booleanConstant.y) annotation (Line(points={{15,
          -30},{15,-12},{-13.7,-12},{-13.7,-9}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
                                                                         Text(
          extent={{-96,86},{96,-76}},
          lineColor={28,108,200},
          textString="Cooling
Tower")}),                                                       Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Situations;
