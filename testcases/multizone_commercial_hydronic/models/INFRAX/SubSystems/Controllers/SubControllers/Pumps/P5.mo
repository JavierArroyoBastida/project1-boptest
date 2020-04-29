within INFRAX.SubSystems.Controllers.SubControllers.Pumps;
model P5 "hydraulic pumps logic p05"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{120,
            20}}), iconTransformation(extent={{92,-10},{112,10}})));
  outer IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Tables.CombiTable1D cooCurve_TABS(table=[273.15 + 10,
        273.15 + 19; 273.15 + 15,273.15 + 20; 273.15 + 18,273.15 + 20;
        273.15 + 23,273.15 + 21; 273.15 + 30,273.15 + 19])
    "Infrax TABS cooling curve"
    annotation (Placement(transformation(extent={{-64,40},{-44,60}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=273.15 + 21, uMin=273.15 + 19)
    annotation (Placement(transformation(extent={{-36,40},{-16,60}})));
  IDEAS.Controls.Continuous.LimPID conP05(
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Td=0,
    reverseAction=true,
    k=10,
    Ti(displayUnit="s") = 45) "Controller for TABS pump"
    annotation (Placement(transformation(extent={{72,40},{92,60}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Math.BooleanToReal compensationFactor(realTrue=1.5, realFalse=
       0.5) "compensation factor computation"
    annotation (Placement(transformation(extent={{-8,-40},{12,-20}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{24,-40},{44,-20}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-20})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-4,34},{16,54}})));
  Modelica.Blocks.Math.Max dewProt "dew protection"
    annotation (Placement(transformation(extent={{26,40},{46,60}})));
  Modelica.Blocks.Sources.RealExpression DewPoiThre(y=sim.TDewPoi + 3)
    "dew point temperature threshold"
    annotation (Placement(transformation(extent={{-4,60},{16,80}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{60,70},{80,90}})));
  Modelica.Blocks.Math.BooleanToReal cooModReal(realTrue=1, realFalse=0)
    "compensation factor computation"
    annotation (Placement(transformation(extent={{28,78},{44,94}})));
  IDEAS.Controls.ControlHeating.RunningMeanTemperatureEN15251 rmot
    annotation (Placement(transformation(extent={{-96,40},{-76,60}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "TABS supply cooling temperature", u(
      min=289.15,
      max=297.15,
      unit="K"))
    annotation (Placement(transformation(extent={{52,44},{64,56}})));
equation

  connect(dataBus.T17, conP05.u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,20},{82,20},{82,38}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(compensationFactor.u, greaterThreshold.y)
    annotation (Line(points={{-10,-30},{-19,-30}}, color={255,0,255}));
  connect(compensationFactor.y, product.u1) annotation (Line(points={{13,-30},{16,
          -30},{16,-24},{22,-24}}, color={0,0,127}));
  connect(signalBus.baseSetpoint, feedback.u1) annotation (Line(
      points={{100,0},{-60,0},{-60,-12}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.Tavg_building, feedback.u2) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-68,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(feedback.y, greaterThreshold.u)
    annotation (Line(points={{-60,-29},{-60,-30},{-42,-30}}, color={0,0,127}));
  connect(feedback.y, product.u2) annotation (Line(points={{-60,-29},{-60,-50},{
          16,-50},{16,-36},{22,-36}}, color={0,0,127}));
  connect(add.u1, limiter.y)
    annotation (Line(points={{-6,50},{-15,50}}, color={0,0,127}));
  connect(cooCurve_TABS.y[1], limiter.u)
    annotation (Line(points={{-43,50},{-38,50}}, color={0,0,127}));
  connect(product.y, add.u2) annotation (Line(points={{45,-30},{56,-30},{56,-6},
          {-14,-6},{-14,38},{-6,38}}, color={0,0,127}));
  connect(add.y, dewProt.u2)
    annotation (Line(points={{17,44},{24,44}}, color={0,0,127}));
  connect(DewPoiThre.y, dewProt.u1) annotation (Line(points={{17,70},{20,70},{20,
          56},{24,56}}, color={0,0,127}));
  connect(conP05.y, product1.u2) annotation (Line(points={{93,50},{94,50},
          {94,66},{44,66},{44,74},{58,74}}, color={0,0,127}));
  connect(product1.y, signalBus.P05_mod) annotation (Line(points={{81,80},
          {100,80},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(cooModReal.y, product1.u1)
    annotation (Line(points={{44.8,86},{58,86}}, color={0,0,127}));
  connect(signalBus.coolMode, cooModReal.u) annotation (Line(
      points={{100,0},{100,100},{8,100},{8,86},{26.4,86}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(rmot.TRm, cooCurve_TABS.u[1])
    annotation (Line(points={{-75.4,50},{-66,50}}, color={0,0,127}));
  connect(dewProt.y, overwrite.u)
    annotation (Line(points={{47,50},{50.8,50}}, color={0,0,127}));
  connect(overwrite.y, conP05.u_s)
    annotation (Line(points={{64.6,50},{70,50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),                                       Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="P5")}),    Diagram(coordinateSystem(preserveAspectRatio=false)));
end P5;
