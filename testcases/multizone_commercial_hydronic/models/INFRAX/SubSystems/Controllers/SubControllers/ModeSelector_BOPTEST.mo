within INFRAX.SubSystems.Controllers.SubControllers;
model ModeSelector_BOPTEST
  // -1 cooling, 0 rest, 1 heating
  IDEAS.Controls.ControlHeating.RunningMeanTemperatureEN15251 avgExt(TRm(start=
         273.15))                                                    "RMOT"
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=273.15
         + 9)
    annotation (Placement(transformation(extent={{-50,-70},{-30,-50}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=273.15 + 7.95)
    annotation (Placement(transformation(extent={{-50,50},{-30,70}})));
  Modelica.Blocks.Interfaces.BooleanOutput heat
    annotation (Placement(transformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.BooleanOutput rest
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput cool
    annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
  Modelica.StateGraph.StepWithSignal
                  restWait(
    nOut=1,
    nIn=4) annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={56,20})));
  Modelica.StateGraph.InitialStep
                  restDecide(
    nIn=1,
    nOut=3) annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={56,-10})));
  Modelica.StateGraph.Transition
                        transition(enableTimer=true,
                                                   waitTime=86400)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={56,6})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=
       273.15 + 7.95)
    annotation (Placement(transformation(extent={{-50,10},{-30,30}})));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold=
        273.15 + 9)
    annotation (Placement(transformation(extent={{-50,-28},{-30,-8}})));
  Modelica.StateGraph.TransitionWithSignal
                        T3
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=-90,
        origin={20,60})));
  Modelica.StateGraph.TransitionWithSignal
                        transitionWithSignal
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=-90,
        origin={40,8})));
  Modelica.StateGraph.TransitionWithSignal
                        transitionWithSignal4
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={56,-34})));
  Modelica.StateGraph.StepWithSignal
                  coolWait(
    nOut=1,
    nIn=3) annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={56,-52})));
  Modelica.StateGraph.Step
                  coolDecide(
    nIn=1,
    nOut=2) annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={56,-84})));
  Modelica.StateGraph.Transition
                        T5(enableTimer=true,       waitTime=86400)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={56,-66})));
  Modelica.StateGraph.StepWithSignal
                  heatWait(
    nOut=1,
    nIn=3) annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={56,80})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{-14,-2},{6,18}})));
  Modelica.StateGraph.Step
                  heatDecide(
    nIn=1,
    nOut=2) annotation (Placement(transformation(extent={{-4,4},{4,-4}},
        rotation=-90,
        origin={56,50})));
  Modelica.StateGraph.Transition
                        T6(enableTimer=true,       waitTime=86400)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={56,68})));
  Modelica.StateGraph.TransitionWithSignal
                        T7
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={56,38})));
  Modelica.StateGraph.TransitionWithSignal
                        T8
    annotation (Placement(transformation(extent={{14,-66},{22,-74}})));
  Modelica.StateGraph.TransitionWithSignal
                        transitionWithSignal2
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=-90,
        origin={40,-60})));
  Modelica.StateGraph.TransitionWithSignal
                        T10
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},
        rotation=-90,
        origin={40,68})));

  Components.RunningMeanTemperature7to18 runningMeanTemperature7to18_1
    annotation (Placement(transformation(extent={{-92,-40},{-72,-20}})));

initial equation

