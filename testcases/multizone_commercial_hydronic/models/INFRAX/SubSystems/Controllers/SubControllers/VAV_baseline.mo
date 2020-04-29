within INFRAX.SubSystems.Controllers.SubControllers;
model VAV_baseline "Controls of AHU loop for baseline"

  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},
        {IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
  Components.Clock           clock
    annotation (Placement(transformation(extent={{-60,100},{-40,120}})));
  IDEAS.Controls.Continuous.LimPID conVAV[21](
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    each Ti=100,
    reverseAction=true,
    each k=0.5) "Controller for VAV based on temperature"
    annotation (Placement(transformation(extent={{-44,20},{-24,40}})));
  Modelica.Blocks.Sources.Constant tracking[21](k=0)
    "set point tracking signal"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Math.Feedback diff[21]
    annotation (Placement(transformation(extent={{-90,-36},{-70,-16}})));
  Modelica.Blocks.Math.Abs abs[21]
    "absolute value (air flow either for heating or cooling)"
    annotation (Placement(transformation(extent={{-60,-36},{-40,-16}})));
  Modelica.Blocks.Routing.Replicator replicator(nout=21) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-70})));
  Modelica.Blocks.Logical.Switch heaDemand[21]
    annotation (Placement(transformation(extent={{80,48},{100,28}})));
  Modelica.Blocks.Logical.Hysteresis hysteresisHea[21](            uHigh=-0.25, uLow=-1)
    annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  Modelica.Blocks.Logical.Not not1[21]
    annotation (Placement(transformation(extent={{-20,64},{-8,76}})));
  Modelica.Blocks.Tables.CombiTable1D supplySetpoint[21](each table=[-1,
        273.15 + 28; -0.25,273.15 + 20.5; 0.3,273.15 + 16])
                      "setpoint for the supply air temperature"
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Blocks.Nonlinear.Limiter limiter[21](uMin=273.15 + 16, uMax=273.15
         + 32)
            "air supply temperature setpoint"
    annotation (Placement(transformation(extent={{16,20},{36,40}})));
  IDEAS.Controls.Continuous.LimPID conHeaCoi[21](
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    each k=2,
    each Ti=100,
    each reset=IDEAS.Types.Reset.Disabled)
    "Controller for heating coils in air ducts"
    annotation (Placement(transformation(extent={{54,20},{74,40}})));
  IDEAS.Utilities.Math.Max max[15](nin=3)
    "Maximum of the setpoints is the setpoint for the damper" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,-44})));
  Modelica.Blocks.Sources.RealExpression flush[15](y=if (clock.hour >= 6 and
        clock.hour <= 7) or (clock.weekDay < 2 and (clock.hour >= 5 and clock.hour
         <= 6)) or nightVentilation then 1 else 0)
                 "at 5am, dampers are opening at maximum"
    annotation (Placement(transformation(extent={{40,-36},{20,-16}})));

  Modelica.Blocks.MathBoolean.Or or1(nu=21)
    annotation (Placement(transformation(extent={{20,88},{32,100}})));
  Modelica.Blocks.Math.BooleanToInteger P06_signal
    "If any valve is open, then pump mass flow"
    annotation (Placement(transformation(extent={{64,92},{80,108}})));
  IDEAS.Utilities.Math.Max max1(nin=21)
    annotation (Placement(transformation(extent={{20,50},{36,66}})));
  Modelica.Blocks.Tables.CombiTable1D curve_HP(table=[273.15 + 18,273.15 + 26;
        273.15 + 24,273.15 + 32; 273.15 + 32,273.15 + 37])
    "HP setpoint depending on VAV coils required temperature"
    annotation (Placement(transformation(extent={{42,50},{58,66}})));
  IDEAS.Controls.Continuous.LimPID conCO2[15](
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    each reset=IDEAS.Types.Reset.Disabled,
    reverseAction=true,
    each k=0.5,
    each Ti(displayUnit="min") = 120) "Controller for VAV based on CO2"
    annotation (Placement(transformation(extent={{10,-100},{30,-80}})));
  Modelica.Blocks.Routing.Replicator replicator1(nout=15)
                                                         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,-90})));
  Modelica.Blocks.Sources.Constant CO2setpoint(k=850)
    "set point tracking signal"
    annotation (Placement(transformation(extent={{-50,-100},{-30,-80}})));
  Modelica.Blocks.Logical.Switch airDemand[15] annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={-10,-6})));
  Modelica.Blocks.Routing.Replicator replicator2(nout=15)
                                                         annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={-44,4})));
  Modelica.Blocks.Logical.Hysteresis hysteresisVAV[15](
    pre_y_start=true,
    uHigh=1,
    uLow=0.3)
    annotation (Placement(transformation(extent={{-80,80},{-62,98}})));
  Modelica.Blocks.Interfaces.BooleanInput nightVentilation
    "night ventilation active"
    annotation (Placement(transformation(extent={{-120,-70},{-80,-30}})));
  Modelica.Blocks.Sources.BooleanExpression AHUon(y=if ((clock.hour >= 6 and
        clock.hour <= 19) and (clock.weekDay) < 6) == true then true else
        false) "Supply fan pressure difference set-point"
    annotation (Placement(transformation(extent={{10,100},{32,120}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{42,94},{54,106}})));
