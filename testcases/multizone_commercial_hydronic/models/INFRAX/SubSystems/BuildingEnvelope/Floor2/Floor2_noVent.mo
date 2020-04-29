within INFRAX.SubSystems.BuildingEnvelope.Floor2;
model Floor2_noVent

  replaceable package Medium = IDEAS.Media.Air constrainedby
    Modelica.Media.Interfaces.PartialMedium;
  outer IDEAS.BoundaryConditions.SimInfoManager sim "Data reader"
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));
  INFRAX.Data.Parameters.Str2ndFlr str2ndFlr "Record with the 2nd floor data"
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));
  INFRAX.Data.Parameters.Structure structure "General data record of the building"
    annotation (Placement(transformation(extent={{120,-80},{140,-60}})));
  IDEAS.Buildings.Components.Window northWindows(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=str2ndFlr.AWindows_2ndFlr_NZ,
    frac=str2ndFlr.FrameRatio_2ndFlr_NZ,
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start)
    "Windows connected to the north landscape office"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={112,92})));
  IDEAS.Buildings.Components.OuterWall northWall(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=str2ndFlr.AWall_2ndFlr_NZ,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    T_start=T_start)
    "Outer wall connected to the north landscape office"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={88,92})));
  IDEAS.Buildings.Components.Zone northZone(
    V=str2ndFlr.Vol_2ndFlr_NZ,
    hZone=str2ndFlr.Height2ndFlr,
    nSurf=12,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Northern landscape office"
    annotation (Placement(transformation(extent={{20,40},{60,80}})));
  IDEAS.Buildings.Components.RectangularZoneTemplate meetingRoom1(
    aziA=INFRAX.Data.Orientations.N,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    l=str2ndFlr.l_2ndFlr_MTR1,
    w=str2ndFlr.w_2ndFlr_MTR1,
    h=str2ndFlr.Height2ndFlr,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    nSurfExt=0,
    redeclare IDEAS.Buildings.Data.Constructions.CavityWall conTypCei,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    redeclare INFRAX.Data.Constructions.ReinforcedPlasterWall conTypA,
    redeclare INFRAX.Data.Constructions.ReinforcedPlasterWall conTypC,
    A_winA=str2ndFlr.AWindows_2ndFlr_MTR1,
    A_winC=str2ndFlr.AWindows_2ndFlr_MTR1,
    fracA=str2ndFlr.FrameRatio_2ndFlr_MTR1,
    fracC=str2ndFlr.FrameRatio_2ndFlr_MTR1,
    redeclare INFRAX.Data.Constructions.PlasterWallCavity conTypB,
    redeclare INFRAX.Data.Constructions.GlassWall conTypD,
    hasWinA=false,
    hasWinC=false,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Meeting room next to 2nd floor reception"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  IDEAS.Buildings.Components.RectangularZoneTemplate meetingRoom2(
    aziA=INFRAX.Data.Orientations.N,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    l=str2ndFlr.l_2ndFlr_MTR2,
    w=str2ndFlr.w_2ndFlr_MTR2,
    h=str2ndFlr.Height2ndFlr,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    nSurfExt=0,
    redeclare IDEAS.Buildings.Data.Constructions.CavityWall conTypCei,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    redeclare INFRAX.Data.Constructions.GlassWall conTypB,
    redeclare INFRAX.Data.Constructions.PlasterWallCavity conTypD,
    redeclare INFRAX.Data.Constructions.ReinforcedPlasterWall conTypA,
    redeclare INFRAX.Data.Constructions.ReinforcedPlasterWall conTypC,
    A_winA=str2ndFlr.AWindows_2ndFlr_MTR2,
    A_winC=str2ndFlr.AWindows_2ndFlr_MTR2,
    fracA=str2ndFlr.FrameRatio_2ndFlr_MTR2,
    fracC=str2ndFlr.FrameRatio_2ndFlr_MTR2,
    redeclare IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
      shaTypA,
    redeclare INFRAX.Data.Frames.INFRAXWood fraTypA,
    hasWinA=false,
    hasWinC=false,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Meeting room far from 2nd floor reception"
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  IDEAS.Buildings.Components.Zone southZone(
    hZone=str2ndFlr.Height2ndFlr,
    V=str2ndFlr.Vol_2ndFlr_SZ2,
    nSurf=28,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Big southern landscape office"
    annotation (Placement(transformation(extent={{-24,-72},{16,-32}})));
  IDEAS.Buildings.Components.OuterWall[4] southWall(
    azi=str2ndFlr.azi_2ndFlr_SZ,
    A=str2ndFlr.AWall_2ndFlr_SZ,
    inc=str2ndFlr.inc_2ndFlr_SZ,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    T_start=T_start)
    "Array of walls connected to the southern landscape office"
    annotation (Placement(transformation(extent={{-96,-60},{-84,-40}})));
  IDEAS.Buildings.Components.Window[4] southWindows(
    azi=str2ndFlr.azi_2ndFlr_SZ,
    A=str2ndFlr.AWindows_2ndFlr_SZ,
    frac=str2ndFlr.FrameRatio_2ndFlr_SZ,
    inc=str2ndFlr.inc_2ndFlr_SZ,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start,
    redeclare Data.Shading.HorizontalFins shaType)
    "Array of windows connected to the sourthern landscape office"
    annotation (Placement(transformation(extent={{-96,-84},{-84,-64}})));
  IDEAS.Buildings.Components.InternalWall[2] internalWalls(
    inc=IDEAS.Types.Tilt.Wall,
    A=str2ndFlr.AinternalWalls,
    azi={INFRAX.Data.Orientations.N,INFRAX.Data.Orientations.W},
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall constructionType,
    T_start=T_start)
    "Glass wall separating Copy rooms from south zone adding thermal
    mass to the south zone"
    annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-28,20})));
  IDEAS.Buildings.Components.RectangularZoneTemplate bathroomZone(
    aziA=INFRAX.Data.Orientations.N,
    l=str2ndFlr.l_2ndFlr_BRZ,
    w=str2ndFlr.w_2ndFlr_BRZ,
    h=str2ndFlr.Height2ndFlr,
    redeclare IDEAS.Buildings.Data.Constructions.CavityWall conTypCei,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypA,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypB,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypC,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypD,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
  "Bathroom zone, not conditioned and with air extraction"
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));

  IDEAS.Buildings.Components.InternalWall copyWalls(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=str2ndFlr.Awall_NZSZ,
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall constructionType,
    T_start=T_start,
    hasCavity=true,
    h=2.95,
    w=6)
    "Walls of copy rooms separating north/south zones, cavity lumps the corridor"
    annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={0,20})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[8] cei(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
   "Bus to connect the floor zones to the ceiling walls in the outer level"
    annotation (Placement(transformation(extent={{-20,120},{20,80}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[7] flo(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
   "Bus to connect the floor zones to the floor walls in the outer level"
    annotation (Placement(transformation(extent={{-20,-120},{20,-80}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[3] staW(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
   "Bus to connect the floor zones to the stair zones in the outer level"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-140,4})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[2] staE(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
   "Bus to connect the floor zones to the stair zones in the outer level"
    annotation (
      Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={140,0})));
  IDEAS.Buildings.Components.InternalWall staW_WallC(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=4.85*str2ndFlr.Height2ndFlr,
    redeclare INFRAX.Data.Constructions.ConcreteWall constructionType,
    T_start=T_start)
  "Southern internal wall towards the western stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=90,
        origin={-130,-28})));
  IDEAS.Buildings.Components.InternalWall staW_WallB(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.W,
    A=4.5*str2ndFlr.Height2ndFlr,
    redeclare INFRAX.Data.Constructions.ConcreteWall constructionType,
    T_start=T_start)
  "Eastern internal wall towards the west stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{-6,10},{6,-10}},
        rotation=0,
        origin={-68,80})));
  IDEAS.Buildings.Components.InternalWall staE_WallC(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=2.55*str2ndFlr.Height2ndFlr,
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    T_start=T_start)
  "Southern internal wall towards the east stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=90,
        origin={130,-28})));
  IDEAS.Buildings.Components.InternalWall staE_WallD(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.E,
    A=4.5*str2ndFlr.Height2ndFlr,
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    T_start=T_start)
  "Western internal wall towards the east stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=0,
        origin={114,30})));
 IDEAS.Buildings.Components.Interfaces.ZoneBus gflo(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
 "Bus to connect the floor zones to the ground floor ceiling walls in the outer
  level due to the glass hollow"
    annotation (Placement(transformation(extent={{-60,-120},{-20,-80}})));
  INFRAX.SubSystems.Controllers.DataBus dataBus
    "Bus containing data from different sensors" annotation (Placement(
        transformation(extent={{-160,20},{-120,60}}), iconTransformation(extent
          ={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[5] gainCon
  "Bus to connect convective heat transfer to the zones"
    annotation (Placement(transformation(extent={{130,-60},{150,-40}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[5] gainRad
  "Bus to connect radiative heat transfer to the zones"
    annotation (Placement(transformation(extent={{130,-80},{150,-60}})));
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsAir=Modelica.Fluid.Types.Dynamics.FixedInitial
  "Type of energy balance for air model: dynamic (3 initialization options) or steady state";
  parameter Real[5] A_Conv = {northZone.A, southZone.A, meetingRoom1.A, meetingRoom2.A, bathroomZone.A}
  "Convective area of zones";
  parameter Real mSenFac=5
  "Correction factor for thermal capacity of zone air.";
  Modelica.Blocks.Interfaces.RealInput[4] nOcc
  "No of occupants input" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={70,-100})));
  parameter Modelica.SIunits.Temperature T_start=293.15
    "Start temperature for each of the layers";
  Modelica.Blocks.Sources.Constant noShad(k=0)
    "North windows are not controllable, hence signal is zero"
    annotation (Placement(transformation(extent={{-138,-96},{-126,-84}})));
  Modelica.Blocks.Math.Gain gain(k=2/3) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={44,-44})));
  Modelica.Blocks.Math.Gain gain1(k=1/3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={92,12})));
equation

  //northZone connections
  connect(northZone.propsBus[1], northWall.propsBus_a) annotation (Line(
      points={{20,71.6667},{20,71.6667},{20,87},{90,87}},
      color={255,204,51},
      thickness=0.5));
  connect(northZone.propsBus[2], northWindows.propsBus_a) annotation (Line(
      points={{20,71},{20,87},{114,87}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom1.proBusA[1], northZone.propsBus[3]) annotation (Line(
      points={{-56,9},{-56,9},{-56,70.3333},{20,70.3333}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom2.proBusA[1], northZone.propsBus[4]) annotation (Line(
      points={{44,9},{20,9},{20,69.6667}},
      color={255,204,51},
      thickness=0.5));
  //southZone connections
  connect(southZone.propsBus[1], southWall[1].propsBus_a) annotation (Line(
      points={{-24,-40.1429},{-48,-40.1429},{-48,-48},{-85,-48}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[2], southWall[2].propsBus_a);
  connect(southZone.propsBus[3], southWall[3].propsBus_a);
  connect(southZone.propsBus[4], southWall[4].propsBus_a);
  connect(southZone.propsBus[5], southWindows[1].propsBus_a) annotation (Line(
      points={{-24,-41.2857},{-24,-41.2857},{-22,-41.2857},{-48,-41.2857},{-48,
          -72},{-85,-72}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[6], southWindows[2].propsBus_a);
  connect(southZone.propsBus[7], southWindows[3].propsBus_a);
  connect(southZone.propsBus[8], southWindows[4].propsBus_a);
  connect(southZone.propsBus[9], meetingRoom1.proBusC[1]) annotation (Line(
      points={{-24,-42.4286},{-24,-42.4286},{-24,-9.8},{-43.2,-9.8}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[10], meetingRoom2.proBusC[1]) annotation (Line(
      points={{-24,-42.7143},{-24,-42.7143},{-24,-20},{56.8,-20},{56.8,-9.8}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[12], meetingRoom1.proBusD[1]) annotation (Line(
      points={{-24,-43.2857},{-24,-43.2857},{-24,-20},{-66,-20},{-66,-7},{-59.6,
          -7}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[13], meetingRoom2.proBusB[1]) annotation (Line(
      points={{-24,-43.5714},{-24,-20},{72,-20},{72,6},{59,6}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWalls[1].propsBus_a, southZone.propsBus[14]) annotation (Line(
      points={{-26,15},{-28,15},{-28,-40},{-28,-43.8571},{-24,-43.8571}},
      color={255,204,51},
      thickness=0.5));
  connect(bathroomZone.proBusC[1], southZone.propsBus[16]) annotation (Line(
      points={{-83.2,40.2},{-83.2,-34},{-24,-34},{-24,-44.4286}},
      color={255,204,51},
      thickness=0.5));
  connect(bathroomZone.proBusD[1], southZone.propsBus[17]) annotation (Line(
      points={{-99.6,43},{-100,43},{-100,-34},{-24,-34},{-24,-44.7143}},
      color={255,204,51},
      thickness=0.5));
  //Other connections
  connect(internalWalls[1].propsBus_b, southZone.propsBus[15]) annotation (Line(
      points={{-26,25},{-26,32},{-14,32},{-14,8},{-24,8},{-24,-44.1429}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[11], copyWalls.propsBus_a) annotation (Line(
      points={{-24,-43},{-22,-43},{-22,0},{0,0},{0,15},{2,15}},
      color={255,204,51},
      thickness=0.5));
  connect(copyWalls.propsBus_b, northZone.propsBus[5]) annotation (Line(
      points={{2,25},{2,25},{2,69},{20,69}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom1.proBusB[1], southZone.propsBus[18]) annotation (Line(
      points={{-41,6},{-34,6},{-34,4},{-24,4},{-24,-45}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom2.proBusD[1], southZone.propsBus[19]) annotation (Line(
      points={{40.4,-7},{8,-7},{8,-2},{-24,-2},{-24,-45.2857}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[20], internalWalls[2].propsBus_a) annotation (Line(
      points={{-24,-45.5714},{-26,-45.5714},{-26,-40},{-26,15}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWalls[2].propsBus_b, southZone.propsBus[21]) annotation (Line(
      points={{-26,25},{-26,36},{-12,36},{-12,4},{-24,4},{-24,-45.8571}},
      color={255,204,51},
      thickness=0.5));
  //Connections to the ceiling
  connect(northZone.propsBus[6], cei[1]);
  connect(northZone.propsBus[7], cei[6]);
  connect(northZone.propsBus[8], cei[7]);
  connect(northZone.propsBus[9], cei[8]);
  connect(southZone.propsBus[22], cei[2]);
  connect(meetingRoom1.proBusCei[1], cei[3]);
  connect(meetingRoom2.proBusCei[1], cei[4]);
  connect(bathroomZone.proBusCei[1], cei[5]);
  //Connections to the stairs
  connect(bathroomZone.proBusB[1], staW[3]) annotation (Line(
      points={{-81,56},{-80,56},{-80,68},{-80,70},{-140,70},{-140,-9.33333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone.propsBus[23], staW_WallC.propsBus_a) annotation (Line(
      points={{-24,-46.4286},{-76,-46.4286},{-128,-46.4286},{-128,-33}},
      color={255,204,51},
      thickness=0.5));
  connect(northZone.propsBus[10], staW_WallB.propsBus_a) annotation (Line(
      points={{20,65.6667},{16,65.6667},{16,78},{-63,78}},
      color={255,204,51},
      thickness=0.5));
  connect(staW_WallC.propsBus_b, staW[2]);
  connect(staW_WallB.propsBus_b, staW[1]);
  connect(southZone.propsBus[24], staE_WallC.propsBus_a) annotation (Line(
      points={{-24,-46.7143},{-20,-46.7143},{-20,-30},{132,-30},{132,-33}},
      color={255,204,51},
      thickness=0.5));
  connect(northZone.propsBus[11], staE_WallD.propsBus_a) annotation (Line(
      points={{20,65},{22,65},{22,40},{22,28},{109,28}},
      color={255,204,51},
      thickness=0.5));
  connect(staE_WallD.propsBus_b, staE[2]);
  connect(staE_WallC.propsBus_b, staE[1]);
  //Floor connections
  connect(northZone.propsBus[12], flo[1]);
  connect(southZone.propsBus[25], flo[2]) annotation (Line(
      points={{-24,-47},{-24,-47},{-24,-94},{-24,-111.429},{0,-111.429}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone.propsBus[26], flo[3]);
  connect(southZone.propsBus[27], flo[7]);
  connect(meetingRoom1.proBusFlo[1], flo[4]);
  connect(meetingRoom2.proBusFlo[1], flo[5]);
  connect(bathroomZone.proBusFlo[1], flo[6]);
  connect(southZone.propsBus[28], gflo) annotation (Line(
      points={{-24,-47.8571},{-40,-47.8571},{-40,-100}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  //Data bus connections
  connect(northZone.TSensor, dataBus.T2ndFlr_NZ) annotation (Line(
      points={{62,64},{-38,64},{-38,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone.TSensor, dataBus.T2ndFlr_SZ) annotation (Line(
      points={{18,-48},{-58,-48},{-58,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(meetingRoom1.TSensor, dataBus.T2ndFlr_MT1) annotation (Line(
      points={{-39,2},{-88,2},{-88,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(meetingRoom2.TSensor, dataBus.T2ndFlr_MT2) annotation (Line(
      points={{61,2},{-39.7,2},{-39.7,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  //Windows control signal
  connect(noShad.y, southWindows[1].Ctrl);
  connect(dataBus.eastShading2nd, southWindows[2].Ctrl);
  connect(dataBus.southShading, southWindows[3].Ctrl);
  connect(dataBus.westShading, southWindows[4].Ctrl);
  //Conective and radiative connections
  connect(northZone.gainCon, gainCon[1]);
  connect(northZone.gainRad, gainRad[1]);
  connect(southZone.gainRad, gainRad[2]);
  connect(southZone.gainCon, gainCon[2]);
  connect(meetingRoom1.gainCon, gainCon[3]);
  connect(meetingRoom1.gainRad, gainRad[3]);
  connect(meetingRoom2.gainCon, gainCon[4]);
  connect(meetingRoom2.gainRad, gainRad[4]);
  connect(bathroomZone.gainCon, gainCon[5]);
  connect(bathroomZone.gainRad, gainRad[5]);
  //Occupancy connections
  connect(nOcc[3], meetingRoom1.yOcc) annotation (Line(points={{70,-95},{70,-95},
          {70,-26},{-30,-26},{-30,4},{-38,4}},       color={0,0,127}));
  connect(nOcc[4], meetingRoom2.yOcc) annotation (Line(points={{70,-85},{70,-85},
          {70,2},{70,4},{62,4}},       color={0,0,127}));
  connect(southZone.yOcc, gain.y)
    annotation (Line(points={{20,-44},{33,-44}}, color={0,0,127}));
  connect(gain.u, nOcc[2])
    annotation (Line(points={{56,-44},{70,-44},{70,-105}}, color={0,0,127}));
  connect(nOcc[1], gain1.u) annotation (Line(points={{70,-115},{70,-60},{92,-60},
          {92,0}}, color={0,0,127}));
  connect(gain1.y, northZone.yOcc)
    annotation (Line(points={{92,23},{92,68},{64,68}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -100},{140,100}}), graphics={
          Rectangle(extent={{-140,100},{140,-100}},
                                                lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-70,70},{70,-70}},
          lineColor={28,108,200},
          textString="2")}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-140,-100},{140,100}})));
end Floor2_noVent;
