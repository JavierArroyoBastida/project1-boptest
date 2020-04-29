within INFRAX.SubSystems.Controllers.SubControllers;
model NightVentilation "night ventilation RBC"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));

  Modelica.Blocks.Sources.BooleanExpression on_off(y=if (clock.hour >= 0 and
        clock.hour < 5) or clock.hour > 22 then true else false)
    "Time zone for which the night ventilation can be activated"
    annotation (Placement(transformation(extent={{-60,66},{-40,86}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(
      threshold=273.15 + 10)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis(uLow=1, uHigh=3)
    annotation (Placement(transformation(extent={{-30,0},{-10,20}})));
  Modelica.Blocks.MathBoolean.And nv1(nu=4)
    "First activation of night ventilation"
    annotation (Placement(transformation(extent={{0,50},{20,70}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis1(uLow=273.15 + 24.5,
                                                                   uHigh=
        273.15 + 25.5)
    annotation (Placement(transformation(extent={{-30,-34},{-10,-14}})));
  Modelica.Blocks.MathBoolean.And nv2(nu=4)
    "Second activation of night ventilation"
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.StateGraph.Step
                  stab(
    nOut=2,
    nIn=1)                "stabilization period"
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={60,-20})));
  Modelica.StateGraph.TransitionWithSignal
                        transitionWithSignal(      waitTime=86400)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={60,40})));
  Modelica.StateGraph.InitialStep
                  no_nv(
    nOut=1,
    nIn=1)                "night ventilation off"
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={60,60})));
  Modelica.StateGraph.StepWithSignal
                  nv_1(
    nOut=1,
    nIn=1)             "night ventilation 1"
    annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={60,20})));
  Modelica.StateGraph.StepWithSignal
                  nv_2(
    nOut=1,
    nIn=1)             "night ventilation 2"
    annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={60,-60})));
  Modelica.StateGraph.TransitionWithSignal
                        T2(                        waitTime=86400)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={60,0})));
  Modelica.StateGraph.TransitionWithSignal
                        T3(enableTimer=true,
    waitTime=15*60)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={60,-40})));
  Modelica.Blocks.Logical.Hysteresis hysteresis2(uLow=273.15 + 24, uHigh=
        273.15 + 25)
    annotation (Placement(transformation(extent={{-30,-60},{-10,-40}})));
  Modelica.StateGraph.TransitionWithSignal
                        T4(enableTimer=true,
    waitTime=15*60)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={80,-30})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{40,-36},{52,-24}})));
  Modelica.StateGraph.Step
                  wait(
    nOut=1,
    nIn=2)             "wait till next day"
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={80,-86})));
  Modelica.StateGraph.Transition
                        T5(enableTimer=true,
    waitTime=6*3600)
    annotation (Placement(transformation(extent={{4,4},{-4,-4}},
        rotation=-90,
        origin={140,-84})));
  Modelica.Blocks.Logical.Not not2
    annotation (Placement(transformation(extent={{38,-6},{50,6}})));
  Modelica.StateGraph.TransitionWithSignal
                        T6(enableTimer=true,
    waitTime=15*60)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={60,-76})));
  Modelica.Blocks.Logical.Not not3
    annotation (Placement(transformation(extent={{38,-82},{50,-70}})));
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{74,14},{86,26}})));
  Modelica.Blocks.Interfaces.BooleanOutput NightVentilation
    annotation (Placement(transformation(extent={{100,-12},{120,8}})));
  Components.Clock           clock
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.RealExpression Te(y=sim.Te) "External temperature"
    annotation (Placement(transformation(extent={{-94,40},{-74,60}})));