equation

  connect(avgExt.TRm, greaterThreshold.u) annotation (Line(points={{-71.4,0},{-66,
          0},{-62,0},{-62,-60},{-52,-60}}, color={0,0,127}));

  connect(avgExt.TRm, lessThreshold.u) annotation (Line(points={{-71.4,0},{-62,0},
          {-62,60},{-52,60}},     color={0,0,127}));

  connect(restWait.outPort[1], transition.inPort)
    annotation (Line(points={{56,15.8},{56,7.6},{56,7.6}}, color={0,0,0}));
  connect(transition.outPort, restDecide.inPort[1])
    annotation (Line(points={{56,5.4},{56,-5.6},{56,-5.6}}, color={0,0,0}));
  connect(restDecide.outPort[1], transitionWithSignal4.inPort) annotation (
      Line(points={{55.8667,-14.2},{55.8667,-22},{56,-22},{56,-32.4}}, color=
          {0,0,0}));
  connect(transitionWithSignal4.outPort, coolWait.inPort[1]) annotation (Line(
        points={{56,-34.6},{56,-47.6},{55.7333,-47.6}}, color={0,0,0}));
  connect(coolWait.outPort[1], T5.inPort)
    annotation (Line(points={{56,-56.2},{56,-64.4},{56,-64.4}},
                                                              color={0,0,0}));
  connect(T5.outPort, coolDecide.inPort[1])
    annotation (Line(points={{56,-66.6},{56,-79.6},{56,-79.6}},
                                                            color={0,0,0}));
  connect(greaterEqualThreshold.u, lessThreshold.u) annotation (Line(points={{-52,
          20},{-62,20},{-62,60},{-52,60}}, color={0,0,127}));
  connect(lessEqualThreshold.u, greaterThreshold.u) annotation (Line(points={{-52,
          -18},{-62,-18},{-62,-60},{-52,-60}}, color={0,0,127}));
  connect(restDecide.outPort[2], T3.inPort) annotation (Line(points={{56,
          -14.2},{54,-14.2},{54,-20},{20,-20},{20,18},{20,58.4},{20,58.4}},
                                                                 color={0,0,0}));
  connect(T3.outPort, heatWait.inPort[1]) annotation (Line(points={{20,60.6},
          {20,60.6},{20,96},{55.7333,96},{55.7333,84.4}},
                                                    color={0,0,0}));
  connect(restDecide.outPort[3], transitionWithSignal.inPort) annotation (
      Line(points={{56.1333,-14.2},{50,-14.2},{50,-16},{40,-16},{40,6.4}},
        color={0,0,0}));
  connect(transitionWithSignal.outPort, restWait.inPort[1]) annotation (Line(
        points={{40,8.6},{40,30},{55.7,30},{55.7,24.4}}, color={0,0,0}));
  connect(heatWait.outPort[1], T6.inPort)
    annotation (Line(points={{56,75.8},{56,69.6},{56,69.6}},
                                                           color={0,0,0}));
  connect(T6.outPort, heatDecide.inPort[1])
    annotation (Line(points={{56,67.4},{56,54.4},{56,54.4}},
                                                         color={0,0,0}));
  connect(heatDecide.outPort[1], T7.inPort)
    annotation (Line(points={{55.9,45.8},{55.9,39.6},{56,39.6}},
                                                           color={0,0,0}));
  connect(T7.outPort, restWait.inPort[2])
    annotation (Line(points={{56,37.4},{56,24.4},{55.9,24.4}}, color={0,0,0}));
  connect(lessEqualThreshold.y, and1.u2)
    annotation (Line(points={{-29,-18},{-16,-18},{-16,0}}, color={255,0,255}));
  connect(greaterEqualThreshold.y, and1.u1) annotation (Line(points={{-29,20},{-24,
          20},{-16,20},{-16,8}}, color={255,0,255}));
  connect(coolDecide.outPort[1], T8.inPort) annotation (Line(points={{55.9,
          -88.2},{55.9,-92},{16.4,-92},{16.4,-70}},
                                       color={0,0,0}));
  connect(T8.outPort, restWait.inPort[3]) annotation (Line(points={{18.6,-70},
          {28,-70},{28,-64},{30,-64},{30,30},{56,30},{56,24.4},{56.1,24.4}},
                                                                        color={0,
          0,0}));
  connect(coolDecide.outPort[2], transitionWithSignal2.inPort) annotation (
      Line(points={{56.1,-88.2},{40,-88.2},{40,-61.6}}, color={0,0,0}));
  connect(transitionWithSignal2.outPort, coolWait.inPort[2]) annotation (Line(
        points={{40,-59.4},{40,-59.4},{40,-44},{56,-44},{56,-47.6}}, color={0,
          0,0}));
  connect(T10.outPort, heatWait.inPort[2]) annotation (Line(points={{40,68.6},
          {40,68.6},{40,90},{56,90},{56,84.4}},
                                        color={0,0,0}));
  connect(heatDecide.outPort[2], T10.inPort) annotation (Line(points={{56.1,
          45.8},{50,45.8},{50,46},{40,46},{40,66.4}},
                                              color={0,0,0}));
  connect(heatWait.active, heat) annotation (Line(points={{60.4,80},{98,80},{
          98,50},{110,50}}, color={255,0,255}));
  connect(lessThreshold.y, T3.condition)
    annotation (Line(points={{-29,60},{15.2,60}}, color={255,0,255}));
  connect(T10.condition, T3.condition) annotation (Line(points={{35.2,68},{
          -10,68},{-10,60},{15.2,60}}, color={255,0,255}));
  connect(T7.condition, greaterEqualThreshold.y) annotation (Line(points={{
          51.2,38},{-14,38},{-14,20},{-29,20}}, color={255,0,255}));
  connect(transitionWithSignal.condition, and1.y)
    annotation (Line(points={{35.2,8},{7,8}}, color={255,0,255}));
  connect(T8.condition, lessEqualThreshold.y) annotation (Line(points={{18,
          -65.2},{4,-65.2},{4,-30},{-29,-30},{-29,-18}}, color={255,0,255}));
  connect(transitionWithSignal2.condition, greaterThreshold.y)
    annotation (Line(points={{35.2,-60},{-29,-60}}, color={255,0,255}));
  connect(transitionWithSignal4.condition, greaterThreshold.y) annotation (
      Line(points={{51.2,-34},{12,-34},{12,-60},{-29,-60}}, color={255,0,255}));
  connect(restWait.active, rest) annotation (Line(points={{60.4,20},{82,20},{
          82,0},{110,0}}, color={255,0,255}));
  connect(coolWait.active, cool) annotation (Line(points={{60.4,-52},{86,-52},
          {86,-50},{110,-50}}, color={255,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=31536000,
      Interval=3600,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=15,
      __Dymola_Algorithm="Euler"));
end ModeSelector_BOPTEST;
