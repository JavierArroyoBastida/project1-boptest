within INFRAX.SubSystems.BuildingEnvelope.Floor0;
model Floor0_noVent

  replaceable package Medium = IDEAS.Media.Air constrainedby
    Modelica.Media.Interfaces.PartialMedium;
  //CHANGE MEETING ROOM 2 FACES B (WOOD WALL) AND C
  //REARRANGE HALL AND MEETING ROOM1; ENTRANCE AS A PART OF THE HALL
  //MEETINGROOM1 simpleglass, same frame ratio as window1st floor
  //HALL west window same frame ratio as window1st floor

  IDEAS.Buildings.Components.Zone kitchen(
    V=strGndFlr.Vol_GndFlr_KT,
    hZone=strGndFlr.HeightGndFlr,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp,
    T_start=T_start,
    nSurf=12,
    redeclare IDEAS.Buildings.Components.Occupants.Fixed occNum)
   "Kitchen lunch room zone"
    annotation (Placement(transformation(extent={{80,-20},{120,20}})));
  INFRAX.Data.Parameters.StrGndFlr strGndFlr "Record with ground floor data"
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));
  IDEAS.Buildings.Components.OuterWall[2] KTouterWalls(
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    each inc=IDEAS.Types.Tilt.Wall,
    azi={INFRAX.Data.Orientations.E,INFRAX.Data.Orientations.S},
    A=strGndFlr.AWall_GndFlr_KT,
    T_start=T_start)
    "Kitchen/lunchroom outer walls"
    annotation (Placement(transformation(extent={{100,-46},{88,-26}})));

  outer IDEAS.BoundaryConditions.SimInfoManager sim "Data reader"
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));
  IDEAS.Buildings.Components.RectangularZoneTemplate MT1(
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare INFRAX.Data.Constructions.PlasterWall conTypB,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare INFRAX.Data.Constructions.PlasterWall conTypA,
    redeclare INFRAX.Data.Constructions.PlasterWall conTypD,
    redeclare INFRAX.Data.Constructions.Roof conTypCei,
    redeclare INFRAX.Data.Constructions.Floor conTypFlo,
    aziA=INFRAX.Data.Orientations.N,
    h=strGndFlr.HeightGndFlr,
    l=strGndFlr.l_GndFlr_MT2,
    w=strGndFlr.w_GndFlr_MT2,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    hasWinC=true,
    redeclare INFRAX.Data.Constructions.GlasswoolWall conTypC,
    A_winC=strGndFlr.AWindows_GndFlr_MT2,
    redeclare INFRAX.Data.Frames.INFRAXWood fraTypC,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    shaTypC(
      controlled=false,
      shaType=IDEAS.Buildings.Components.Shading.Interfaces.ShadingType.OverhangAndHorizontalFins,
      hWin=strGndFlr.WindowGndHeight,
      wWin=2.7 + 1.35,
      wLeft=1.35/2,
      wRight=1.35/2,
      ovDep=5.7,
      ovGap=8.17 - strGndFlr.WindowGndHeight,
      s=0.175,
      w=0.17,
      t=0.032,
      beta=0.5235987755983),
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Fixed occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp,
    redeclare IDEAS.Examples.TwinHouses.BaseClasses.Data.Materials.Glazing
      glazingC)
    "Big meeting room 1, placed on right just when entering the building"
    annotation (Placement(transformation(extent={{-2,-42},{22,-18}})));


  IDEAS.Buildings.Components.Zone hall(
    hZone=strGndFlr.HeightGndFlr,
    V=strGndFlr.Vol_GndFlr_HR,
    A=strGndFlr.A_GndFlr_HR,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    nSurf=22)
    "Entrance hall of the building"
    annotation (Placement(transformation(extent={{-76,-42},{-34,0}})));
  IDEAS.Buildings.Components.RectangularZoneTemplate FirstAid(
    redeclare INFRAX.Data.Constructions.Floor conTypFlo,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    aziA=INFRAX.Data.Orientations.N,
    h=strGndFlr.HeightGndFlr,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypA,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypB,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypC,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypD,
    redeclare INFRAX.Data.Constructions.Roof conTypCei,
    l=strGndFlr.l_GndFlr_1stAid,
    w=strGndFlr.w_GndFlr_1stAid,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    nSurfExt=1,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
    "First aid room"
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  IDEAS.Buildings.Components.Zone servers(
    V=strGndFlr.Vol_GndFlr_SV,
    hZone=strGndFlr.HeightGndFlr,
    nSurf=9,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
    "Room with servers"
    annotation (Placement(transformation(extent={{46,44},{72,68}})));
  IDEAS.Buildings.Components.OuterWall northWall_SV(
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=strGndFlr.AWall_GndFlr_SV,
    T_start=T_start)
    "Outer wall in servers room, facing north"
    annotation (
      Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={30,86})));
  IDEAS.Buildings.Components.InternalWall internalWall_HR_SV(
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=strGndFlr.AinternalWall_HRSV,
    T_start=T_start)
   "Internal wall between hall and server rooms"
    annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={40,28})));
  IDEAS.Buildings.Components.RectangularZoneTemplate bathroomZone(
    aziA=INFRAX.Data.Orientations.N,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypA,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypB,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypC,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypD,
    redeclare INFRAX.Data.Constructions.Roof conTypCei,
    redeclare INFRAX.Data.Constructions.Floor conTypFlo,
    l=strGndFlr.l_GndFlr_BRZ,
    w=strGndFlr.w_GndFlr_BRZ,
    h=strGndFlr.HeightGndFlr,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
  "Bathroom zone, not conditioned with air extraction"
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  IDEAS.Buildings.Components.Zone storage(
    V=strGndFlr.Vol_GndFlr_Sto,
    hZone=strGndFlr.HeightGndFlr,
    nSurf=7,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
  "Storage rooms in ground floor"
    annotation (Placement(transformation(extent={{108,48},{128,68}})));
  IDEAS.Buildings.Components.OuterWall northWall_sto(
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=strGndFlr.AWall_GndFlr_Sto,
    T_start=T_start)
  "Outer wall in storage rooms, facing north" annotation (
      Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={90,86})));
  IDEAS.Buildings.Components.InternalWall internalWall_KT_Sto(
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=strGndFlr.AinternalWall_KTSto,
    T_start=T_start)
  "Internal wall between kitchen and storage" annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={102,34})));
  IDEAS.Buildings.Components.InternalWall internalWall_SV_Sto(
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.W,
    A=strGndFlr.AinternalWall_SVSto,
    T_start=T_start)
  "Internal wall between servers and storage" annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=0,
        origin={82,60})));
  IDEAS.Buildings.Components.Zone MT2(
    V=strGndFlr.Vol_GndFlr_MT1,
    hZone=strGndFlr.HeightGndFlr,
    nSurf=8,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
  "Smaller meeting room, placed just left of the buildings entrance"
    annotation (Placement(transformation(extent={{-102,-82},{-78,-58}})));
  IDEAS.Buildings.Components.OuterWall[3] outerWall_MT1(
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    each inc=IDEAS.Types.Tilt.Wall,
    A=strGndFlr.AWall_GndFlr_MT1,
    azi={INFRAX.Data.Orientations.E,INFRAX.Data.Orientations.S,INFRAX.Data.Orientations.inc},
    T_start=T_start)
  "Array of outer walls for the big meeting room"
    annotation (Placement(transformation(extent={{-132,-76},{-120,-56}})));
  IDEAS.Buildings.Components.OuterWall outerWall_HR(
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.inc,
    A=strGndFlr.AWalls_GndFlr_HR,
    T_start=T_start)
  "Outer wall of the building hall (on the west side)"
    annotation (Placement(transformation(extent={{-132,-52},{-120,-32}})));
  IDEAS.Buildings.Components.InternalWall internalWall_HR_MT1(
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=strGndFlr.AinternalWall_HRMT1,
    T_start=T_start)
  "Internal wall between hall and the big meeting room" annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={-90,-40})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[8] flo(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
  "Bus to connect the floor zones to the floor-walls in the outer level"
    annotation (Placement(transformation(extent={{-20,-120},{20,-80}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[3] staW(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
  "Bus to connect the floor zones to the western stairs in the outer level"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={-140,4})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[2] staE(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
  "Bus to connect the floor zones to the eastern stairs in the outer level"
    annotation (
      Placement(transformation(
        extent={{-20,20},{20,-20}},
        rotation=-90,
        origin={140,0})));
  IDEAS.Buildings.Components.InternalWall staW_wallC(
    redeclare INFRAX.Data.Constructions.ConcreteWall constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=4.85*strGndFlr.HeightGndFlr,
    T_start=T_start)
 "Southern internal wall towards the west stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=180,
        origin={-132,-20})));
  IDEAS.Buildings.Components.InternalWall staW_wallB(
    redeclare INFRAX.Data.Constructions.ConcreteWall constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.E,
    A=4.3*strGndFlr.HeightGndFlr,
    T_start=T_start)
 "Eastern internal wall towards the west stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=180,
        origin={-110,56})));
  IDEAS.Buildings.Components.InternalWall staE_wallD(
    inc=IDEAS.Types.Tilt.Wall,
    A=4.15*strGndFlr.HeightGndFlr,
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    azi=INFRAX.Data.Orientations.W,
    T_start=T_start)
 "Western internal wall towards the east stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=180,
        origin={130,34})));
  IDEAS.Buildings.Components.InternalWall staE_wallC(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=2.7*strGndFlr.HeightGndFlr,
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    T_start=T_start)
 "Southern internal wall towards the east stair zone in the outer level"
     annotation (Placement(
        transformation(
        extent={{6,-10},{-6,10}},
        rotation=180,
        origin={130,-38})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[16] cei(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
  "Bus to connect the floor zones to the ceiling-walls in the outer level"
    annotation (Placement(transformation(extent={{-20,120},{20,80}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus sndcei(each
      numIncAndAziInBus=sim.numIncAndAziInBus)
  "Bus to connect the floor zones to the second floor floor in the outer level
  (hollow of glass)"
    annotation (Placement(transformation(extent={{-80,120},{-40,80}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[4] glasswall(each
      numIncAndAziInBus=sim.numIncAndAziInBus)
  "Bus to connect the hall to the glass walls of the second floor"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=180,
        origin={-100,100})));
  IDEAS.Buildings.Components.Window meetingRoom1Window_west(
      inc=IDEAS.Types.Tilt.Wall,
      redeclare INFRAX.Data.Frames.INFRAXWood fraType,
      redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
      A=strGndFlr.AWindows_GndFlr_MT1[2],
      azi=INFRAX.Data.Orientations.inc,
      redeclare IDEAS.Buildings.Components.Shading.BuildingShade shaType(
      hWin=strGndFlr.WindowHeight,
      L=5.0,
      dh=10.0 - 2.04),
      T_start=T_start)
  "Small meeting room western window"
    annotation (Placement(transformation(extent={{-132,-100},{-120,-80}})));
  IDEAS.Buildings.Components.Window window_KT1(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    A=strGndFlr.AWindows_GndFlr_KT[1],
    frac=strGndFlr.FrameRatio_GndFlr_KT[1],
    azi=INFRAX.Data.Orientations.E,
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      dep=1.80,
      hWin=strGndFlr.WindowGndHeight,
      wWin=2.7 + 1.35,
      wLeft=(2.7 - 1.47)/2,
      wRight=(2.7 - 1.47)/2,
      gap=8.17 - strGndFlr.WindowGndHeight,
      beta=0.5235987755983,
      s=0.175,
      w=0.17,
      t=0.032),
      redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing)
    "Eastern windows in kitchen/lunch room"
    annotation (Placement(transformation(extent={{100,-74},{88,-54}})));
  IDEAS.Buildings.Components.Window window_KT2(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    A=strGndFlr.AWindows_GndFlr_KT[2],
    frac=strGndFlr.FrameRatio_GndFlr_KT[2],
    azi=INFRAX.Data.Orientations.S,
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      dep=5.70,
      hWin=strGndFlr.WindowGndHeight,
      wWin=2.7 + 1.35,
      wLeft=1.35/2,
      wRight=1.35/2,
      gap=8.17 - strGndFlr.WindowGndHeight,
      beta=0.5235987755983,
      s=0.175,
      w=0.17,
      t=0.032),
      redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
      T_start=T_start)
    "Southern windows in kitchen/lunch room"
    annotation (Placement(transformation(extent={{100,-74},{88,-54}})));

  IDEAS.Buildings.Components.Window hallWindows_west(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    A=strGndFlr.AWindows_GndFlr_HR[2],
    azi=INFRAX.Data.Orientations.inc,
    redeclare IDEAS.Buildings.Components.Shading.BuildingShade shaType(
      L=5,
      dh=10 - 2.04,
      hWin=3.18*strGndFlr.WindowGndHeight + strGndFlr.WindowD/strGndFlr.WindowHeight),
      T_start=T_start)
    "Western windows in the hall"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={-56,-56})));
  INFRAX.SubSystems.Controllers.DataBus dataBus "Bus connecting floor sensors"
    annotation (Placement(transformation(extent={{-160,20},{-120,60}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[8] gainCon
  "Bus to connect convective heat transfer to the zones"
  annotation (Placement(transformation(extent={{130,-60},{150,-40}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[8] gainRad
  "Bus to connect radiative heat transfer to the zones"
   annotation (Placement(transformation(extent={{130,-80},{150,-60}})));
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsAir=Modelica.Fluid.Types.Dynamics.FixedInitial
    "Type of energy balance for air model: dynamic (3 initialization options) or steady state";

  parameter Real mSenFac=5
    "Correction factor for thermal capacity of zone air.";

  Modelica.Blocks.Interfaces.RealInput[3] nOcc
  "Input for number of occupants" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={50,-100})));

  IDEAS.Buildings.Components.Window meetingRoom1Window_east(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare Data.Frames.INFRAXWood fraType,
    redeclare Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    A=strGndFlr.AWindows_GndFlr_MT1[1],
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      wLeft=16.1,
      wRight=0.8 + 5,
      dep=27,
      s=0.175,
      w=0.17,
      t=0.032,
      hWin=5.24 - 0.8,
      wWin=strGndFlr.WindowHeight,
      gap=8.17 - 3.25,
      beta=0.5235987755983),
      azi=INFRAX.Data.Orientations.E,
      T_start=T_start) "Small meeting room eastern window"
     annotation (Placement(transformation(extent={{-118,-100},{-106,-80}})));
  IDEAS.Buildings.Components.Window hallWindows_south(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare Data.Frames.INFRAXWood fraType,
    redeclare Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    A=strGndFlr.AWindows_GndFlr_HR[1],
    azi=INFRAX.Data.Orientations.S,
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      s=0.175,
      w=0.17,
      t=0.032,
      wLeft=1.35/2,
      wRight=1.35/2,
      dep=5.7,
      hWin=strGndFlr.WindowHeight,
      gap=8.17 - strGndFlr.WindowGndHeight,
      wWin=3*2.7,
      beta=0.5235987755983),
      T_start=T_start)
  "Southern windows of the hall zone"
 annotation (
      Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={-30,-56})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=293.15
    "Start value of temperature";
   parameter Real[8] A_Conv = {servers.A, FirstAid.A, kitchen.A,MT2.A,MT1.A,
    hall.A, storage.A, bathroomZone.A} "Convective area of zones";

  IDEAS.Buildings.Components.InternalWall internalWall_HR_MT2(
    redeclare Data.Constructions.SilicateWall constructionType,
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    T_start=T_start,
    A=strGndFlr.AinternalWall_kitchen_hallway,
    hasCavity=true,
    w=2,
    h=strGndFlr.HeightGndFlr)
    "Internwall wall between hall and big meeting room" annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=180,
        origin={20,6})));
equation

  //Kitchen/lunchroom connections
  connect(kitchen.propsBus[1], KTouterWalls[1].propsBus_a) annotation (Line(
      points={{80,11.6667},{70,11.6667},{60,11.6667},{60,-34},{89,-34}},
      color={255,204,51},
      thickness=0.5));
  connect(kitchen.propsBus[2], KTouterWalls[2].propsBus_a);
  connect(kitchen.propsBus[3], window_KT1.propsBus_a) annotation (Line(
      points={{80,10.3333},{70,10.3333},{60,10.3333},{60,-62},{89,-62}},
      color={255,204,51},
      thickness=0.5));
  connect(kitchen.propsBus[4], window_KT2.propsBus_a);
  connect(MT1.proBusB[1], kitchen.propsBus[5]) annotation (Line(
      points={{20.8,-22.8},{40,-22.8},{40,9},{80,9}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWall_KT_Sto.propsBus_b, kitchen.propsBus[6]) annotation (Line(
      points={{100,29},{80,29},{80,8.33333}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWall_HR_MT2.propsBus_b, kitchen.propsBus[12]) annotation (
      Line(
      points={{25,4},{52,4},{52,4.33333},{80,4.33333}},
      color={255,204,51},
      thickness=0.5));
  //Hall connections
  connect(hall.propsBus[1],MT1. proBusA[1]) annotation (Line(
      points={{-76,-8.59091},{-76,-8.59091},{-76,12},{-76,14},{4,14},{4,-19.2},
          {2.8,-19.2}},
      color={255,204,51},
      thickness=0.5));
  connect(hall.propsBus[2],MT1. proBusD[1]) annotation (Line(
      points={{-76,-8.97273},{-76,-8.97273},{-76,14},{-4,14},{-4,-38.4},{-1.52,
          -38.4}},
      color={255,204,51},
      thickness=0.5));
  connect(FirstAid.proBusC[1], hall.propsBus[3]) annotation (Line(
      points={{16.8,40.2},{16.8,28},{-76,28},{-76,-9.35455}},
      color={255,204,51},
      thickness=0.5));
  connect(FirstAid.proBusD[1], hall.propsBus[4]) annotation (Line(
      points={{0.4,43},{-38,43},{-76,43},{-76,-9.73636}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWall_HR_SV.propsBus_b, hall.propsBus[5]) annotation (Line(
      points={{38,23},{-20,23},{-20,22},{-76,22},{-76,-10.1182}},
      color={255,204,51},
      thickness=0.5));
  connect(bathroomZone.proBusC[1], hall.propsBus[6]) annotation (Line(
      points={{-83.2,60.2},{-83.2,60.2},{-83.2,-12},{-76,-12},{-76,-10.5}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWall_HR_MT1.propsBus_a, hall.propsBus[7]) annotation (Line(
      points={{-92,-35},{-92,-35},{-92,-12},{-76,-12},{-76,-10.8818}},
      color={255,204,51},
      thickness=0.5));
  connect(hall.propsBus[8], outerWall_HR.propsBus_a) annotation (Line(
      points={{-76,-11.2636},{-121,-11.2636},{-121,-40}},
      color={255,204,51},
      thickness=0.5));
  connect(hall.propsBus[20], hallWindows_west.propsBus_a) annotation (Line(
      points={{-76,-15.8455},{-76,-15.8455},{-76,-48},{-58,-48},{-58,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(hall.propsBus[21], hallWindows_south.propsBus_a) annotation (Line(
      points={{-76,-16.2273},{-76,-48},{-32,-48},{-32,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWall_HR_MT2.propsBus_a, hall.propsBus[22]) annotation (Line(
      points={{15,4},{-6,4},{-6,6},{-76,6},{-76,-16.6091}},
      color={255,204,51},
      thickness=0.5));
  //Server connections
  connect(FirstAid.proBusA[1], servers.propsBus[1]) annotation (Line(
      points={{4,59},{4,62.9333},{46,62.9333}},
      color={255,204,51},
      thickness=0.5));
  connect(FirstAid.proBusB[1], servers.propsBus[2]) annotation (Line(
      points={{19,56},{32,56},{46,56},{46,62.4}},
      color={255,204,51},
      thickness=0.5));
  connect(servers.propsBus[3], northWall_SV.propsBus_a) annotation (Line(
      points={{46,61.8667},{46,60.8},{32,60.8},{32,81}},
      color={255,204,51},
      thickness=0.5));
  connect(servers.propsBus[4], internalWall_HR_SV.propsBus_a) annotation (Line(
      points={{46,61.3333},{42,61.3333},{42,33},{38,33}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWall_SV_Sto.propsBus_b, servers.propsBus[5]) annotation (Line(
      points={{77,62},{76,62},{76,72},{76,74},{46,74},{46,60.8}},
      color={255,204,51},
      thickness=0.5));
  //Storage room connections
  connect(storage.propsBus[1], northWall_sto.propsBus_a) annotation (Line(
      points={{108,63.7143},{92,63.7143},{92,81}},
      color={255,204,51},
      thickness=0.5));
  connect(storage.propsBus[2], internalWall_SV_Sto.propsBus_a) annotation (Line(
      points={{108,63.1429},{98,63.1429},{98,62},{87,62}},
      color={255,204,51},
      thickness=0.5));
  connect(storage.propsBus[3], internalWall_KT_Sto.propsBus_a) annotation (Line(
      points={{108,62.5714},{100,62.5714},{100,39}},
      color={255,204,51},
      thickness=0.5));
  //Small meeting room connections
  connect(MT2.propsBus[1], outerWall_MT1[2].propsBus_a) annotation (Line(
      points={{-102,-63.1},{-112,-63.1},{-112,-64},{-121,-64}},
      color={255,204,51},
      thickness=0.5));
  connect(MT2.propsBus[2], outerWall_MT1[3].propsBus_a) annotation (Line(
      points={{-102,-63.7},{-112,-64},{-121,-64}},
      color={255,204,51},
      thickness=0.5));
  connect(MT2.propsBus[3], internalWall_HR_MT1.propsBus_b) annotation (Line(
      points={{-102,-64.3},{-102,-64.3},{-102,-45},{-92,-45}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom1Window_west.propsBus_a,MT2. propsBus[6]);
  connect(meetingRoom1Window_east.propsBus_a,MT2. propsBus[7]) annotation (Line(
      points={{-107,-88},{-107,-88},{-102,-88},{-102,-66.7}},
      color={255,204,51},
      thickness=0.5));
  connect(outerWall_MT1[1].propsBus_a,MT2. propsBus[8]);
  //Floor connections
  connect(MT1.proBusFlo[1], flo[3]);
  connect(MT2.propsBus[4], flo[2]);
  connect(hall.propsBus[9], flo[1]);
  connect(kitchen.propsBus[7], flo[4]);
  connect(servers.propsBus[6], flo[5]);
  connect(FirstAid.proBusFlo[1], flo[6]);
  connect(bathroomZone.proBusFlo[1], flo[7]);
  connect(storage.propsBus[4], flo[8]);
  //Stairs connections
  connect(bathroomZone.proBusB[1], staW[3]) annotation (Line(
      points={{-81,76},{-82,76},{-82,84},{-120,84},{-120,-9.33333},{-140,
          -9.33333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(staW_wallC.propsBus_a, staW[2]) annotation (Line(
      points={{-137,-22},{-140,-22},{-140,4}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hall.propsBus[10], staW_wallC.propsBus_b) annotation (Line(
      points={{-76,-12.0273},{-76,-22},{-127,-22}},
      color={255,204,51},
      thickness=0.5));
  connect(servers.propsBus[7], staW_wallB.propsBus_b) annotation (Line(
      points={{46,59.7333},{-30,59.7333},{-30,54},{-105,54}},
      color={255,204,51},
      thickness=0.5));
  connect(staW_wallB.propsBus_a, staW[1]) annotation (Line(
      points={{-115,54},{-128,54},{-140,54},{-140,17.3333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(storage.propsBus[5], staE_wallD.propsBus_b) annotation (Line(
      points={{108,61.4286},{108,61.4286},{108,42},{125,42},{125,32}},
      color={255,204,51},
      thickness=0.5));
  connect(staE_wallD.propsBus_a, staE[2]) annotation (Line(
      points={{135,32},{136,32},{136,0},{130,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(staE_wallC.propsBus_a, staE[1]) annotation (Line(
      points={{135,-40},{136,-40},{136,0},{150,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(kitchen.propsBus[8], staE_wallC.propsBus_b) annotation (Line(
      points={{80,7},{80,7},{80,-24},{124,-24},{124,-40},{125,-40}},
      color={255,204,51},
      thickness=0.5));
  //Ceiling connections
  connect(hall.propsBus[11], cei[1]);
  connect(hall.propsBus[12], cei[2]);
  connect(hall.propsBus[13], cei[3]);
  connect(hall.propsBus[14], cei[4]);
  connect(kitchen.propsBus[9], cei[5]);
  connect(kitchen.propsBus[10], cei[6]);
  connect(kitchen.propsBus[11], cei[7]);
  connect(servers.propsBus[8], cei[8]);
  connect(servers.propsBus[9], cei[9]);
  connect(storage.propsBus[6], cei[10]);
  connect(storage.propsBus[7], cei[11]);
  connect(MT2.propsBus[5], cei[12]);
  connect(MT1.proBusCei[1], cei[13]);
  connect(FirstAid.proBusCei[1], cei[14]);
  connect(bathroomZone.proBusCei[1], cei[16]);
  connect(FirstAid.proBusExt[1], cei[15]) annotation (Line(
      points={{-2,60},{-2,83.75},{0,83.75}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hall.propsBus[15], sndcei) annotation (Line(
      points={{-76,-13.9364},{-76,-13.9364},{-76,50},{-60,50},{-60,100}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  //Glass wall towards hollow space
  connect(hall.propsBus[16], glasswall[1]) annotation (Line(
      points={{-76,-14.3182},{-84,-14.3182},{-84,-12},{-100,-12},{-100,115}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hall.propsBus[17], glasswall[2]);
  connect(hall.propsBus[18], glasswall[3]);
  connect(hall.propsBus[19], glasswall[4]);
  //Data bus connections
  connect(hall.TSensor, dataBus.TGndFlr_hall) annotation (Line(
      points={{-31.9,-16.8},{-82.37,-16.8},{-82.37,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(MT1.TSensor, dataBus.TGndFlr_MT1) annotation (Line(
      points={{23.2,-27.6},{-106,-27.6},{-106,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(MT2.TSensor, dataBus.TGndFlr_MT2) annotation (Line(
      points={{-76.8,-67.6},{-60,-67.6},{-60,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(kitchen.TSensor, dataBus.TGndFlr_KTR) annotation (Line(
      points={{122,4},{-10.4,4},{-10.4,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(servers.TSensor, dataBus.TGndFlr_SVR) annotation (Line(
      points={{73.3,58.4},{-34,58.4},{-34,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(FirstAid.TSensor, dataBus.TGndFlr_1stAid) annotation (Line(
      points={{21,52},{-62,52},{-62,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  //Convective and radiative connections
  connect(servers.gainCon, gainCon[1]);
  connect(servers.gainRad, gainRad[1]);
  connect(FirstAid.gainCon, gainCon[2]);
  connect(FirstAid.gainRad, gainRad[2]);
  connect(kitchen.gainCon, gainCon[3]);
  connect(kitchen.gainRad, gainRad[3]);
  connect(MT2.gainCon, gainCon[4]);
  connect(MT2.gainRad, gainRad[4]);
  connect(MT1.gainCon, gainCon[5]);
  connect(MT1.gainRad, gainRad[5]);
  connect(hall.gainCon, gainCon[6]);
  connect(hall.gainRad, gainRad[6]);
  connect(storage.gainCon, gainCon[7]);
  connect(storage.gainRad, gainRad[7]);
  connect(bathroomZone.gainCon, gainCon[8]);
  connect(bathroomZone.gainRad, gainRad[8]);
  //Occupancy connections
  connect(nOcc[1], kitchen.yOcc) annotation (Line(points={{50,-113.333},{50,
          -113.333},{50,-76},{124,-76},{124,8}},       color={0,0,127}));
  connect(nOcc[2],MT1. yOcc) annotation (Line(points={{50,-100},{50,-25.2},{
          24.4,-25.2}},
                   color={0,0,127}));
  connect(nOcc[3],MT2. yOcc) annotation (Line(points={{50,-86.6667},{50,
          -86.6667},{50,-30},{-75.6,-30},{-75.6,-65.2}},
                                                       color={0,0,127}));
annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
            {140,100}}), graphics={
          Rectangle(extent={{-140,100},{140,-100}},
                                                lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-70,70},{70,-70}},
          lineColor={28,108,200},
          textString="0")}),                                   Diagram(
      coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})));
end Floor0_noVent;