equation

  connect(dataBus.Tavg_building, add.u1) annotation (Line(
      points={{-99.9,0.1},{-82,0.1},{-82,16},{-62,16}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(add.y, hysteresis.u) annotation (Line(points={{-39,10},{-39,10},{
          -32,10}},  color={0,0,127}));
  connect(dataBus.Tavg_building, hysteresis1.u) annotation (Line(
      points={{-99.9,0.1},{-82,0.1},{-82,-24},{-32,-24}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(no_nv.outPort[1], transitionWithSignal.inPort)
    annotation (Line(points={{60,55.8},{60,41.6},{60,41.6}}, color={0,0,0}));
  connect(transitionWithSignal.outPort, nv_1.inPort[1])
    annotation (Line(points={{60,39.4},{60,24.4},{60,24.4}}, color={0,0,0}));
  connect(nv_1.outPort[1], T2.inPort)
    annotation (Line(points={{60,15.8},{60,12},{60,1.6},{60,1.6}},
                                                color={0,0,0}));
  connect(T2.outPort, stab.inPort[1])
    annotation (Line(points={{60,-0.6},{60,-15.6},{60,-15.6}},
                                                        color={0,0,0}));
  connect(stab.outPort[1], T3.inPort)
    annotation (Line(points={{60.1,-24.2},{60,-30},{60,-38.4}},
                                                            color={0,0,0}));
  connect(dataBus.Tavg_building, hysteresis2.u) annotation (Line(
      points={{-99.9,0.1},{-92,0.1},{-82,0.1},{-82,-50},{-32,-50}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(T3.outPort, nv_2.inPort[1])
    annotation (Line(points={{60,-40.6},{60,-55.6},{60,-55.6}},
                                                            color={0,0,0}));
  connect(nv2.y, not1.u) annotation (Line(points={{21.5,40},{30,40},{30,-30},
          {38.8,-30}}, color={255,0,255}));
  connect(T4.outPort, wait.inPort[1])
    annotation (Line(points={{80,-30.6},{80,-81.6},{80.2,-81.6}},
                                                          color={0,0,0}));
  connect(wait.outPort[1], T5.inPort) annotation (Line(points={{80,-90.2},{80,
          -100},{140,-100},{140,-85.6}},
                                       color={0,0,0}));
  connect(T5.outPort, no_nv.inPort[1]) annotation (Line(points={{140,-83.4},{
          140,-83.4},{140,72},{60,72},{60,64.4}},
                                              color={0,0,0}));
  connect(nv1.y, not2.u) annotation (Line(points={{21.5,60},{34,60},{34,0},{
          36,0},{36.8,0}},                      color={255,0,255}));
  connect(nv2.y, not3.u) annotation (Line(points={{21.5,40},{28,40},{28,-76},
          {36.8,-76}}, color={255,0,255}));
  connect(T6.inPort, nv_2.outPort[1]) annotation (Line(points={{60,-74.4},{60,
          -64.2},{60,-64.2}}, color={0,0,0}));
  connect(T6.outPort, wait.inPort[2]) annotation (Line(points={{60,-76.6},{60,
          -76.6},{60,-81.6},{79.8,-81.6}},
                                   color={0,0,0}));
  connect(stab.outPort[2], T4.inPort) annotation (Line(points={{59.9,-24.2},{
          70,-24.2},{70,-28.4},{80,-28.4}},
                                     color={0,0,0}));
  connect(on_off.y, nv1.u[1]) annotation (Line(points={{-39,76},{-20,76},{-20,
          65.25},{0,65.25}}, color={255,0,255}));
  connect(on_off.y, nv2.u[1]) annotation (Line(points={{-39,76},{-20,76},{-20,
          45.25},{0,45.25}}, color={255,0,255}));
  connect(greaterEqualThreshold.y, nv1.u[2]) annotation (Line(points={{-39,50},
          {-36,50},{-36,61.75},{0,61.75}}, color={255,0,255}));
  connect(greaterEqualThreshold.y, nv2.u[2]) annotation (Line(points={{-39,50},
          {-20,50},{-20,41.75},{0,41.75}}, color={255,0,255}));
  connect(hysteresis.y, nv1.u[3]) annotation (Line(points={{-9,10},{-10,10},{
          -10,58.25},{0,58.25}}, color={255,0,255}));
  connect(hysteresis.y, nv2.u[3])
    annotation (Line(points={{-9,10},{0,10},{0,38.25}}, color={255,0,255}));
  connect(hysteresis1.y, nv1.u[4]) annotation (Line(points={{-9,-24},{-6,-24},
          {-6,54.75},{0,54.75}}, color={255,0,255}));
  connect(hysteresis2.y, nv2.u[4]) annotation (Line(points={{-9,-50},{-10,-50},
          {-10,-50},{-10,-50},{0,-50},{0,34.75}}, color={255,0,255}));
  connect(or1.y, NightVentilation) annotation (Line(points={{86.6,20},{86.6,
          -2},{110,-2}}, color={255,0,255}));
  connect(Te.y, greaterEqualThreshold.u)
    annotation (Line(points={{-73,50},{-62,50}}, color={0,0,127}));
  connect(Te.y, add.u2) annotation (Line(points={{-73,50},{-68,50},{-68,4},{
          -62,4}}, color={0,0,127}));
  connect(nv_1.active, or1.u1)
    annotation (Line(points={{64.4,20},{72.8,20}}, color={255,0,255}));
  connect(nv_2.active, or1.u2) annotation (Line(points={{64.4,-60},{72.8,-60},
          {72.8,15.2}}, color={255,0,255}));
  connect(transitionWithSignal.condition, nv1.y) annotation (Line(points={{
          55.2,40},{38,40},{38,60},{21.5,60}}, color={255,0,255}));
  connect(T2.condition, not2.y) annotation (Line(points={{55.2,8.88178e-16},{
          52.6,8.88178e-16},{52.6,0},{50.6,0}}, color={255,0,255}));
  connect(T3.condition, nv2.y) annotation (Line(points={{55.2,-40},{24,-40},{
          24,40},{21.5,40}}, color={255,0,255}));
  connect(not1.y, T4.condition)
    annotation (Line(points={{52.6,-30},{75.2,-30}}, color={255,0,255}));
  connect(T6.condition, not3.y)
    annotation (Line(points={{55.2,-76},{50.6,-76}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end NightVentilation;