equation

  connect(tracking.y, conVAV.u_s)
    annotation (Line(points={{-59,30},{-46,30}}, color={0,0,127}));
  connect(diff.y, abs.u)
    annotation (Line(points={{-71,-26},{-62,-26}}, color={0,0,127}));
  connect(signalBus.baseSetpoint, replicator.u) annotation (Line(
      points={{100,0},{100,-120},{-80,-120},{-80,-82}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(replicator.y, diff.u2)
    annotation (Line(points={{-80,-59},{-80,-34}}, color={0,0,127}));
  connect(abs.y, conVAV.u_m)
    annotation (Line(points={{-39,-26},{-34,-26},{-34,18}}, color={0,0,127}));
  connect(dataBus.T3rdFlr_SZ, diff[1].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T3rdFlr_CPR, diff[2].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T3rdFlr_MTR, diff[4].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T3rdFlr_SmaR, diff[3].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_NZ, diff[5].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_SZ, diff[6].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_MT1, diff[7].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-12},{-100,-12},{-100,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_MT2, diff[8].u1) annotation (Line(
      points={{-99.9,0.1},{-100,0.1},{-100,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_NZ, diff[9].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_SZ1, diff[10].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_SZ2, diff[11].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_MT1, diff[12].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_MT2, diff[13].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_hall, diff[14].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_1stAid, diff[15].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_KTR, diff[16].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_MT2, diff[17].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_MT1, diff[18].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_hall, diff[19].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_WStairs, diff[20].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_EStairs, diff[21].u1) annotation (Line(
      points={{-99.9,0.1},{-99.9,-26},{-88,-26}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(diff.y, hysteresisHea.u) annotation (Line(points={{-71,-26},{-66,-26},
          {-66,14},{-88,14},{-88,70},{-62,70}}, color={0,0,127}));
  connect(hysteresisHea.y, not1.u)
    annotation (Line(points={{-39,70},{-21.2,70}}, color={255,0,255}));
  connect(not1.y, heaDemand.u2) annotation (Line(points={{-7.4,70},{66,70},{66,38},
          {78,38}},                   color={255,0,255}));
  connect(supplySetpoint.y[1], limiter.u)
    annotation (Line(points={{11,30},{14,30}},color={0,0,127}));
  connect(dataBus.TAirSupplyVAV, conHeaCoi.u_m) annotation (Line(
      points={{-99.9,0.1},{64,0.1},{64,18}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(flush.y, max.u[1])
    annotation (Line(points={{19,-26},{-10,-26},{-10,-32},{-11.3333,-32}},
                                                            color={0,0,127}));

  connect(conVAV[1].y, airDemand[1].u1) annotation (Line(points={{-23,30},{-18,30},
          {-18,-2},{-18,-2},{-18,6}},color={0,0,127}));
  connect(conVAV[2].y, airDemand[2].u1);
  connect(conVAV[3].y, airDemand[3].u1);
  connect(conVAV[5].y, airDemand[4].u1);
  connect(conVAV[6].y, airDemand[5].u1);
  connect(conVAV[7].y, airDemand[6].u1);
  connect(conVAV[8].y, airDemand[7].u1);
  connect(conVAV[9].y, airDemand[8].u1);
  connect(conVAV[10].y, airDemand[9].u1);
  connect(conVAV[11].y, airDemand[10].u1);
  connect(conVAV[12].y, airDemand[11].u1);
  connect(conVAV[13].y, airDemand[12].u1);
  connect(conVAV[16].y, airDemand[13].u1);
  connect(conVAV[17].y, airDemand[14].u1);
  connect(conVAV[18].y, airDemand[15].u1);

  connect(heaDemand.y, signalBus.Heacoils_signal) annotation (Line(points={{101,38},
          {100.1,38},{100.1,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(max[1].y, signalBus.VAV_signal_extract[1]);
  connect(max[2].y, signalBus.VAV_signal_extract[2]);
  connect(max[3].y, signalBus.VAV_signal_extract[3]);
  connect(max[4].y, signalBus.VAV_signal_extract[4]);
  connect(max[5].y, signalBus.VAV_signal_extract[5]);
  connect(max[6].y, signalBus.VAV_signal_extract[6]);
  connect(max[7].y, signalBus.VAV_signal_extract[7]);
  connect(max[8].y, signalBus.VAV_signal_extract[8]);
  connect(max[9].y, signalBus.VAV_signal_extract[9]);
  connect(max[11].y, signalBus.VAV_signal_extract[10]);
  connect(max[12].y, signalBus.VAV_signal_extract[11]);
  connect(max[13].y, signalBus.VAV_signal_extract[12]);
  connect(max[14].y, signalBus.VAV_signal_extract[13]);
  connect(max[15].y, signalBus.VAV_signal_extract[14]);

  connect(max[10].y, signalBus.VAV_signal_extract[15]); //dummy connection

  connect(not1.y, or1.u[1:21]) annotation (Line(points={{-7.4,70},{8,70},{8,
          90},{20,90}}, color={255,0,255}));
  connect(P06_signal.y, signalBus.P06_signal) annotation (Line(points={{80.8,
          100},{100,100},{100,0}},
                                 color={255,127,0}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(conHeaCoi.y, heaDemand.u1)
    annotation (Line(points={{75,30},{78,30}}, color={0,0,127}));
  connect(heaDemand.u3, tracking.y) annotation (Line(points={{78,46},{-54,46},{-54,
          30},{-59,30}},      color={0,0,127}));
  connect(max1.y, curve_HP.u[1])
    annotation (Line(points={{36.8,58},{40.4,58}}, color={0,0,127}));
  connect(curve_HP.y[1], signalBus.T_VAV) annotation (Line(points={{58.8,58},
          {100,58},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(replicator1.y, conCO2.u_s)
    annotation (Line(points={{1,-90},{8,-90}}, color={0,0,127}));
  connect(CO2setpoint.y, replicator1.u)
    annotation (Line(points={{-29,-90},{-22,-90}}, color={0,0,127}));
  connect(conCO2.y, max.u[3]) annotation (Line(points={{31,-90},{60,-90},{60,-32},
          {-8.66667,-32}}, color={0,0,127}));
  connect(dataBus.CO2_3rdFlr_SZ, conCO2[1].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_3rdFlr_CPR, conCO2[2].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_3rdFlr_SmaR, conCO2[3].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_2ndFlr_NZ, conCO2[4].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_2ndFlr_SZ, conCO2[5].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_2ndFlr_MT1, conCO2[6].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_2ndFlr_MT2, conCO2[7].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_1stFlr_NZ, conCO2[8].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_1stFlr_SZ1, conCO2[9].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_1stFlr_SZ2, conCO2[10].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_1stFlr_MT1, conCO2[11].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_1stFlr_MT2, conCO2[12].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_GndFlr_KTR, conCO2[13].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_GndFlr_MT2, conCO2[14].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.CO2_GndFlr_MT1, conCO2[15].u_m) annotation (Line(
      points={{-99.9,0.1},{-99.9,-112},{20,-112},{20,-102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(airDemand.y, max.u[2])
    annotation (Line(points={{-10,-17},{-10,-32}}, color={0,0,127}));
  connect(replicator2.y, airDemand.u3) annotation (Line(points={{-37.4,4},{-32,4},
          {-32,12},{-2,12},{-2,6}}, color={0,0,127}));
  connect(tracking[1].y, replicator2.u) annotation (Line(points={{-59,30},{-54,30},
          {-54,4},{-51.2,4}}, color={0,0,127}));
  connect(abs[1].y, hysteresisVAV[1].u) annotation (Line(points={{-39,-26},{
          -34,-26},{-34,-8},{-94,-8},{-94,89},{-81.8,89}},
                                 color={0,0,127}));
  connect(abs[2].y, hysteresisVAV[2].u);
  connect(abs[3].y, hysteresisVAV[3].u);
  connect(abs[5].y, hysteresisVAV[4].u);
  connect(abs[6].y, hysteresisVAV[5].u);
  connect(abs[7].y, hysteresisVAV[6].u);
  connect(abs[8].y, hysteresisVAV[7].u);
  connect(abs[9].y, hysteresisVAV[8].u);
  connect(abs[10].y, hysteresisVAV[9].u);
  connect(abs[11].y, hysteresisVAV[10].u);
  connect(abs[12].y, hysteresisVAV[11].u);
  connect(abs[13].y, hysteresisVAV[12].u);
  connect(abs[16].y, hysteresisVAV[13].u);
  connect(abs[17].y, hysteresisVAV[14].u);
  connect(abs[18].y, hysteresisVAV[15].u);

  connect(hysteresisVAV.y, airDemand.u2) annotation (Line(points={{-61.1,89},
          {-10,89},{-10,6}}, color={255,0,255}));
  connect(and1.y, P06_signal.u)
    annotation (Line(points={{54.6,100},{62.4,100}}, color={255,0,255}));
  connect(or1.y, and1.u2) annotation (Line(points={{32.9,94},{38,94},{38,95.2},
          {40.8,95.2}}, color={255,0,255}));
  connect(AHUon.y, and1.u1) annotation (Line(points={{33.1,110},{38,110},{38,
          100},{40.8,100}}, color={255,0,255}));
  connect(hysteresisHea.u, supplySetpoint.u[1]) annotation (Line(points={{-62,
          70},{-72,70},{-72,52},{-16,52},{-16,30},{-12,30}}, color={0,0,127}));
  connect(limiter.y, conHeaCoi.u_s)
    annotation (Line(points={{37,30},{52,30}}, color={0,0,127}));
  connect(limiter.y, max1.u) annotation (Line(points={{37,30},{38,30},{38,42},{12,
          42},{12,58},{18.4,58}}, color={0,0,127}));
  connect(max.y, signalBus.VAV_signal) annotation (Line(points={{-10,-55},{
          -10,-60},{100.1,-60},{100.1,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},
            {100,120}}),                                        graphics={
          Rectangle(
          extent={{-100,120},{100,-120}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="VAV")}),Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-120},{100,120}})));
end VAV_baseline;
