within INFRAX.SubSystems.Controllers.SubControllers;
model AHU_control "Controls of AHU loop for baseline"

  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},
        {IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,180},{-80,200}})));
  Modelica.Blocks.Tables.CombiTable1D curve_AHU(table=[273.15 + 0,273.15 + 20;
        273.15 + 10,273.15 + 16])
                            "Infrax AHU heating/cooling curve"
    annotation (Placement(transformation(extent={{-10,166},{10,186}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=273.15 + 23, uMin=273.15 + 15)
    annotation (Placement(transformation(extent={{20,166},{40,186}})));
  Modelica.Blocks.Sources.RealExpression bouT(y=sim.Te) "ambient temperature"
    annotation (Placement(transformation(extent={{-40,166},{-20,186}})));
  Modelica.Blocks.Logical.LessThreshold thermalWheelByPass(threshold=2)
    "thermal wheel by pass switch"
    annotation (Placement(transformation(extent={{16,128},{36,148}})));
  Modelica.Blocks.Math.Feedback feedback
    "temperature difference between AHU supply and extract"
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-32,138})));
  Modelica.Blocks.Math.Abs abs
    annotation (Placement(transformation(extent={{-14,128},{6,148}})));
  IDEAS.Controls.Continuous.LimPID con3wayCoo(
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Td=0,
    k=5,
    Ti(displayUnit="s") = 40,
    reverseAction=true) "Controller for 3-way valve of AHU cooling coil"
    annotation (Placement(transformation(extent={{-10,38},{10,58}})));
  Modelica.Blocks.Tables.CombiTable1D curve_P13(table=[0,0.12; 0.8,0.30; 1,1])
    "pump 13 modulating curve"
    annotation (Placement(transformation(extent={{-38,-2},{-18,18}})));
  Modelica.Blocks.Math.Gain P13_nom(k=14.5*9804.139432)
    "nominal pressure rise of P13"
    annotation (Placement(transformation(extent={{0,-2},{20,18}})));
  IDEAS.Controls.Continuous.LimPID con3wayHea(
    initType=Modelica.Blocks.Types.InitPID.InitialState,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Td=0,
    Ti(displayUnit="s") = 40,
    k=2,
    reverseAction=false) "Controller for 3-way valve of AHU heating coil"
    annotation (Placement(transformation(extent={{-8,-80},{12,-60}})));
  Modelica.Blocks.Math.BooleanToInteger P0809_signal
    "pump 08 and 09 signal, nominal conditions if heating is activated"
    annotation (Placement(transformation(extent={{20,-124},{40,-104}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold
    annotation (Placement(transformation(extent={{-30,-124},{-10,-104}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{-8,-42},{12,-22}})));
  Modelica.Blocks.Logical.GreaterThreshold sleep(threshold=5*60)
    "triggers when 10 minutes passes"
    annotation (Placement(transformation(extent={{20,-42},{40,-22}})));
  Modelica.Blocks.Logical.LessEqualThreshold
                                        lessEqualThreshold
    annotation (Placement(transformation(extent={{-40,-42},{-20,-22}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{52,10},{74,-12}})));
  Modelica.Blocks.Sources.Constant off(k=0)
    annotation (Placement(transformation(extent={{24,-6},{32,2}})));
  Modelica.Blocks.Math.BooleanToInteger P04_signal "pump 04 signal"
    annotation (Placement(transformation(extent={{68,-68},{88,-48}})));
  Modelica.Blocks.Logical.Not not1
    annotation (Placement(transformation(extent={{46,-38},{58,-26}})));
  Modelica.Blocks.Sources.RealExpression
                                   supplySP(y=if ((clock.hour >= 6 and clock.hour
         <= 19) and (clock.weekDay) < 6) or (clock.weekDay < 2 and (clock.hour
         >= 5 and clock.hour <= 6)) or nightVentilation == true then 180
         else 0) "Supply fan pressure difference set-point"
    annotation (Placement(transformation(extent={{-10,-156},{12,-136}})));
  Modelica.Blocks.Sources.RealExpression
                                   extractSP(y=if ((clock.hour >= 6 and clock.hour
         <= 19) and (clock.weekDay) < 6) or (clock.weekDay < 2 and (clock.hour
         >= 5 and clock.hour <= 6)) or nightVentilation == true then 125
         else 0)
    "Extract fan pressure difference set-point"
    annotation (Placement(transformation(extent={{-10,-186},{10,-164}})));
  Components.Clock           clock
    annotation (Placement(transformation(extent={{-100,144},{-80,164}})));
  Modelica.Blocks.Sources.IntegerExpression P08P09signal(y=if (clock.hour >=
        6 and clock.hour <= 19) and (clock.weekDay) < 6 or (clock.weekDay < 2
         and (clock.hour >= 5 and clock.hour <= 6)) then P0809_signal.y else
        0)
    "Pumps 08 and 09 signal"
    annotation (Placement(transformation(extent={{20,-100},{42,-80}})));
  Modelica.Blocks.Sources.IntegerExpression P04signal(y=if (clock.hour >= 6
         and clock.hour <= 19) and (clock.weekDay) < 6 or (clock.weekDay < 2
         and (clock.hour >= 5 and clock.hour <= 6)) then P04_signal.y else 0)
    "pump 04 signal"
    annotation (Placement(transformation(extent={{66,-48},{88,-28}})));
  Modelica.Blocks.Sources.RealExpression
                                   P13signal(y=if (clock.hour >= 6 and clock.hour
         <= 19) and (clock.weekDay) < 6 or (clock.weekDay < 2 and (clock.hour
         >= 5 and clock.hour <= 6)) then switch1.y else 0)
    "Pump 13 signal"
    annotation (Placement(transformation(extent={{52,8},{74,28}})));
  Modelica.Blocks.Tables.CombiTable1D curve_HP(table=[273.15 + 15,273.15 + 24;
        273.15 + 23,273.15 + 32])
    "HP setpoint depending on AHU required temperature"
    annotation (Placement(transformation(extent={{78,166},{98,186}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{16,94},{36,74}})));
  Modelica.Blocks.Sources.Constant bypass(k=1)
    "signal for by-passing the thermal wheel"
    annotation (Placement(transformation(extent={{-42,70},{-34,78}})));
  IDEAS.Controls.Continuous.LimPID con3wayTW(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Td=0,
    k=2,
    Ti(displayUnit="s") = 40,
    reverseAction=false)
    "Controller for 3-way valve of AHU themal wheel"
    annotation (Placement(transformation(extent={{-26,100},{-6,120}})));
  Modelica.Blocks.Math.Feedback feedback1
    "temperature difference between AHU supply and extract"
                                         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-56,90})));
  Modelica.Blocks.Math.Abs abs1
    annotation (Placement(transformation(extent={{-34,84},{-22,96}})));
  Modelica.Blocks.Sources.Constant diff_sp(k=0)
    "setpoint both for heating and cooling"
    annotation (Placement(transformation(extent={{-48,104},{-36,116}})));
  Modelica.Blocks.Interfaces.BooleanInput nightVentilation
    "night ventilation active"
    annotation (Placement(transformation(extent={{-120,-170},{-80,-130}})));
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{36,98},{16,118}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite(description=
        "AHU supply temperature set-point", u(
      min=288.15,
      max=297.15,
      unit="K"))
    annotation (Placement(transformation(extent={{48,170},{60,182}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite1(description=
        "AHU recovery by-pass", u(
      min=0,
      max=1,
      unit="1"))
    annotation (Placement(transformation(extent={{58,78},{70,90}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite2(description=
        "AHU supply differential pressure", u(
      min=0,
      max=300,
      unit="Pa"))
    annotation (Placement(transformation(extent={{52,-152},{64,-140}})));
  IBPSA.Utilities.IO.SignalExchange.Overwrite overwrite3(description=
        "AHU supply differential pressure", u(
      min=0,
      max=300,
      unit="Pa"))
    annotation (Placement(transformation(extent={{62,-180},{74,-168}})));
equation

    connect(con3wayCoo.y, signalBus.CooCoi_3way_signal) annotation (Line(points={{11,48},
          {100,48},{100,0}},        color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
    connect(con3wayHea.y, signalBus.HeaCoi_3way_signal) annotation (Line(points={{13,-70},
          {100,-70},{100,0}},         color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));

  connect(curve_AHU.y[1], limiter.u)
    annotation (Line(points={{11,176},{18,176}}, color={0,0,127}));
  connect(bouT.y, curve_AHU.u[1])
    annotation (Line(points={{-19,176},{-12,176}}, color={0,0,127}));
  connect(dataBus.TAirSupplyAHU, feedback.u1) annotation (Line(
      points={{-99.9,0.1},{-100,0.1},{-100,138},{-40,138}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TAirExtractAHU, feedback.u2) annotation (Line(
      points={{-99.9,0.1},{-99.9,52},{-100,52},{-100,126},{-32,126},{-32,130}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(feedback.y, abs.u)
    annotation (Line(points={{-23,138},{-16,138}}, color={0,0,127}));
  connect(abs.y, thermalWheelByPass.u)
    annotation (Line(points={{7,138},{14,138}},  color={0,0,127}));
  connect(dataBus.TAirSupplyAHU, con3wayCoo.u_m) annotation (Line(
      points={{-99.9,0.1},{-100,0.1},{-100,28},{0,28},{0,36}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(con3wayCoo.y, curve_P13.u[1]) annotation (Line(points={{11,48},{20,
          48},{20,24},{-46,24},{-46,8},{-40,8}},
                                               color={0,0,127}));
  connect(P13_nom.u, curve_P13.y[1])
    annotation (Line(points={{-2,8},{-17,8}},   color={0,0,127}));
  connect(con3wayHea.u_s, con3wayCoo.u_s) annotation (Line(points={{-10,-70},
          {-72,-70},{-72,48},{-12,48}},
                                   color={0,0,127}));
  connect(dataBus.TAirSupplyAHU, con3wayHea.u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-54},{-100,-54},{-100,-92},{2,-92},{2,-82}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(con3wayHea.y, greaterThreshold.u) annotation (Line(points={{13,-70},
          {18,-70},{18,-96},{-40,-96},{-40,-114},{-32,-114}},
                                                        color={0,0,127}));
  connect(greaterThreshold.y, P0809_signal.u)
    annotation (Line(points={{-9,-114},{18,-114}},
                                                 color={255,0,255}));
  connect(sleep.u,timer. y)
    annotation (Line(points={{18,-32},{13,-32}},  color={0,0,127}));
  connect(con3wayCoo.y, lessEqualThreshold.u) annotation (Line(points={{11,48},
          {20,48},{20,24},{-46,24},{-46,-32},{-42,-32}}, color={0,0,127}));
  connect(lessEqualThreshold.y, timer.u)
    annotation (Line(points={{-19,-32},{-10,-32}}, color={255,0,255}));
  connect(sleep.y, switch1.u2) annotation (Line(points={{41,-32},{44,-32},{44,
          -1},{49.8,-1}},
                      color={255,0,255}));
  connect(switch1.u3, P13_nom.y) annotation (Line(points={{49.8,7.8},{38,7.8},
          {38,8},{21,8}},   color={0,0,127}));
  connect(off.y, switch1.u1) annotation (Line(points={{32.4,-2},{40,-2},{40,
          -9.8},{49.8,-9.8}},
                       color={0,0,127}));
  connect(sleep.y, not1.u)
    annotation (Line(points={{41,-32},{44.8,-32}}, color={255,0,255}));
  connect(not1.y, P04_signal.u) annotation (Line(points={{58.6,-32},{62,-32},
          {62,-58},{66,-58}},
                          color={255,0,255}));
  connect(P08P09signal.y, signalBus.P08_signal) annotation (Line(points={{43.1,
          -90},{100,-90},{100,0}},
                              color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P08P09signal.y, signalBus.P09_signal) annotation (Line(points={{43.1,
          -90},{100,-90},{100,0}},
                              color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P04signal.y, signalBus.P04_signal) annotation (Line(points={{89.1,
          -38},{94,-38},{94,0},{100,0}},
                              color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(P13signal.y, signalBus.P13_signal) annotation (Line(points={{75.1,18},
          {100,18},{100,0}},     color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(curve_HP.y[1], signalBus.T_AHU_HP) annotation (Line(points={{99,176},
          {100,176},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(bypass.y, switch2.u1) annotation (Line(points={{-33.6,74},{-10,74},
          {-10,76},{14,76}}, color={0,0,127}));
  connect(con3wayTW.y, switch2.u3) annotation (Line(points={{-5,110},{4,110},
          {4,92},{14,92}}, color={0,0,127}));
  connect(con3wayTW.u_s, diff_sp.y)
    annotation (Line(points={{-28,110},{-35.4,110}}, color={0,0,127}));
  connect(feedback1.y, abs1.u)
    annotation (Line(points={{-47,90},{-35.2,90}}, color={0,0,127}));
  connect(abs1.y, con3wayTW.u_m) annotation (Line(points={{-21.4,90},{-16,90},
          {-16,98}}, color={0,0,127}));
  connect(feedback1.u2, con3wayCoo.u_s) annotation (Line(points={{-56,98},{
          -56,110},{-72,110},{-72,48},{-12,48}}, color={0,0,127}));
  connect(dataBus.TAirSupplyAHU, feedback1.u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,90},{-64,90}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(thermalWheelByPass.y, or1.u1) annotation (Line(points={{37,138},{50,
          138},{50,108},{38,108}}, color={255,0,255}));
  connect(nightVentilation, or1.u2) annotation (Line(points={{-100,-150},{-66,
          -150},{-66,-160},{78,-160},{78,100},{38,100}}, color={255,0,255}));
  connect(or1.y, switch2.u2) annotation (Line(points={{15,108},{-2,108},{-2,
          84},{14,84}}, color={255,0,255}));
  connect(limiter.y, overwrite.u)
    annotation (Line(points={{41,176},{46.8,176}}, color={0,0,127}));
  connect(overwrite.y, curve_HP.u[1])
    annotation (Line(points={{60.6,176},{76,176}}, color={0,0,127}));
  connect(overwrite.y, con3wayCoo.u_s) annotation (Line(points={{60.6,176},{
          66,176},{66,202},{-72,202},{-72,48},{-12,48}}, color={0,0,127}));
  connect(overwrite.y, signalBus.T_AHU) annotation (Line(points={{60.6,176},{
          66,176},{66,142},{100,142},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(switch2.y, overwrite1.u)
    annotation (Line(points={{37,84},{56.8,84}}, color={0,0,127}));
  connect(overwrite1.y, signalBus.TW_bypass) annotation (Line(points={{70.6,
          84},{100,84},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(supplySP.y, overwrite2.u)
    annotation (Line(points={{13.1,-146},{50.8,-146}}, color={0,0,127}));
  connect(overwrite2.y, signalBus.AHUsupply) annotation (Line(points={{64.6,
          -146},{100,-146},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(overwrite3.u, extractSP.y) annotation (Line(points={{60.8,-174},{36,
          -174},{36,-175},{11,-175}}, color={0,0,127}));
  connect(overwrite3.y, signalBus.AHUextract) annotation (Line(points={{74.6,
          -174},{100,-174},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -200},{100,200}}),                                  graphics={
          Rectangle(
          extent={{-100,180},{100,-180}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="AHU")}),Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-200},{100,200}}), graphics={
        Rectangle(extent={{-52,194},{44,152}}, lineColor={28,108,200}),
        Text(
          extent={{-48,194},{-20,186}},
          lineColor={28,108,200},
          textString="AHU setpoint"),
        Rectangle(extent={{-52,152},{44,68}}, lineColor={28,108,200}),
        Text(
          extent={{-48,154},{-4,148}},
          lineColor={28,108,200},
          textString="Thermal wheel bypass"),
        Rectangle(extent={{-52,68},{44,-48}}, lineColor={28,108,200}),
        Text(
          extent={{-52,68},{-18,62}},
          lineColor={28,108,200},
          textString="Cooling coil"),
        Text(
          extent={{-52,-48},{-18,-54}},
          lineColor={28,108,200},
          textString="Heating coil"),
        Rectangle(extent={{-52,-48},{44,-132}}, lineColor={28,108,200}),
        Rectangle(extent={{-52,-132},{44,-192}}, lineColor={28,108,200}),
        Text(
          extent={{-52,-132},{-18,-138}},
          lineColor={28,108,200},
          textString="AHU fans")}));
end AHU_control;
