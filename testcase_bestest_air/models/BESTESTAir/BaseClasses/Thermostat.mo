within BESTESTAir.BaseClasses;
model Thermostat
  "Implements basic control of FCU to maintain zone air temperature"
  parameter Modelica.SIunits.Temperature TSupSetCoo=273.15+13 "Cooling supply air temperature setpoint";
  parameter Modelica.SIunits.Temperature TSupSetHea=273.15+35 "Heating supply air temperature setpoint";
  Modelica.Blocks.Interfaces.RealInput TZon "Measured zone air temperature"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput yFan "Fan control signal"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealInput TSetHea
    "Heating temperature setpoint for zone air"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput TSetCoo
    "Cooling temperature setpoint for zone air"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
  Buildings.Controls.Continuous.LimPID heaPID(controllerType=Modelica.Blocks.Types.SimpleController.P,
      k=5) "Heating control signal"
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Buildings.Controls.Continuous.LimPID cooPID(
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    reverseAction=true,
    k=5) "Cooling control signal"
    annotation (Placement(transformation(extent={{-40,70},{-20,90}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-8,-30},{12,-10}})));
  Modelica.Blocks.Interfaces.RealOutput TSupSet
    "Supply air temperature setpoint"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Logical.Switch TSupSwitch
    "Switch between heating and cooling mode"
    annotation (Placement(transformation(extent={{30,10},{50,30}})));
  Modelica.Blocks.Sources.Constant TSupSetCooCon(k=TSupSetCoo)
    "Cooling supply air temperature setpoint"
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Sources.Constant TSupSetHeaCon(k=TSupSetHea)
    "Heating supply air temperature setpoint"
    annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold
    annotation (Placement(transformation(extent={{-6,70},{14,90}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1
    annotation (Placement(transformation(extent={{-6,30},{14,50}})));
  Modelica.Blocks.Logical.Switch deaSwitch
    "Switch between deadband and heating or cooling"
    annotation (Placement(transformation(extent={{70,10},{90,30}})));
  Modelica.Blocks.Logical.Not notCoo
    annotation (Placement(transformation(extent={{30,60},{50,80}})));
  Modelica.Blocks.Logical.Not notHea
    annotation (Placement(transformation(extent={{30,40},{50,60}})));
  Modelica.Blocks.Logical.And andDea
    annotation (Placement(transformation(extent={{70,50},{90,70}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveTSupSetCooCon(u(
      min=273.15 + 12,
      max=273.15 + 18,
      unit="K"), description="Supply air temperature setpoint for cooling")
    annotation (Placement(transformation(extent={{-34,-60},{-14,-40}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveTSetHeaCon(u(
      min=273.15 + 30,
      max=273.15 + 40,
      unit="K"), description="Supply air temperature setpoint for heating")
    annotation (Placement(transformation(extent={{-34,-100},{-14,-80}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveFan(u(
      min=0,
      max=1,
      unit="1"), description="Fan speed control signal")
    annotation (Placement(transformation(extent={{52,-30},{72,-10}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveTSetCoo(u(
      min=273.15 + 23,
      max=273.15 + 30,
      unit="K"), description="Zone temperature setpoint for cooling")
    annotation (Placement(transformation(extent={{-92,70},{-72,90}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite oveTSetHea(u(
      min=273.15 + 15,
      max=273.15 + 23,
      unit="K"), description="Zone temperature setpoint for heating")
    annotation (Placement(transformation(extent={{-92,30},{-72,50}})));
  IBPSA.Utilities.IO.SignalExchange.Read reaTSetCoo(
    description="Zone air temperature setpoint for cooling",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="K"))
    annotation (Placement(transformation(extent={{-66,70},{-46,90}})));
  IBPSA.Utilities.IO.SignalExchange.Read reaTSetHea(
    description="Zone air temperature setpoint for heating",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="K"))
    annotation (Placement(transformation(extent={{-66,30},{-46,50}})));
equation
  connect(TZon, heaPID.u_m)
    annotation (Line(points={{-120,0},{-30,0},{-30,28}}, color={0,0,127}));
  connect(TZon, cooPID.u_m) annotation (Line(points={{-120,0},{-44,0},{-44,58},
          {-30,58},{-30,68}},color={0,0,127}));
  connect(cooPID.y, add.u1) annotation (Line(points={{-19,80},{-16,80},{-16,-14},
          {-10,-14}}, color={0,0,127}));
  connect(heaPID.y, add.u2) annotation (Line(points={{-19,40},{-10,40},{-10,-26}},
                      color={0,0,127}));
  connect(cooPID.y, greaterThreshold.u)
    annotation (Line(points={{-19,80},{-8,80}},  color={0,0,127}));
  connect(heaPID.y, greaterThreshold1.u)
    annotation (Line(points={{-19,40},{-8,40}},  color={0,0,127}));
  connect(greaterThreshold.y, TSupSwitch.u2) annotation (Line(points={{15,80},{
          22,80},{22,20},{28,20}},
                                color={255,0,255}));
  connect(deaSwitch.y, TSupSet)
    annotation (Line(points={{91,20},{110,20}}, color={0,0,127}));
  connect(notCoo.y, andDea.u1) annotation (Line(points={{51,70},{60,70},{60,60},
          {68,60}}, color={255,0,255}));
  connect(notHea.y, andDea.u2) annotation (Line(points={{51,50},{60,50},{60,52},
          {68,52}}, color={255,0,255}));
  connect(andDea.y, deaSwitch.u2) annotation (Line(points={{91,60},{94,60},{94,40},
          {60,40},{60,20},{68,20}}, color={255,0,255}));
  connect(greaterThreshold1.y, notHea.u) annotation (Line(points={{15,40},{20,
          40},{20,50},{28,50}},
                           color={255,0,255}));
  connect(greaterThreshold.y, notCoo.u) annotation (Line(points={{15,80},{22,80},
          {22,70},{28,70}}, color={255,0,255}));
  connect(TZon, deaSwitch.u1) annotation (Line(points={{-120,0},{56,0},{56,28},
          {68,28}},color={0,0,127}));
  connect(TSupSwitch.y, deaSwitch.u3) annotation (Line(points={{51,20},{58,20},{
          58,12},{68,12}}, color={0,0,127}));
  connect(TSupSetCooCon.y, oveTSupSetCooCon.u)
    annotation (Line(points={{-59,-50},{-36,-50}}, color={0,0,127}));
  connect(oveTSupSetCooCon.y, TSupSwitch.u1) annotation (Line(points={{-13,-50},
          {18,-50},{18,28},{28,28}}, color={0,0,127}));
  connect(TSupSetHeaCon.y, oveTSetHeaCon.u)
    annotation (Line(points={{-59,-90},{-36,-90}}, color={0,0,127}));
  connect(oveTSetHeaCon.y, TSupSwitch.u3) annotation (Line(points={{-13,-90},{
          20,-90},{20,12},{28,12}}, color={0,0,127}));
  connect(add.y, oveFan.u)
    annotation (Line(points={{13,-20},{50,-20}}, color={0,0,127}));
  connect(oveFan.y, yFan)
    annotation (Line(points={{73,-20},{110,-20}}, color={0,0,127}));
  connect(TSetCoo, oveTSetCoo.u)
    annotation (Line(points={{-120,80},{-94,80}}, color={0,0,127}));
  connect(oveTSetCoo.y, reaTSetCoo.u)
    annotation (Line(points={{-71,80},{-68,80}}, color={0,0,127}));
  connect(cooPID.u_s, reaTSetCoo.y)
    annotation (Line(points={{-42,80},{-45,80}}, color={0,0,127}));
  connect(TSetHea, oveTSetHea.u)
    annotation (Line(points={{-120,40},{-94,40}}, color={0,0,127}));
  connect(oveTSetHea.y, reaTSetHea.u)
    annotation (Line(points={{-71,40},{-68,40}}, color={0,0,127}));
  connect(heaPID.u_s, reaTSetHea.y)
    annotation (Line(points={{-42,40},{-45,40}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-60,60},{62,-60}},
          lineColor={0,0,0},
          fillColor={0,140,72},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-24,24},{26,-16}},
          lineColor={255,255,255},
          fillColor={0,140,72},
          fillPattern=FillPattern.Solid,
          textStyle={TextStyle.Bold},
          textString="T"),              Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=
            false)));
end Thermostat;
