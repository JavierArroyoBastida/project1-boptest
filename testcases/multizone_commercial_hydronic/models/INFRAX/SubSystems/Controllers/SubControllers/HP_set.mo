within INFRAX.SubSystems.Controllers.SubControllers;
model HP_set
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  HP_control hpCon "Control logic of the GSHP"
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  Pumps.P1 p1Con "Control logic of pump 1"
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Pumps.P3 p3Con "Control logic of pump 3"
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  HP_ByPass hP_ByPass
    annotation (Placement(transformation(extent={{-10,-64},{10,-44}})));
equation
  connect(hpCon.dataBus, dataBus) annotation (Line(
      points={{-10,70},{-100,70},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hpCon.signalBus, signalBus) annotation (Line(
      points={{10.2,70},{100,70},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(p1Con.dataBus, dataBus) annotation (Line(
      points={{-10,30},{-100,30},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(p1Con.signalBus, signalBus) annotation (Line(
      points={{10.2,30},{100,30},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(p3Con.dataBus, dataBus) annotation (Line(
      points={{-10,-10},{-100,-10},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(p3Con.signalBus, signalBus) annotation (Line(
      points={{10.2,-10},{100,-10},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(hP_ByPass.signalBus, signalBus) annotation (Line(
      points={{10.2,-54},{100,-54},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HP_set;
