within INFRAX;
model IBPSA_BOPTEST
  inner IDEAS.BoundaryConditions.SimInfoManager sim
    "Model that handles time and weather data"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));

   SubSystems.BuildingEnvelope.EnvelopeBOPTEST
                                           buiEnv(T_start=296.65)
    "Envelope of the building"
    annotation (Placement(transformation(extent={{-50,56},{-8,86}})));

  SubSystems.HeatingSystem.HeatingSystemBOPTEST
                                         heaSys
    "Heating system of the building"
    annotation (Placement(transformation(extent={{18,14},{60,40}})));
  SubSystems.Controllers.RBC_BOPTEST buiCon "Building controller"
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  SubSystems.VentilationSystem.VentilationSystemBOPTEST
                                                    venSys
    "Ventilation system of the building"
    annotation (Placement(transformation(extent={{60,68},{98,88}})));
  SubSystems.Occupancy.OccupantwithCalendar buiOcc(
    nLoads=0,
    profileType={9,0,8,0,0,7,7,6,6,0,5,5,5,4,4,0,0,0,0,1,2,3,0,0,0,0,0},
    nZones=27,
    startDay=5,
    startYear=2010,
    filenameTables=Modelica.Utilities.Files.loadResource(
    "modelica://INFRAX/SubSystems//Occupancy/Data/Tables/TablesOccupancyInfraxBaseline.txt"))
    "Occupancy model of the building"
    annotation (Placement(transformation(extent={{20,-22},{60,-2}})));
  replaceable SubSystems.Occupancy.Appliances buiApp
    "Model computing internal gains from appliances"
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.RealExpression fanToi(y=if ((clock.hour >= 6 and
        clock.hour <= 19) and (clock.weekDay) < 6) or buiCon.nightVent.NightVentilation
         == true then 200 else 0) "setpoit for toilet fans"
    annotation (Placement(transformation(extent={{-94,30},{-72,50}})));
  SubSystems.Controllers.Components.Clock clock
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
protected
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature[27] preTem(each T=297.15)
    "Prescribed temperature, needed by the occupancy model" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-2,-64})));
equation
  connect(buiCon.signalBus, heaSys.signalBus) annotation (Line(
      points={{-20,30},{-2,30},{-2,27},{18,27}},
      color={255,204,51},
      thickness=0.5));
  connect(heaSys.dataBus, buiCon.dataBus) annotation (Line(
      points={{18,29.7625},{2,29.7625},{2,46},{-52,46},{-52,30},{-40,30}},
      color={255,204,51},
      thickness=0.5));
  connect(buiEnv.dataBus, buiCon.dataBus) annotation (Line(
      points={{-44,71},{-58,71},{-58,70},{-58,30},{-40,30}},
      color={255,204,51},
      thickness=0.5));
  connect(heaSys.port_emb, buiEnv.cca)    annotation (Line(points={{47.4,40},{47.4,71},{-8,71}}, color={191,0,0}));
  connect(heaSys.dataBus, buiEnv.dataBus) annotation (Line(
      points={{18,29.7625},{10,29.7625},{10,32},{2,32},{2,46},{-52,46},{-52,71},
          {-44,71}},
      color={255,204,51},
      thickness=0.5));
  connect(heaSys.HeaCoi_b, venSys.HeaCoi_b) annotation (Line(points={{52,40},{52,
          40},{52,60},{92,60},{92,68}}, color={0,127,255}));
  connect(heaSys.HeaCoi_a, venSys.HeaCoi_a) annotation (Line(points={{50,40},{50,
          40},{50,62},{96,62},{96,68}}, color={0,127,255}));
  connect(venSys.AHUHeaCoi_b, heaSys.AHUHeaCoi_b)    annotation (Line(points={{60,74},{56,74},{56,40}}, color={0,127,255}));
  connect(heaSys.AHUHeaCoi_a, venSys.AHUHeaCoi_a) annotation (Line(points={{54,40},
          {54,40},{54,70},{54,72},{60,72}}, color={0,127,255}));
  connect(heaSys.AHUCooCoi_a, venSys.AHUCooCoi_a)    annotation (Line(points={{38,40},{38,68.4},{60,68.4}}, color={0,127,255}));
  connect(heaSys.AHUCooCoi_b, venSys.AHUCooCoi_b) annotation (Line(points={{40,40},
          {40,40},{40,70},{40,70.4},{60,70.4}}, color={0,127,255}));
  connect(venSys.dataBus, buiCon.dataBus) annotation (Line(
      points={{60,79.4},{32,79.4},{32,80},{6,80},{6,90},{-60,90},{-60,24},{-40,24},
          {-40,30}},
      color={255,204,51},
      thickness=0.5));
  connect(venSys.signalBus, buiCon.signalBus) annotation (Line(
      points={{60,76},{2,76},{2,24},{-20,24},{-20,30}},
      color={255,204,51},
      thickness=0.5));
  connect(buiEnv.airInlet, venSys.airSupply) annotation (Line(points={{-8,83},{-8,
          83},{-8,98},{-8,100},{95.6,100},{95.6,88}}, color={0,127,255}));
  connect(buiEnv.airOutlet, venSys.airReturn) annotation (Line(points={{-8,77},{
          24,77},{24,96},{91.6,96},{91.6,88}}, color={0,127,255}));
  connect(buiOcc.nOcc, buiEnv.nOcc) annotation (Line(points={{34.4,-1},{34.4,8},
          {-17,8},{-17,56}}, color={0,0,127}));
  connect(preTem.port, buiOcc.heatPortRad) annotation (Line(points={{-2,-54},{-2,
          -54},{-2,-14},{20,-14}}, color={191,0,0}));
  connect(preTem.port, buiOcc.heatPortCon) annotation (Line(points={{-2,-54},{-2,
          -54},{-2,-10},{20,-10}}, color={191,0,0}));
  connect(fanToi.y, buiEnv.dp_toilet) annotation (Line(points={{-70.9,40},{-64,40},
          {-64,59},{-53,59}}, color={0,0,127}));
  connect(buiOcc.nOcc, buiApp.nOcc) annotation (Line(points={{34.4,-1},{34.4,8},
          {-47,8},{-47,0}}, color={0,0,127}));
  connect(buiApp.conv, buiEnv.conv) annotation (Line(points={{-40,-8},{-4,-8},{-4,
          65},{-8,65}}, color={191,0,0}));
  connect(buiApp.rad, buiEnv.rad) annotation (Line(points={{-40,-12},{-4,-12},{-4,
          59},{-8,59}}, color={191,0,0}));
   annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=3.1536e+007,
      __Dymola_NumberOfIntervals=15000,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=20,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentSetupOutput(events=false),
    __Dymola_experimentFlags(
      Advanced(
        GenerateVariableDependencies=false,
        OutputModelicaCode=true,
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001),
      Evaluate=true,
      OutputCPUtime=true,
      OutputFlatModelica=true));
end IBPSA_BOPTEST;
