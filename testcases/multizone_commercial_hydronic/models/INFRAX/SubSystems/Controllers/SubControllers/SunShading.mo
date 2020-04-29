within INFRAX.SubSystems.Controllers.SubControllers;
model SunShading "sunshading control"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));

  Modelica.Blocks.Sources.BooleanExpression east_on(y=if clock.hour > 7 and
        clock.hour < 13 then true else false)
    "Time frame for which the east windows can activate the shading device"
    annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=
       10)
    annotation (Placement(transformation(extent={{8,-40},{28,-20}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Buildings.Components.Interfaces.WeaBus weaBus(numSolBus=5)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Math.Add altAng(k2=-1) "Altitude angle of sun"
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow=273.15 + 21, uHigh=
        273.15 + 22.5)
    "External temperature for which the shading device can be on"
    annotation (Placement(transformation(extent={{-32,-20},{-12,0}})));
  Modelica.Blocks.MathBoolean.And east2nd(nu=2)
    annotation (Placement(transformation(extent={{40,80},{60,100}})));
  Modelica.Blocks.Sources.BooleanExpression south_on(y=if clock.hour > 10
         and clock.hour < 19 then true else false)
    "Time frame for which the south windows can activate the shading device"
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  Modelica.Blocks.Sources.BooleanExpression west_on(y=if clock.hour > 14 and
        clock.hour < 20 then true else false)
    "Time frame for which the west windows can activate the shading device"
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Sources.Constant ninety_degrees(k=Modelica.Constants.pi/2)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Math.Gain radiansToDegrees(k=180/Modelica.Constants.pi)
    annotation (Placement(transformation(extent={{-14,-54},{-6,-46}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(threshold=
       20)
    annotation (Placement(transformation(extent={{8,-80},{28,-60}})));
  Modelica.Blocks.MathBoolean.And south(nu=2)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.MathBoolean.And west(nu=2)
    annotation (Placement(transformation(extent={{40,40},{60,60}})));
  Modelica.Blocks.Logical.LessEqualThreshold    greaterEqualThreshold2(threshold=
       30)
    annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
  Modelica.Blocks.Logical.LessEqualThreshold    greaterEqualThreshold3(threshold=
       22)
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal
    annotation (Placement(transformation(extent={{-148,-20},{-138,-10}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1
    annotation (Placement(transformation(extent={{-148,10},{-138,20}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal2
    annotation (Placement(transformation(extent={{-148,-6},{-138,4}})));
  Modelica.Blocks.MathBoolean.And east3rd(nu=2)
    annotation (Placement(transformation(extent={{40,100},{60,120}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal3
    annotation (Placement(transformation(extent={{-148,26},{-138,36}})));
  Components.Clock           clock
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Math.Add sum2nd3rd "Altitude angle of sun"
    annotation (Placement(transformation(extent={{-68,-20},{-48,0}})));
  Modelica.Blocks.Math.Gain avg(k=1/2)
    annotation (Placement(transformation(extent={{-44,-14},{-36,-6}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "Shading control of 3rd floor east windows", u(
      min=0,
      max=1,
      unit="1"))
    annotation (Placement(transformation(extent={{-130,26},{-120,36}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite1(description=
        "Shading control of 2nd floor east windows", u(
      min=0,
      max=1,
      unit="1"))
    annotation (Placement(transformation(extent={{-130,10},{-120,20}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite2(description=
        "Shading control of south windows", u(
      min=0,
      max=1,
      unit="1"))
    annotation (Placement(transformation(extent={{-130,-6},{-120,4}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite3(description=
        "Shading control of south windows", u(
      min=0,
      max=1,
      unit="1"))
    annotation (Placement(transformation(extent={{-130,-20},{-120,-10}})));
equation

  connect(ninety_degrees.y, altAng.u1) annotation (Line(points={{-79,-30},{-60,
          -30},{-60,-44},{-42,-44}}, color={0,0,127}));
  connect(altAng.y, radiansToDegrees.u)
    annotation (Line(points={{-19,-50},{-14.8,-50}}, color={0,0,127}));
  connect(west_on.y, west.u[1]) annotation (Line(points={{-19,50},{40,50},{40,
          53.5}},  color={255,0,255}));
  connect(south_on.y, south.u[1]) annotation (Line(points={{-19,70},{40,70},{
          40,73.5}},  color={255,0,255}));
  connect(east_on.y, east2nd.u[1]) annotation (Line(points={{-19,90},{40,90},
          {40,93.5}},  color={255,0,255}));
  connect(hysteresis.y, west.u[2]) annotation (Line(points={{-11,-10},{0,-10},
          {0,46.5},{40,46.5}},                color={255,0,255}));
  connect(hysteresis.y, south.u[2]) annotation (Line(points={{-11,-10},{0,-10},
          {0,66.5},{40,66.5}},   color={255,0,255}));
  connect(hysteresis.y, east2nd.u[2]) annotation (Line(points={{-11,-10},{0,
          -10},{0,86.5},{40,86.5}},
                                 color={255,0,255}));
  connect(radiansToDegrees.y, greaterEqualThreshold.u) annotation (Line(
        points={{-5.6,-50},{0,-50},{0,-30},{6,-30}}, color={0,0,127}));
  connect(radiansToDegrees.y, greaterEqualThreshold2.u) annotation (Line(
        points={{-5.6,-50},{34,-50},{34,-30},{38,-30}}, color={0,0,127}));
  connect(radiansToDegrees.y, greaterEqualThreshold1.u) annotation (Line(
        points={{-5.6,-50},{0,-50},{0,-70},{6,-70}}, color={0,0,127}));
  connect(radiansToDegrees.y, greaterEqualThreshold3.u) annotation (Line(
        points={{-5.6,-50},{-5.6,-50},{34,-50},{34,-70},{38,-70}}, color={0,0,
          127}));
  connect(east2nd.y, booleanToReal1.u) annotation (Line(points={{61.5,90},{62,
          90},{62,104},{-138,104},{-138,15},{-149,15}},            color={255,
          0,255}));
  connect(south.y, booleanToReal2.u) annotation (Line(points={{61.5,70},{61.5,
          102},{-136,102},{-136,-1},{-149,-1}}, color={255,0,255}));
  connect(west.y, booleanToReal.u) annotation (Line(points={{61.5,50},{62,50},
          {62,106},{-140,106},{-140,-15},{-149,-15}},          color={255,0,
          255}));
  connect(east_on.y, east3rd.u[1]) annotation (Line(points={{-19,90},{-8,90},
          {-8,113.5},{40,113.5}},   color={255,0,255}));
  connect(hysteresis.y, east3rd.u[2]) annotation (Line(points={{-11,-10},{-6,
          -10},{-6,106.5},{40,106.5}},   color={255,0,255}));
  connect(east3rd.y, booleanToReal3.u) annotation (Line(points={{61.5,110},{
          61.5,126},{-149,126},{-149,31}}, color={255,0,255}));
  connect(weaBus.angZen, altAng.u2) annotation (Line(
      points={{-69.95,70.05},{-70,70.05},{-70,-56},{-42,-56}},
      color={255,204,51},
      thickness=0.5));
  connect(sim.weaBus, weaBus) annotation (Line(
      points={{-81,93},{-78,93},{-78,70},{-70,70}},
      color={255,204,51},
      thickness=0.5));
  connect(sum2nd3rd.y, avg.u)
    annotation (Line(points={{-47,-10},{-44.8,-10}}, color={0,0,127}));
  connect(sum2nd3rd.u1, dataBus.Tavg_3rdFlr) annotation (Line(points={{-70,-4},
          {-80,-4},{-80,0.1},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(sum2nd3rd.u2, dataBus.Tavg_2ndFlr) annotation (Line(points={{-70,-16},
          {-80,-16},{-80,0.1},{-99.9,0.1}},      color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(hysteresis.u, avg.y)
    annotation (Line(points={{-34,-10},{-35.6,-10}}, color={0,0,127}));
  connect(overwrite.u, booleanToReal3.y)
    annotation (Line(points={{-131,31},{-137.5,31}}, color={0,0,127}));
  connect(overwrite.y, dataBus.eastShading3rd) annotation (Line(points={{
          -119.5,31},{-99.9,31},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(booleanToReal1.y, overwrite1.u)
    annotation (Line(points={{-137.5,15},{-131,15}}, color={0,0,127}));
  connect(overwrite1.y, dataBus.eastShading2nd) annotation (Line(points={{
          -119.5,15},{-119.5,8.5},{-99.9,8.5},{-99.9,0.1}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(overwrite2.u, booleanToReal2.y)
    annotation (Line(points={{-131,-1},{-137.5,-1}}, color={0,0,127}));
  connect(overwrite2.y, dataBus.southShading) annotation (Line(points={{
          -119.5,-1},{-112.75,-1},{-112.75,0.1},{-99.9,0.1}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(overwrite3.u, booleanToReal.y) annotation (Line(points={{-131,-15},
          {-134.5,-15},{-134.5,-15},{-137.5,-15}}, color={0,0,127}));
  connect(overwrite3.y, dataBus.westShading) annotation (Line(points={{-119.5,
          -15},{-99.9,-15},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SunShading;
