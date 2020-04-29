within INFRAX.SubSystems.Controllers;
model RBC_BOPTEST "hybridGEOTABS RBC baseline"
  import INFRAX;

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{120,
            20}}), iconTransformation(extent={{90,-10},{110,10}})));
  INFRAX.SubSystems.Controllers.SubControllers.ModeSelector_BOPTEST modSel(
    heat(start=true),
    rest(start=false),
    cool(start=false)) "Mode selector sequence"
    annotation (Placement(transformation(extent={{40,80},{60,100}})));
  INFRAX.SubSystems.Controllers.SubControllers.TABS tabsCon
    "Model that includes the control logic of TABS components"
    annotation (Placement(transformation(extent={{60,40},{80,60}})));
  Occupancy.Comfort.Limits
                     temLim(typeLimit=2, nZones=14)
    "Model that computes the building limits and calculates the discomfort"
    annotation (Placement(transformation(extent={{-60,-10},{-40,12}})));
  INFRAX.SubSystems.Controllers.SubControllers.Valves.Tavg_of_floors avgFlrT
    "Model that computes the average temperature of the different floors"
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  INFRAX.SubSystems.Controllers.SubControllers.HP_set hpCon
    "Model that includes the control logic of the GSHPs"
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  INFRAX.SubSystems.Controllers.SubControllers.AHU_control ahuCon
    "Model that includes the control logic of the AHU"
    annotation (Placement(transformation(extent={{60,-34},{80,-6}})));
  INFRAX.SubSystems.Controllers.SubControllers.Situations.Situations ctCon
    "Model that includes the control logic of the cooling tower"
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  INFRAX.SubSystems.Controllers.SubControllers.VAV_baseline vavCon
    "Model that includes the control logic of the VAV and heating coils within the ducts"
    annotation (Placement(transformation(extent={{60,-94},{80,-66}})));
  INFRAX.SubSystems.Controllers.SubControllers.SunShading sunSha
    "Model that includes the control logic of the shading devices"
    annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  INFRAX.SubSystems.Controllers.SubControllers.NightVentilation nightVent
    "Model that includes the control logic of night ventilation"
    annotation (Placement(transformation(extent={{-54,24},{-34,44}})));
  OverwriteBoolean overwriteBoolean(
    description="Heating mode boolean",
    min=0,
    max=1,
    unit="1") annotation (Placement(transformation(extent={{68,92},{74,98}})));
  OverwriteBoolean overwriteBoolean1(
    description="Neutral mode boolean",
    min=0,
    max=1,
    unit="1") annotation (Placement(transformation(extent={{78,88},{82,92}})));
  OverwriteBoolean overwriteBoolean2(
    description="Cooling mode boolean",
    min=0,
    max=1,
    unit="1") annotation (Placement(transformation(extent={{88,82},{94,88}})));
equation

  connect(dataBus, tabsCon.dataBus) annotation (Line(
      points={{-100,0},{-100,50},{60,50}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(tabsCon.signalBus, signalBus) annotation (Line(
      points={{80.2,50},{100,50},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(temLim.Tavg, signalBus.baseSetpoint) annotation (Line(points={{-39.25,
          2.60769},{28.375,2.60769},{28.375,0},{100,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(avgFlrT.dataBus, dataBus) annotation (Line(
      points={{-100,70},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(signalBus, hpCon.signalBus) annotation (Line(
      points={{100,0},{100,20},{80.2,20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(hpCon.dataBus, dataBus) annotation (Line(
      points={{60,20},{-100,20},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(ahuCon.dataBus, dataBus) annotation (Line(
      points={{60,-20},{-100,-20},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(ahuCon.signalBus, signalBus) annotation (Line(
      points={{80.2,-20},{100,-20},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(ctCon.signalBus, signalBus) annotation (Line(
      points={{80.2,-50},{100,-50},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(ctCon.dataBus, dataBus) annotation (Line(
      points={{60,-50},{-100,-50},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(vavCon.signalBus, signalBus) annotation (Line(
      points={{80.2,-80},{100,-80},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(vavCon.dataBus, dataBus) annotation (Line(
      points={{60,-80},{-100,-80},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(sunSha.dataBus, dataBus) annotation (Line(
      points={{-20,70},{-74,70},{-74,0},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T3rdFlr_SZ,temLim. TSensor[1]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,-1.41758},{
          -61.6667,-1.41758}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
 connect(dataBus.T3rdFlr_MTR,temLim. TSensor[2]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-81.6667,0},{-81.6667,-1.17582},{
          -61.6667,-1.17582}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_NZ,temLim. TSensor[3]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,-0.934066},{
          -61.6667,-0.934066}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_SZ,temLim. TSensor[4]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,-0.692308},{
          -61.6667,-0.692308}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_MT1,temLim. TSensor[5]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,-0.450549},{
          -61.6667,-0.450549}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_MT2,temLim. TSensor[6]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,-0.208791},{
          -61.6667,-0.208791}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_NZ,temLim. TSensor[7]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,0.032967},{
          -61.6667,0.032967}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_SZ1,temLim. TSensor[8]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-81.6667,0},{-81.6667,0.274725},{
          -61.6667,0.274725}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_SZ2,temLim. TSensor[9]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,0.516484},{
          -61.6667,0.516484}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_MT1,temLim. TSensor[10]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-81.6667,0},{-81.6667,0.758242},{
          -61.6667,0.758242}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T1stFlr_MT2,temLim. TSensor[11]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,1},{-61.6667,
          1}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));

  connect(dataBus.TGndFlr_KTR,temLim. TSensor[12]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-81.6667,0},{-81.6667,1.24176},{
          -61.6667,1.24176}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_MT1,temLim. TSensor[13]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,1.48352},{
          -61.6667,1.48352}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.TGndFlr_MT2,temLim. TSensor[14]) annotation (Line(
      points={{-99.9,0.1},{-90,0.1},{-90,0},{-79.6667,0},{-79.6667,1.72527},{
          -61.6667,1.72527}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));

  connect(nightVent.dataBus, dataBus) annotation (Line(
      points={{-54,34},{-100,34},{-100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(nightVent.NightVentilation, ahuCon.nightVentilation) annotation (Line(
        points={{-33,33.8},{14,33.8},{14,-24},{38,-24},{38,-30.5},{60,-30.5}},
        color={255,0,255}));
  connect(nightVent.NightVentilation, vavCon.nightVentilation) annotation (Line(
        points={{-33,33.8},{14,33.8},{14,-84},{60,-84},{60,-85.8333}}, color={
          255,0,255}));
  connect(modSel.heat, overwriteBoolean.u)
    annotation (Line(points={{61,95},{67.4,95}}, color={255,0,255}));
  connect(overwriteBoolean.y, signalBus.heatMode) annotation (Line(points={{
          74.6,95},{100,95},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(modSel.rest, overwriteBoolean1.u)
    annotation (Line(points={{61,90},{77.6,90}}, color={255,0,255}));
  connect(overwriteBoolean1.y, signalBus.restMode) annotation (Line(points={{
          82.4,90},{100,90},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(modSel.cool, overwriteBoolean2.u)
    annotation (Line(points={{61,85},{87.4,85}}, color={255,0,255}));
  connect(overwriteBoolean2.y, signalBus.coolMode) annotation (Line(points={{
          94.6,85},{100,85},{100,0}}, color={255,0,255}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end RBC_BOPTEST;
