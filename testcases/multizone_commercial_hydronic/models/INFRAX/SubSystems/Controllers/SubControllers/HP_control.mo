within INFRAX.SubSystems.Controllers.SubControllers;
model HP_control "On/Off Logic for the HPs according to baseline"

  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(
    pre_y_start=true,
    uLow=0,
    uHigh=3)          "hysteresis logic for HPs"
    annotation (Placement(transformation(extent={{-30,40},{-10,60}})));
  Modelica.Blocks.Logical.Not not1 "heating mode conditions"
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Logical.GreaterThreshold sleep(threshold=10*60)
    "triggers when 10 minutes passes"
    annotation (Placement(transformation(extent={{10,-60},{30,-40}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis1(
    pre_y_start=true,
    uLow=-1,
    uHigh=1)          "hysteresis logic for HPs"
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Logical.Not not2
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  Modelica.Blocks.Math.BooleanToInteger HP1 "Heat Pump signal 1"
    annotation (Placement(transformation(extent={{60,20},{80,40}})));
  Modelica.Blocks.Math.BooleanToInteger HP2 "Heat Pump signal 2"
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  Modelica.Blocks.Logical.GreaterThreshold sleep1(threshold=273.15 + 18)
    "triggers when 10 minutes passes"
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Logical.And actCooMod "active cooling mode conditions"
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{32,20},{52,40}})));
//  Modelica.Blocks.Sources.RealExpression hpMod(y=HP1.y + HP2.y)
//    "fake modulation level of the GSHP, used for control logic of the borefield pump"
//    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  IDEAS.Utilities.Math.Max max(nin=3) "maximum of the required setpoints"
    annotation (Placement(transformation(extent={{-14,70},{-34,90}})));
  OverwriteInteger overwriteInteger(
    description="HP1 pump signal",
    min=0,
    max=1,
    unit="1") annotation (Placement(transformation(extent={{88,26},{96,34}})));
  OverwriteInteger overwriteInteger1(
    description="HP2 pump signal",
    min=0,
    max=1,
    unit="1")
    annotation (Placement(transformation(extent={{76,-54},{84,-46}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "HP set-point", u(
      min=293.15,
      max=323.15,
      unit="K"))
    annotation (Placement(transformation(extent={{-48,70},{-68,90}})));
equation
  connect(hysteresis.y,not1. u)
    annotation (Line(points={{-9,50},{-2,50}},color={255,0,255}));
  connect(hysteresis.u,add. y)
    annotation (Line(points={{-32,50},{-39,50}},          color={0,0,127}));
  connect(dataBus.T14,add. u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,56},{-62,56}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(sleep.u,timer. y)
    annotation (Line(points={{8,-50},{1,-50}},    color={0,0,127}));
  connect(add.y, hysteresis1.u) annotation (Line(points={{-39,50},{-36,50},{
          -36,32},{-86,32},{-86,-50},{-82,-50}}, color={0,0,127}));
  connect(hysteresis1.y, not2.u)
    annotation (Line(points={{-59,-50},{-52,-50}}, color={255,0,255}));
  connect(not2.y, timer.u)
    annotation (Line(points={{-29,-50},{-22,-50}}, color={255,0,255}));
  connect(sleep.y, HP2.u)
    annotation (Line(points={{31,-50},{38,-50}}, color={255,0,255}));
  connect(dataBus.T2, sleep1.u) annotation (Line(
      points={{-99.9,0.1},{-100,0.1},{-100,10},{-62,10}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(sleep1.y, actCooMod.u1)
    annotation (Line(points={{-39,10},{-22,10}}, color={255,0,255}));
  connect(signalBus.coolMode, actCooMod.u2) annotation (Line(
      points={{100,0},{100,-12},{-32,-12},{-32,2},{-22,2}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(actCooMod.y, or1.u2) annotation (Line(points={{1,10},{24,10},{24,22},{
          30,22}}, color={255,0,255}));
  connect(not1.y, or1.u1) annotation (Line(points={{21,50},{24,50},{24,30},{
          30,30}}, color={255,0,255}));
  connect(or1.y, HP1.u)
    annotation (Line(points={{53,30},{58,30}}, color={255,0,255}));
      //  connect(hpMod.y, signalBus.HP_mod)
      // annotation (Line(points={{81,60},{100,60},{
  //        100,0}}, color={0,0,127}), Text(
    //  string="%second",
  //    index=1,
  //    extent={{6,3},{6,3}},
  //    horizontalAlignment=TextAlignment.Left));
  connect(max.u[2], signalBus.T_AHU_HP) annotation (Line(points={{-12,80},{100,80},{100,
          0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(max.u[3], signalBus.T_VAV) annotation (Line(points={{-12,81.3333},{
          100,81.3333},{100,0}},
               color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(max.u[1], signalBus.T_TABS) annotation (Line(points={{-12,78.6667},
          {100,78.6667},{100,0}},
               color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HP1.y, overwriteInteger.u)
    annotation (Line(points={{81,30},{87.2,30}}, color={255,127,0}));
  connect(overwriteInteger.y, signalBus.HP1_signal) annotation (Line(points={
          {96.8,30},{100,30},{100,0},{100,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(HP2.y, overwriteInteger1.u)
    annotation (Line(points={{61,-50},{75.2,-50}}, color={255,127,0}));
  connect(overwriteInteger1.y, signalBus.HP2_signal) annotation (Line(points=
          {{84.8,-50},{100,-50},{100,0}}, color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(max.y, overwrite.u)
    annotation (Line(points={{-35,80},{-46,80}}, color={0,0,127}));
  connect(overwrite.y, add.u2) annotation (Line(points={{-69,80},{-80,80},{
          -80,44},{-62,44}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="HP")}), Diagram(coordinateSystem(preserveAspectRatio=
            false)));
end HP_control;
