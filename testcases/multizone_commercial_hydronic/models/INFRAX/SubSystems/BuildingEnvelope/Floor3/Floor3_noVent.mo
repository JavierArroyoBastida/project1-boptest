within INFRAX.SubSystems.BuildingEnvelope.Floor3;
model Floor3_noVent

  replaceable package Medium = IDEAS.Media.Air constrainedby
    Modelica.Media.Interfaces.PartialMedium;

  INFRAX.Data.Parameters.Str3rdFlr str3rdFlr "Record with 3rd floor data"
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));
  outer IDEAS.BoundaryConditions.SimInfoManager sim "Data reader"
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));
  IDEAS.Buildings.Components.Window southWindow1(
    A=str3rdFlr.AWindows_3rdFlr_SZ[1],
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    frac=str3rdFlr.FrameRatio_3rdFlr_SZ[1],
    inc=str3rdFlr.inc_3rdFlr_SZ[1],
    azi=str3rdFlr.azi_3rdFlr_SZ[1],
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start)
  "Windows of the south zone pointing north (just window next to bathroom)"
  annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-90,-14})));
  IDEAS.Buildings.Components.Window southWindow2(
    A=str3rdFlr.AWindows_3rdFlr_SZ[2],
    frac=str3rdFlr.FrameRatio_3rdFlr_SZ[2],
    inc=str3rdFlr.inc_3rdFlr_SZ[2],
    azi=str3rdFlr.azi_3rdFlr_SZ[2],
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start,
    redeclare Data.Shading.HorizontalFins shaType)
  "Windows of the south zone pointing east"
  annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=0,
        origin={-72,-30})));
  IDEAS.Buildings.Components.Window southWindow3(
    A=str3rdFlr.AWindows_3rdFlr_SZ[3],
    frac=str3rdFlr.FrameRatio_3rdFlr_SZ[3],
    inc=str3rdFlr.inc_3rdFlr_SZ[3],
    azi=str3rdFlr.azi_3rdFlr_SZ[3],
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start,
    redeclare Data.Shading.HorizontalFins shaType)
    "Windows of the south zone pointing south"
   annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={-90,-54})));
  IDEAS.Buildings.Components.Window southWindow4(
    A=str3rdFlr.AWindows_3rdFlr_SZ[4],
    frac=str3rdFlr.FrameRatio_3rdFlr_SZ[4],
    inc=str3rdFlr.inc_3rdFlr_SZ[4],
    azi=str3rdFlr.azi_3rdFlr_SZ[4],
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start,
    redeclare Data.Shading.HorizontalFins shaType)
  "Windows of the south zone pointing west"
   annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=0,
        origin={-110,-30})));


  IDEAS.Buildings.Components.OuterWall[4] southWalls(
    A=str3rdFlr.AWall_3rdFlr_SZ,
    inc=str3rdFlr.inc_3rdFlr_SZ,
    azi=str3rdFlr.azi_3rdFlr_SZ,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    T_start=T_start)
  "Array of walls transferring heat to the south zone"
   annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-34,-2})));

  IDEAS.Buildings.Components.RectangularZoneTemplate bathroomZone(
    aziA=INFRAX.Data.Orientations.N,
    l=str3rdFlr.l_3rdFlr_BRZ,
    w=str3rdFlr.w_3rdFlr_BRZ,
    h=str3rdFlr.Height3rdFlr,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypA,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypB,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypC,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypD,
    redeclare INFRAX.Data.Constructions.Roof conTypCei,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
  "Bathroom zone, not conditioned with air extraction"
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  INFRAX.SubSystems.BuildingEnvelope.Floor3.Interfaces.RectangularZoneTABS copyRoom(
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    aziA=INFRAX.Data.Orientations.N,
    l=str3rdFlr.l_3rdFlr_CPR,
    w=str3rdFlr.w_3rdFlr_CPR,
    h=str3rdFlr.Height3rdFlr,
    redeclare IDEAS.Buildings.Data.Constructions.CavityWall conTypB,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    hasWinA=true,
    A_winA=str3rdFlr.AWindows_3rdFlr_CPR,
    redeclare IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
      shaTypA,
    fracA=str3rdFlr.FrameRatio_3rdFlr_CPR,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypA,
    redeclare INFRAX.Data.Constructions.ConcreteWall conTypD,
    redeclare INFRAX.Data.Constructions.PlasterWall conTypC,
    redeclare INFRAX.Data.Frames.INFRAXWood fraTypA,
    redeclare INFRAX.Data.Constructions.Roof conTypCei,
    hasTABSCei=true,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazingA,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    outCei(energyDynamics=energyDynamicsTABS),
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
  "Open room with the copy machine"
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  IDEAS.Buildings.Components.Zone southZone(
    hZone=str3rdFlr.Height3rdFlr,
    V=str3rdFlr.Vol_3rdFlr_SZ,
    nSurf=21,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
  "Big landscape office situated in the south sector of the floor"
    annotation (Placement(transformation(extent={{-20,-60},{20,-20}})));
  INFRAX.SubSystems.BuildingEnvelope.Floor3.Interfaces.RectangularZoneTABS meetingRoom(
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    aziA=INFRAX.Data.Orientations.N,
    l=str3rdFlr.l_3rdFlr_MTR,
    w=str3rdFlr.w_3rdFlr_MTR,
    h=str3rdFlr.Height3rdFlr,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    hasWinA=true,
    A_winA=str3rdFlr.AWindows_3rdFlr_MTR,
    redeclare IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
      shaTypA,
    fracA=str3rdFlr.FrameRatio_3rdFlr_MTR,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypA,
    redeclare INFRAX.Data.Constructions.PlasterWall conTypB,
    redeclare INFRAX.Data.Constructions.GlassWall conTypC,
    redeclare INFRAX.Data.Constructions.PlasterWall conTypD,
    redeclare INFRAX.Data.Frames.INFRAXWood fraTypA,
    redeclare INFRAX.Data.Constructions.Roof conTypCei,
    hasTABSCei=true,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazingA,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    outCei(energyDynamics=energyDynamicsTABS),
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
  "Big glazed meeting room situated in the mid-north face of the floor"
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  INFRAX.SubSystems.BuildingEnvelope.Floor3.Interfaces.RectangularZoneTABS smallRoom(
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    hasWinA=true,
    aziA=INFRAX.Data.Orientations.N,
    w=str3rdFlr.w_3rdFlr_SmaR,
    h=str3rdFlr.Height3rdFlr,
    fracA=str3rdFlr.FrameRatio_3rdFlr_SmaR,
    redeclare IDEAS.Buildings.Components.Shading.Interfaces.ShadingProperties
      shaTypA,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    nSurfExt=2,
    A_winA=2*str3rdFlr.AWindows_3rdFlr_SmaR,
    l=str3rdFlr.l_3rdFlr_SmaR + str3rdFlr.l_3rdFlr_StoR + 0.08,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypA,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypB,
    redeclare INFRAX.Data.Constructions.PlasterWall conTypC,
    redeclare INFRAX.Data.Frames.INFRAXWood fraTypA,
    redeclare INFRAX.Data.Constructions.Roof conTypCei,
    hasTABSCei=true,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazingA,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    outCei(energyDynamics=energyDynamicsTABS),
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
  "Very small lumped office in the north-east of the floor"
    annotation (Placement(transformation(extent={{60,40},{80,60}})));
  IDEAS.Buildings.Components.InternalWall internalWall(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.W,
    A=5*str3rdFlr.Height3rdFlr,
    redeclare INFRAX.Data.Constructions.PlasterWall constructionType,
    T_start=T_start)
  "Internal wall adding thermal mass to the lumped small offices"
    annotation (Placement(transformation(extent={{68,94},{56,74}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[8] flo(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
  "Bus to connect the floor zones to the floor-walls in the outer level"
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
    A=3.55*str3rdFlr.Height3rdFlr,
    redeclare INFRAX.Data.Constructions.ConcreteWall constructionType,
    T_start=T_start)
  "Southern internal wall towards the west stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=90,
        origin={-130,-28})));
  IDEAS.Buildings.Components.InternalWall staE_WallC(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=2.55*str3rdFlr.Height3rdFlr,
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    T_start=T_start)
 "Southern internal wall towards the east stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=90,
        origin={130,-30})));
  IDEAS.Buildings.Components.OuterWall inclinatedRoof(
    redeclare INFRAX.Data.Constructions.StepRoof constructionType,
    azi=0,
    inc=str3rdFlr.inc_roof,
    A=str3rdFlr.A_3rdFlr_SZ,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    "inclinated roof of southzone" annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-50,-46})));
  IDEAS.Buildings.Components.Window high_windows(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    A=str3rdFlr.AWindoiws_3rdFlr_HW,
    frac=str3rdFlr.FrameRatio_3rdFlr_HW,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start)
   "Small windows of the 3rd floor, placed almost at ceiling level"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-104,-2})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[4] port_emb
  "Embedded port towards outer walls in the roof"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  INFRAX.SubSystems.Controllers.DataBus dataBus
    "Bus containing data from different sensors" annotation (Placement(
        transformation(extent={{-160,20},{-120,60}}), iconTransformation(extent
          ={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[5] gainCon
  "Bus to connect convective heat transfer to the zones"
    annotation (Placement(transformation(extent={{130,-60},{150,-40}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[5] gainRad
  "Bus to connect the radiative heat transfer to the zones"
    annotation (Placement(transformation(extent={{130,-80},{150,-60}})));
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsAir=Modelica.Fluid.Types.Dynamics.FixedInitial
    "Type of energy balance for air model: dynamic (3 initialization options) or steady state";
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsTABS=Modelica.Fluid.Types.Dynamics.FixedInitial
    "Type of energy balance for air model: dynamic (3 initialization options) or steady state";

  parameter Real[5] A_Conv = {southZone.A, copyRoom.A, meetingRoom.A, smallRoom.A,
  bathroomZone.A} "Convective area of zones";
  parameter Modelica.SIunits.Area[4] ATabs = {inclinatedRoof.A,copyRoom.A, meetingRoom.A,
  smallRoom.A} "Area of TABS ceiling";

  parameter Real mSenFac=5
    "Correction factor for thermal capacity of zone air.";
  Modelica.Blocks.Interfaces.RealInput[2] nOcc annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={80,-100})));
  parameter Modelica.SIunits.Temperature T_start=293.15
    "Start temperature for each of the layers";
equation
  //Connections to the floor
  connect(southZone.propsBus[14], flo[1])  annotation (Line(
      points={{-20,-33.1429},{-20,-33.1429},{-20,-80},{0,-80},{0,-117.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone.propsBus[15], flo[2]);
  connect(southZone.propsBus[16], flo[3]);
  connect(southZone.propsBus[17], flo[4]);
  connect(bathroomZone.proBusFlo[1], flo[5]) annotation (Line(
      points={{-50,44},{-36,44},{-36,-98},{0,-98},{0,-97.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(copyRoom.proBusFlo[1], flo[6]);
  connect(meetingRoom.proBusFlo[1], flo[7]);
  connect(smallRoom.proBusFlo[1], flo[8]);

  //External connections of southZone
  connect(southZone.propsBus[1], southWalls[1].propsBus_a) annotation (Line(
      points={{-20,-28.1905},{-38,-28.1905},{-38,-7},{-32,-7}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[2], southWalls[2].propsBus_a);
  connect(southZone.propsBus[3], southWalls[3].propsBus_a);
  connect(southZone.propsBus[4], southWalls[4].propsBus_a);
  connect(southZone.propsBus[5], southWindow1.propsBus_a) annotation (Line(
      points={{-20,-29.7143},{-88,-29.7143},{-88,-19}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[6], southWindow2.propsBus_a) annotation (Line(
      points={{-20,-30.0952},{-77,-30.0952},{-77,-28}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[7], southWindow3.propsBus_a) annotation (Line(
      points={{-20,-30.4762},{-88,-30.4762},{-88,-49}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[8], southWindow4.propsBus_a) annotation (Line(
      points={{-20,-30.8571},{-105,-30.8571},{-105,-28}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[9], bathroomZone.proBusC[1]) annotation (Line(
      points={{-20,-31.2381},{-22,-31.2381},{-22,26},{-43.2,26},{-43.2,40.2}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[10], bathroomZone.proBusD[1]) annotation (Line(
      points={{-20,-31.619},{-22,-31.619},{-22,26},{-68,26},{-68,43},{-59.6,43}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[11], copyRoom.proBusC[1]) annotation (Line(
      points={{-20,-32},{-20,-32},{-20,36},{-3.2,36},{-3.2,40.2}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom.proBusC[1], southZone.propsBus[12]) annotation (Line(
      points={{36.8,40.2},{36.8,24},{-20,24},{-20,-32.381}},
      color={255,204,51},
      thickness=0.5));
  connect(smallRoom.proBusC[1], southZone.propsBus[13]) annotation (Line(
      points={{76.8,40.2},{76.8,2},{-20,2},{-20,-32.7619}},
      color={255,204,51},
      thickness=0.5));
  //14, 15, 16 and 17 go to the floor
  connect(southZone.propsBus[18], staW_WallC.propsBus_a) annotation (Line(
      points={{-20,-34.6667},{-74,-34.6667},{-74,-33},{-128,-33}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[19], staE_WallC.propsBus_a) annotation (Line(
      points={{-20,-35.0476},{-20,-16},{104,-16},{104,-35},{132,-35}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone.propsBus[20], inclinatedRoof.propsBus_a) annotation (Line(
      points={{-20,-35.4286},{-20,-35.4286},{-20,-58},{-20,-60},{-48,-60},{-48,
          -51}},
      color={255,204,51},
      thickness=0.5));
  connect(high_windows.propsBus_a, southZone.propsBus[21]) annotation (Line(
      points={{-102,-7},{-102,-7},{-102,-35.8095},{-20,-35.8095}},
      color={255,204,51},
      thickness=0.5));

  //External connections of other zones
  connect(meetingRoom.proBusD[1], copyRoom.proBusB[1]) annotation (Line(
      points={{20.4,43},{6,43},{6,56},{-1,56}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom.proBusB[1], smallRoom.proBusD[1]) annotation (Line(
      points={{39,56},{46,56},{46,52},{60.4,52},{60.4,43}},
      color={255,204,51},
      thickness=0.5));
  connect(smallRoom.proBusExt[1], internalWall.propsBus_a) annotation (Line(
      points={{58,59},{58,82},{57,82}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWall.propsBus_b, smallRoom.proBusExt[2]) annotation (Line(
      points={{67,82},{68,82},{68,68},{68,61},{58,61}},
      color={255,204,51},
      thickness=0.5));
  connect(bathroomZone.proBusB[1], staW[3]) annotation (Line(
      points={{-41,56},{-26,56},{-26,66},{-140,66},{-140,-9.33333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(staW_WallC.propsBus_b, staW[2]);
  connect(copyRoom.proBusD[1], staW[1]) annotation (Line(
      points={{-19.6,43},{-18,43},{-18,66},{-140,66},{-140,17.3333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(smallRoom.proBusB[1], staE[2]) annotation (Line(
      points={{79,56},{106,56},{130,56},{130,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(staE_WallC.propsBus_b, staE[1]);

  //Embedded port connections
  connect(inclinatedRoof.port_emb[1], port_emb[1]) annotation (Line(points={{
          -60,-46},{-118,-46},{-118,92.5},{0,92.5}}, color={191,0,0}));
  connect(copyRoom.port_emb, port_emb[2]) annotation (Line(points={{0,41},{12,
          41},{12,97.5},{0,97.5}}, color={191,0,0}));
  connect(meetingRoom.port_emb, port_emb[3]) annotation (Line(points={{40,41},{
          44,41},{44,42},{44,102.5},{0,102.5}}, color={191,0,0}));
  connect(smallRoom.port_emb, port_emb[4]) annotation (Line(points={{80,41},{92,
          41},{92,107.5},{0,107.5}}, color={191,0,0}));

  //Sensors connected to the data bus
  connect(copyRoom.TSensor, dataBus.T3rdFlr_CPR) annotation (Line(
      points={{1,52},{-68,52},{-68,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(meetingRoom.TSensor, dataBus.T3rdFlr_MTR) annotation (Line(
      points={{41,52},{-48,52},{-48,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(smallRoom.TSensor, dataBus.T3rdFlr_SmaR) annotation (Line(
      points={{81,52},{-28,52},{-28,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone.TSensor, dataBus.T3rdFlr_SZ) annotation (Line(
      points={{22,-36},{-60,-36},{-60,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  //Windows control signals
  connect(dataBus.eastShading3rd, southWindow2.Ctrl);
  connect(dataBus.southShading, southWindow3.Ctrl);
  connect(dataBus.westShading,southWindow4.Ctrl);

  //Convective and radiative connections
  connect(southZone.gainCon, gainCon[1]);
  connect(southZone.gainRad, gainRad[1]);
  connect(copyRoom.gainCon, gainCon[2]);
  connect(copyRoom.gainRad, gainRad[2]);
  connect(meetingRoom.gainCon, gainCon[3]);
  connect(meetingRoom.gainRad, gainRad[3]);
  connect(smallRoom.gainCon, gainCon[4]);
  connect(smallRoom.gainRad, gainRad[4]);
  connect(bathroomZone.gainCon, gainCon[5]);
  connect(bathroomZone.gainRad, gainRad[5]);

  //Occupancy connections
  connect(nOcc[1], southZone.yOcc) annotation (Line(points={{80,-110},{80,-110},
          {80,-34},{24,-34},{24,-32}},       color={0,0,127}));
  connect(nOcc[2], meetingRoom.yOcc) annotation (Line(points={{80,-90},{82,-90},
          {82,-4},{50,-4},{50,54},{42,54}},       color={0,0,127}));
annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
            {140,100}}), graphics={
          Rectangle(extent={{-140,100},{140,-100}},
                                                lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-70,70},{70,-70}},
          lineColor={28,108,200},
          textString="3")}),                                   Diagram(
      coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})));
end Floor3_noVent;
