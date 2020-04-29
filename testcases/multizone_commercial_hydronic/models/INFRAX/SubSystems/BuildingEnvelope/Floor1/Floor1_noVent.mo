within INFRAX.SubSystems.BuildingEnvelope.Floor1;
model Floor1_noVent

  replaceable package Medium = IDEAS.Media.Air constrainedby
    Modelica.Media.Interfaces.PartialMedium;
  outer IDEAS.BoundaryConditions.SimInfoManager sim "Data reader"
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));
  IDEAS.Buildings.Components.RectangularZoneTemplate meetingRoom1(
    redeclare IDEAS.Buildings.Data.Constructions.CavityWall conTypCei,
    aziA=INFRAX.Data.Orientations.N,
    l=str1stFlr.l_1stFlr_MTR1,
    w=str1stFlr.w_1stFlr_CPR,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    h=str1stFlr.Height1stFlr,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall conTypA,
    redeclare INFRAX.Data.Constructions.PlasterWallCavity conTypB,
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall conTypC,
    redeclare INFRAX.Data.Constructions.GlassWall conTypD,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    nSurfExt=1,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Meeting room next to 1st floor reception"
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  IDEAS.Buildings.Components.RectangularZoneTemplate meetingRoom2(
    redeclare IDEAS.Buildings.Data.Constructions.CavityWall conTypCei,
    aziA=INFRAX.Data.Orientations.N,
    l=str1stFlr.l_1stFlr_MTR2,
    w=str1stFlr.w_1stFlr_MTR2,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    h=str1stFlr.Height1stFlr,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall conTypA,
    redeclare INFRAX.Data.Constructions.GlassWall conTypB,
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall conTypC,
    redeclare INFRAX.Data.Constructions.PlasterWallCavity conTypD,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Meeting room further to 1st floor reception"
    annotation (Placement(transformation(extent={{80,0},{100,20}})));
  INFRAX.Data.Parameters.Str1stFlr str1stFlr "Record containing 1st floor data"
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));
  IDEAS.Buildings.Components.Zone northZone(
    V=str1stFlr.Vol_1stFlr_NZ,
    hZone=str1stFlr.Height1stFlr,
    nSurf=16,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Northern landscape office, lumping the three small offices"
    annotation (Placement(transformation(extent={{36,54},{64,82}})));
  IDEAS.Buildings.Components.InternalWall[2] internalWallNZ(
    each inc=IDEAS.Types.Tilt.Wall,
    azi={INFRAX.Data.Orientations.N,INFRAX.Data.Orientations.W},
    A=str1stFlr.AinternalWallsNZ,
    redeclare INFRAX.Data.Constructions.PlasterWall constructionType,
    T_start=T_start)
    "Walls adding thermal mass to the northern landscape zone"
    annotation (Placement(transformation(extent={{84,60},{96,80}})));
  IDEAS.Buildings.Components.OuterWall northWall(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=str1stFlr.AWall_1stFlr_NZ - str1stFlr.AWindows_1stFlr_NZ,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    T_start=T_start)
    "Outer wall connected to the northern landscape zone"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={80,94})));
  IDEAS.Buildings.Components.Window northWindows(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=str1stFlr.AWindows_1stFlr_NZ,
    frac=str1stFlr.FrameRatio_1stFlr_NZ,
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start)
    "Windows connected to the northern landscape zone"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={100,94})));
  IDEAS.Buildings.Components.Zone southZone2(
    hZone=str1stFlr.Height1stFlr,
    V=str1stFlr.Vol_1stFlr_SZ2,
    nSurf=22,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
   "Southern landscape office, situated on the eastern side of the building"
    annotation (Placement(transformation(extent={{32,-60},{70,-20}})));
  IDEAS.Buildings.Components.OuterWall[2] SZ2Wall(
    inc=IDEAS.Types.Tilt.Wall,
    A=str1stFlr.AWall_1stFlr_SZ2 - str1stFlr.AWindows_1stFlr_SZ2,
    azi={INFRAX.Data.Orientations.E,INFRAX.Data.Orientations.S},
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    T_start=T_start)
   "Array of outer walls connected to the southern landscape office"
    annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={40,-74})));
  IDEAS.Buildings.Components.Window SZ2Windows1(
    inc=IDEAS.Types.Tilt.Wall,
    A=str1stFlr.AWindows_1stFlr_SZ2[1],
    frac=str1stFlr.FrameRatio_1stFlr_SZ2[1],
    azi=INFRAX.Data.Orientations.E,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      wWin=1.47,
      w=0.17,
      s=0.175,
      t=0.032,
      hWin=str1stFlr.WindowHeight,
      gap=8.17 - 7.12,
      wRight=(2.7 - 1.47)/2,
      wLeft=(2.7 - 1.47)/2,
      dep=1.80,
      beta=0.5235987755983),
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing)
  "Eastern windows connected to the southern landscape office"
    annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={60,-74})));
  IDEAS.Buildings.Components.Window SZ2Windows2(
    inc=IDEAS.Types.Tilt.Wall,
    A=str1stFlr.AWindows_1stFlr_SZ2[2],
    frac=str1stFlr.FrameRatio_1stFlr_SZ2[2],
    azi=INFRAX.Data.Orientations.S,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      wWin=1.47,
      w=0.17,
      s=0.175,
      t=0.032,
      hWin=str1stFlr.WindowHeight,
      gap=8.17 - 7.12,
      wRight=(2.7 - 1.47)/2,
      wLeft=(2.7 - 1.47)/2,
      dep=5.70,
      beta=0.5235987755983),
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start)
    "Southern windows connected to the southern landscape office"
    annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={60,-88})));
///NOTE: Windows are not in array due to different shading parameters
  IDEAS.Buildings.Components.InternalWall[2] internalWallSZ2(
    each inc=IDEAS.Types.Tilt.Wall,
    azi={INFRAX.Data.Orientations.N,INFRAX.Data.Orientations.W},
    A=str1stFlr.AinternalWallsSZ2,
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall constructionType,
    T_start=T_start)
    "Walls adding thermal mass to the southern landscape office from the copy rooms"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={50,-4})));
  IDEAS.Buildings.Components.InternalWall internalWallNZSZ2(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=str1stFlr.AinternalWall_NZSZ2,
    redeclare INFRAX.Data.Constructions.ReinforcedGlassWall constructionType,
    T_start=T_start)
    "Internal wall between northern and southern landscape offices"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={34,30})));
  IDEAS.Buildings.Components.Zone southZone1(
    hZone=str1stFlr.Height1stFlr,
    V=str1stFlr.Vol_1stFlr_SZ1,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    nSurf=13,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.Occupants.Input occNum,
    redeclare IDEAS.Buildings.Components.OccupancyType.OfficeWork occTyp)
    "Southern extension office, situated in the south-west corner of the building"
    annotation (Placement(transformation(extent={{-58,-84},{-20,-44}})));
  IDEAS.Buildings.Components.OuterWall[3] SZ1Wall(
    inc=IDEAS.Types.Tilt.Wall,
    azi={INFRAX.Data.Orientations.E,INFRAX.Data.Orientations.S,INFRAX.Data.Orientations.inc},
    A={str1stFlr.AWall_1stFlr_SZ1[1] - str1stFlr.AWindows_1stFlr_SZ1[1],
        str1stFlr.AWall_1stFlr_SZ1[2],str1stFlr.AWall_1stFlr_SZ1[3] - str1stFlr.AWindows_1stFlr_SZ1
        [2]},
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    T_start=T_start)
   "Outer walls of the southern extension office"
    annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={-90,-84})));
  IDEAS.Buildings.Components.Window SZ1Windows_west(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    A=str1stFlr.AWindows_1stFlr_SZ1[3],
    frac=str1stFlr.FrameRatio_1stFlr_SZ1[3],
    azi=INFRAX.Data.Orientations.inc,
    redeclare IDEAS.Buildings.Components.Shading.BuildingShade shaType(
      L=5,
      dh=10.0 - 6.77,
      hWin=(str1stFlr.WindowF + str1stFlr.WindowG)/str1stFlr.WindowHeight1stFlr),
    T_start=T_start)
   "Western windows connected to the southern extension office"
   annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={-70,-72})));
    IDEAS.Buildings.Components.Window SZ1Windows_east(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare Data.Frames.INFRAXWood fraType,
    redeclare Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    A=str1stFlr.AWindows_1stFlr_SZ1[1],
    frac=str1stFlr.FrameRatio_1stFlr_SZ1[1],
    azi=INFRAX.Data.Orientations.E,
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      w=0.17,
      s=0.175,
      t=0.032,
      hWin=str1stFlr.WindowHeight,
      gap=8.17 - 7.12,
      dep=27,
      wWin=(5.7 - 0.8 - 0.41),
      wLeft=16.1,
      wRight=0.8 + 5,
      beta=0.5235987755983),
    T_start=T_start)
  "Southern extension office eastern window"
    annotation (Placement(transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={-70,-84})));
  IDEAS.Buildings.Components.Window SZ1Windows_south(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare Data.Frames.INFRAXWood fraType,
    redeclare Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    azi=INFRAX.Data.Orientations.S,
    A=str1stFlr.AWindows_1stFlr_SZ1[2],
    frac=str1stFlr.FrameRatio_1stFlr_SZ1[2],
    redeclare IDEAS.Buildings.Components.Shading.OverhangAndHorizontalFins
      shaType(
      wWin=1.47,
      w=0.17,
      s=0.175,
      t=0.032,
      hWin=str1stFlr.WindowHeight,
      gap=8.17 - 7.12,
      wLeft=(2.7 - 1.47)/2,
      dep=5.70,
      wRight=2.7*5,
      beta=0.5235987755983),
    T_start=T_start)
    "Southern extension office southern window"
      annotation (Placement(
        transformation(
        extent={{6,-10},{-6,10}},
        rotation=-90,
        origin={-70,-96})));
  IDEAS.Buildings.Components.Zone hall(
    hZone=str1stFlr.Height1stFlr,
    V=str1stFlr.Vol_1stFlr_hall,
    nSurf=13,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
   "Entrance hall of the first floor"
    annotation (Placement(transformation(extent={{-54,8},{-18,44}})));
  IDEAS.Buildings.Components.OuterWall[2] hallWalls(
    inc=IDEAS.Types.Tilt.Wall,
    azi={INFRAX.Data.Orientations.N,INFRAX.Data.Orientations.inc},
    A=str1stFlr.AWall_1stFlr_hall - str1stFlr.AWindows_1stFlr_hall,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls constructionType,
    T_start=T_start)
   "Array of outer walls connected to the entrance hall"
    annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=180,
        origin={-106,18})));
  IDEAS.Buildings.Components.Window hallWindows_west(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    redeclare IDEAS.Buildings.Components.Shading.BuildingShade shaType(
      L=5,
      hWin=(str1stFlr.WindowF + str1stFlr.WindowG)/str1stFlr.WindowHeight1stFlr,
      dh=10 - 6.77),
    azi=INFRAX.Data.Orientations.inc,
    A=str1stFlr.AWindows_1stFlr_hall[2],
    frac=str1stFlr.FrameRatio_1stFlr_hall[2],
    T_start=T_start)
  "Western windows connected to the entrance hall"
    annotation (Placement(
        transformation(
        extent={{6,10},{-6,-10}},
        rotation=180,
        origin={-106,42})));
    IDEAS.Buildings.Components.Window hallWindows_north(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare Data.Frames.INFRAXWood fraType,
    redeclare Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    redeclare IDEAS.Buildings.Components.Shading.BuildingShade shaType(
      L=5,
      hWin=(str1stFlr.WindowF + str1stFlr.WindowG)/str1stFlr.WindowHeight1stFlr,
      dh=10 - 6.77),
    azi=INFRAX.Data.Orientations.N,
    A=str1stFlr.AWindows_1stFlr_hall[1],
    frac=str1stFlr.FrameRatio_1stFlr_hall[1],
    T_start=T_start)
    "Hall north window (next to bathroom)"
    annotation (Placement(
        transformation(
        extent={{6,10},{-6,-10}},
        rotation=180,
        origin={-92,42})));
  IDEAS.Buildings.Components.InternalWall internalWallhallSZ1(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=str1stFlr.AinternalWall_hallSZ1,
    redeclare INFRAX.Data.Constructions.PlasterWall constructionType,
    T_start=T_start)
  "Wall between the entrance hall and the southern extension hall"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={-78,-12})));
  IDEAS.Buildings.Components.RectangularZoneTemplate bathroomZone(
    aziA=INFRAX.Data.Orientations.N,
    h=str1stFlr.Height1stFlr,
    l=str1stFlr.l_1stFlr_BRZ,
    w=str1stFlr.w_1stFlr_BRZ,
    bouTypA=IDEAS.Buildings.Components.Interfaces.BoundaryType.OuterWall,
    bouTypC=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    bouTypD=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare IDEAS.Buildings.Data.Constructions.CavityWall conTypCei,
    bouTypCei=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    redeclare IDEAS.Buildings.Validation.Data.Constructions.HeavyFloor
      conTypFlo,
    bouTypB=IDEAS.Buildings.Components.Interfaces.BoundaryType.InternalWall,
    redeclare replaceable INFRAX.Data.Constructions.OuterWalls conTypA,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypB,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypC,
    redeclare INFRAX.Data.Constructions.SilicateWall conTypD,
    bouTypFlo=IDEAS.Buildings.Components.Interfaces.BoundaryType.External,
    energyDynamicsAir=energyDynamicsAir,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    hasCavityD=true)
  "Bathroom zone, not conditioned and with air extraction"
    annotation (Placement(transformation(extent={{-54,72},{-34,92}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[7] cei(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
   "Bus to connect the floor zones to the ceiling walls in the outer level"
    annotation (Placement(transformation(extent={{-20,120},{20,80}})));
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
    A=4.85*str1stFlr.Height1stFlr,
    redeclare INFRAX.Data.Constructions.ConcreteWall constructionType,
    T_start=T_start)
    "Southern internal wall towards the west stair zone in the outer level"
     annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=90,
        origin={-130,-28})));
  IDEAS.Buildings.Components.InternalWall staW_WallB(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.W,
    A=4.5*str1stFlr.Height1stFlr,
    redeclare INFRAX.Data.Constructions.ConcreteWall constructionType,
    T_start=T_start)
  "Eastern internal wall towards the west stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{-6,10},{6,-10}},
        rotation=0,
        origin={-124,64})));
  IDEAS.Buildings.Components.InternalWall staE_WallC(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    A=2.55*str1stFlr.Height1stFlr,
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
    A=4.5*str1stFlr.Height1stFlr,
    redeclare INFRAX.Data.Constructions.SilicateWall constructionType,
    T_start=T_start)
  "Western internal wall towards the east stair zone in the outer level"
    annotation (Placement(transformation(
        extent={{6,10},{-6,-10}},
        rotation=0,
        origin={114,30})));
  IDEAS.Buildings.Components.OuterWall[2] roof1stFlr(
    inc=IDEAS.Types.Tilt.Ceiling,
    azi=0,
    A=str1stFlr.Roof1stFlr,
    redeclare INFRAX.Data.Constructions.Roof constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
   "Outer roof of the southern extension and hall"
    annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-70,76})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[16] flo(each numIncAndAziInBus=
        sim.numIncAndAziInBus)
  "Bus to connect the floor zones to the floor walls in the outer level"
    annotation (Placement(transformation(extent={{-20,-120},{20,-80}})));
  IDEAS.Buildings.Components.Interfaces.ZoneBus[4] glasswall(each
      numIncAndAziInBus=sim.numIncAndAziInBus)
  "Bus of the hollow walls in the first floor"
    annotation (Placement(transformation(extent={{-140,-120},{-100,-80}})));
  IDEAS.Buildings.Components.InternalWall[4] glassWall(
    inc=IDEAS.Types.Tilt.Wall,
    redeclare INFRAX.Data.Constructions.GlassWall constructionType,
    azi={INFRAX.Data.Orientations.N,INFRAX.Data.Orientations.E,INFRAX.Data.Orientations.S,
        INFRAX.Data.Orientations.W},
    A=str1stFlr.Height1stFlr*{str1stFlr.l_1stFlr_GH,str1stFlr.w_1stFlr_GH,
        str1stFlr.l_1stFlr_GH,str1stFlr.w_1stFlr_GH},
    T_start=T_start)
  "Glass walls of the hollow in the first floor"
    annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={-118,-70})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[2] port_emb
  "Embedded port towards outer walls in the extension roof"
    annotation (Placement(transformation(extent={{130,60},{150,80}})));
  INFRAX.SubSystems.Controllers.DataBus dataBus
    "Bus containing data from different sensors" annotation (Placement(
        transformation(extent={{-160,20},{-120,60}}), iconTransformation(extent
          ={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[7] gainRad
  "Bus to connect the radiative heat transfer to the zones"
    annotation (Placement(transformation(extent={{130,-80},{150,-60}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[7] gainCon
  "Bus to connect the convective heat transfer to the zones"
    annotation (Placement(transformation(extent={{130,-60},{150,-40}})));
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsAir=Modelica.Fluid.Types.Dynamics.FixedInitial
    "Type of energy balance for air model: dynamic (3 initialization options) or steady state";
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsTABS=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial
    "Type of energy balance for air model: dynamic (3 initialization options) or steady state";

  parameter Real[7] A_Conv = {northZone.A, southZone1.A, southZone2.A, meetingRoom1.A,
  meetingRoom2.A, hall.A, bathroomZone.A} "Convective area of zones";

  parameter Real mSenFac=5
    "Correction factor for thermal capacity of zone air.";
  Modelica.Blocks.Interfaces.RealInput[5] nOcc
  "Number of occupants input" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={90,-100})));

  parameter Modelica.Media.Interfaces.Types.Temperature T_start=293.15
    "Start value of temperature";
  Modelica.Blocks.Math.Gain gain1(k=1/3) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={79,49})));
  Modelica.Blocks.Math.Gain gain2(k=1/3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,-74})));
  Modelica.Blocks.Math.Gain gain3(k=1/3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={84,-50})));
equation
  //North zone connections
  connect(northZone.propsBus[1], northWall.propsBus_a) annotation (Line(
      points={{36,76.225},{22,76.225},{22,89},{82,89}},
      color={255,204,51},
      thickness=0.5));
  connect(northZone.propsBus[2], northWindows.propsBus_a) annotation (Line(
      points={{36,75.875},{22,75.875},{22,89},{102,89}},
      color={255,204,51},
      thickness=0.5));
  connect(northZone.propsBus[3], internalWallNZ[1].propsBus_b) annotation (Line(
      points={{36,75.525},{36,75.525},{36,84},{80,84},{80,72},{85,72}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWallNZ[1].propsBus_a, northZone.propsBus[4]) annotation (Line(
      points={{95,72},{100,72},{100,48},{36,48},{36,75.175}},
      color={255,204,51},
      thickness=0.5));
  connect(northZone.propsBus[5], internalWallNZ[2].propsBus_b) annotation (Line(
      points={{36,74.825},{36,84},{80,84},{80,72},{85,72}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWallNZ[2].propsBus_a, northZone.propsBus[6]) annotation (Line(
      points={{95,72},{100,72},{100,48},{36,48},{36,74.475}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom1.proBusA[1], northZone.propsBus[7]) annotation (Line(
      points={{4,19},{4,74.125},{36,74.125}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom2.proBusA[1], northZone.propsBus[8]) annotation (Line(
      points={{84,19},{84,40},{36,40},{36,73.775}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWallNZSZ2.propsBus_a, northZone.propsBus[9]) annotation (Line(
      points={{32,35},{32,73.425},{36,73.425}},
      color={255,204,51},
      thickness=0.5));
  //Southern landscape office connections
  connect(southZone2.propsBus[1], SZ2Wall[1].propsBus_a) annotation (Line(
      points={{32,-28.1818},{26,-28.1818},{20,-28.1818},{20,-64},{42,-64},{42,
          -69}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone2.propsBus[2], SZ2Wall[2].propsBus_a) annotation (Line(
      points={{32,-28.5455},{30,-28.5455},{30,-28},{20,-28},{20,-64},{42,-64},{
          42,-69}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone2.propsBus[3], SZ2Windows1.propsBus_a) annotation (Line(
      points={{32,-28.9091},{26,-28.9091},{20,-28.9091},{20,-62},{62,-62},{62,
          -69}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone2.propsBus[4], SZ2Windows2.propsBus_a) annotation (Line(
      points={{32,-29.2727},{20,-29.2727},{20,-62},{62,-62},{62,-83}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone2.propsBus[5], internalWallSZ2[1].propsBus_b) annotation (
      Line(
      points={{32,-29.6364},{32,-29.6364},{32,-12},{32,-14},{48,-14},{48,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWallSZ2[1].propsBus_a, southZone2.propsBus[6]) annotation (
      Line(
      points={{48,1},{48,8},{32,8},{32,-30}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone2.propsBus[7], internalWallSZ2[2].propsBus_b) annotation (
      Line(
      points={{32,-30.3636},{32,-14},{48,-14},{48,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWallSZ2[2].propsBus_a, southZone2.propsBus[8]) annotation (
      Line(
      points={{48,1},{48,8},{32,8},{32,-30.7273}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom1.proBusC[1], southZone2.propsBus[9]) annotation (Line(
      points={{16.8,0.2},{16.8,-31.0909},{32,-31.0909}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom1.proBusB[1], southZone2.propsBus[10]) annotation (Line(
      points={{19,16},{32,16},{32,-31.4545}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom2.proBusC[1], southZone2.propsBus[11]) annotation (Line(
      points={{96.8,0.2},{96.8,-14},{32,-14},{32,-31.8182}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom2.proBusD[1], southZone2.propsBus[12]) annotation (Line(
      points={{80.4,3},{32,3},{32,-32.1818}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom2.proBusB[1], southZone2.propsBus[13]) annotation (Line(
      points={{99,16},{106,16},{106,-18},{32,-18},{32,-32.5455}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWallNZSZ2.propsBus_b, southZone2.propsBus[14]) annotation (Line(
      points={{32,25},{32,-32.9091}},
      color={255,204,51},
      thickness=0.5));
  //Extension southern office connections
  connect(SZ1Wall[1].propsBus_a, southZone1.propsBus[1]) annotation (Line(
      points={{-88,-79},{-88,-52.3077},{-58,-52.3077}},
      color={255,204,51},
      thickness=0.5));
  connect(SZ1Wall[2].propsBus_a, southZone1.propsBus[2]) annotation (Line(
      points={{-88,-79},{-88,-52.9231},{-58,-52.9231}},
      color={255,204,51},
      thickness=0.5));
  connect(SZ1Wall[3].propsBus_a, southZone1.propsBus[3]) annotation (Line(
      points={{-88,-79},{-88,-53.5385},{-58,-53.5385}},
      color={255,204,51},
      thickness=0.5));
  connect(SZ1Windows_east.propsBus_a, southZone1.propsBus[4]) annotation (
      Line(
      points={{-68,-79},{-68,-54.1538},{-58,-54.1538}},
      color={255,204,51},
      thickness=0.5));
  connect(SZ1Windows_south.propsBus_a, southZone1.propsBus[5]) annotation (
      Line(
      points={{-68,-91},{-68,-54.7692},{-58,-54.7692}},
      color={255,204,51},
      thickness=0.5));
  connect(SZ1Windows_west.propsBus_a, southZone1.propsBus[6]);
  connect(internalWallhallSZ1.propsBus_b, southZone1.propsBus[7]) annotation (
      Line(
      points={{-80,-17},{-82,-17},{-82,-40},{-82,-56},{-58,-56}},
      color={255,204,51},
      thickness=0.5));
  //Hall zone connections
  connect(hallWalls[1].propsBus_a, hall.propsBus[1]) annotation (Line(
      points={{-101,20},{-54,20},{-54,36.5231}},
      color={255,204,51},
      thickness=0.5));
  connect(hallWalls[2].propsBus_a, hall.propsBus[2]) annotation (Line(
      points={{-101,20},{-54,20},{-54,35.9692}},
      color={255,204,51},
      thickness=0.5));
  connect(hallWindows_west.propsBus_a, hall.propsBus[3]) annotation (Line(
      points={{-101,44},{-54,44},{-54,35.4154}},
      color={255,204,51},
      thickness=0.5));
  connect(hallWindows_north.propsBus_a, hall.propsBus[4]) annotation (Line(
      points={{-87,44},{-54,44},{-54,34.8615}},
      color={255,204,51},
      thickness=0.5));
  connect(internalWallhallSZ1.propsBus_a, hall.propsBus[5]) annotation (Line(
      points={{-80,-7},{-80,-7},{-80,34.3077},{-54,34.3077}},
      color={255,204,51},
      thickness=0.5));
  connect(meetingRoom1.proBusD[1], hall.propsBus[6]) annotation (Line(
      points={{0.4,3},{-2,3},{-2,12},{-4,12},{-4,62},{-54,62},{-54,33.7538}},
      color={255,204,51},
      thickness=0.5));
  connect(bathroomZone.proBusC[1], hall.propsBus[7]) annotation (Line(
      points={{-37.2,72.2},{-46,72.2},{-46,68},{-54,68},{-54,33.2}},
      color={255,204,51},
      thickness=0.5));
  connect(bathroomZone.proBusD[1], hall.propsBus[8]) annotation (Line(
      points={{-53.6,75},{-54,75},{-54,32.6462}},
      color={255,204,51},
      thickness=0.5));
  //Connections to the ceiling
  connect(northZone.propsBus[10], cei[1])  annotation (Line(
      points={{36,73.075},{18,73.075},{18,76},{0,76},{0,117.143}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone1.propsBus[8], cei[2]);
  connect(southZone2.propsBus[15], cei[3]);
  connect(meetingRoom1.proBusCei[1], cei[4]);
  connect(meetingRoom2.proBusCei[1], cei[5]);
  connect(bathroomZone.proBusCei[1], cei[6]);
  connect(hall.propsBus[9], cei[7]);
  connect(hall.propsBus[11], roof1stFlr[1].propsBus_a) annotation (Line(
      points={{-54,30.9846},{-68,30.9846},{-68,71}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone1.propsBus[9], roof1stFlr[2].propsBus_a) annotation (Line(
      points={{-58,-57.2308},{-68,-57.2308},{-68,71}},
      color={255,204,51},
      thickness=0.5));
  //Connections to the stairs
  connect(bathroomZone.proBusB[1], staW[3]) annotation (Line(
      points={{-35,88},{-32,88},{-32,96},{-140,96},{-140,-9.33333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(northZone.propsBus[11], staW_WallB.propsBus_a) annotation (Line(
      points={{36,72.725},{0,72.725},{0,62},{-8,62},{-119,62}},
      color={255,204,51},
      thickness=0.5));
  connect(staW_WallB.propsBus_b, staW[1]) annotation (Line(
      points={{-129,62},{-132,62},{-132,50},{-140,50},{-140,17.3333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(hall.propsBus[10], staW_WallC.propsBus_a) annotation (Line(
      points={{-54,31.5385},{-56,31.5385},{-56,-28},{-56,-33},{-128,-33}},
      color={255,204,51},
      thickness=0.5));
  connect(staW_WallC.propsBus_b, staW[2]);
  connect(northZone.propsBus[12], staE_WallD.propsBus_a) annotation (Line(
      points={{36,72.375},{36,40},{109,40},{109,28}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone2.propsBus[16], staE_WallC.propsBus_a) annotation (Line(
      points={{32,-33.6364},{86,-33.6364},{132,-33.6364},{132,-36},{132,-34},{
          132,-33}},
      color={255,204,51},
      thickness=0.5));
  connect(staE_WallD.propsBus_b, staE[2]) annotation (Line(
      points={{119,28},{128,28},{128,26},{130,26},{130,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(staE_WallC.propsBus_b, staE[1]) annotation (Line(
      points={{132,-23},{132,-14.5},{150,-14.5},{150,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  //Floor connections
  connect(southZone2.propsBus[17], flo[1]);
  connect(hall.propsBus[12], flo[2]);
  connect(meetingRoom1.proBusFlo[1], flo[3]);
  connect(southZone1.propsBus[10], flo[4]);
  connect(southZone2.propsBus[18], flo[5]);
  connect(meetingRoom2.proBusFlo[1], flo[6]);
  connect(northZone.propsBus[16], flo[7]);
  connect(southZone2.propsBus[19], flo[8]);
  connect(northZone.propsBus[13], flo[9]);
  connect(southZone2.propsBus[20], flo[10]);
  connect(northZone.propsBus[14], flo[11]);
  connect(southZone1.propsBus[11], flo[12]);
  connect(southZone2.propsBus[21], flo[13]);
  connect(northZone.propsBus[15], flo[14]);
  connect(meetingRoom1.proBusExt[1], flo[15]);
  connect(bathroomZone.proBusFlo[1], flo[16]);
  //Hollow glass wall connections
  connect(hall.propsBus[13], glassWall[1].propsBus_a) annotation (Line(
      points={{-54,29.8769},{-56,29.8769},{-56,-40},{-56,-44},{-120,-44},{-120,
          -65}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone2.propsBus[22], glassWall[2].propsBus_a) annotation (Line(
      points={{32,-35.8182},{8,-35.8182},{8,-42},{-118,-42},{-118,-65},{-120,
          -65}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone1.propsBus[12], glassWall[3].propsBus_a) annotation (Line(
      points={{-58,-59.0769},{-90,-59.0769},{-120,-59.0769},{-120,-65}},
      color={255,204,51},
      thickness=0.5));
  connect(southZone1.propsBus[13], glassWall[4].propsBus_a) annotation (Line(
      points={{-58,-59.6923},{-90,-59.6923},{-90,-58},{-120,-58},{-120,-65}},
      color={255,204,51},
      thickness=0.5));
  connect(glassWall.propsBus_b, glasswall) annotation (Line(
      points={{-120,-75},{-120,-100}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(roof1stFlr.port_emb[1], port_emb) annotation (Line(points={{-80,76},{
          -80,100},{140,100},{140,70}}, color={191,0,0}));
  //NOTE: Hall does not have TABS
  //Data bus connections
  connect(northZone.TSensor, dataBus.T1stFlr_NZ) annotation (Line(
      points={{65.4,70.8},{-35.58,70.8},{-35.58,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone1.TSensor, dataBus.T1stFlr_SZ1) annotation (Line(
      points={{-18.1,-60},{-78,-60},{-78,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(southZone2.TSensor, dataBus.T1stFlr_SZ2) annotation (Line(
      points={{71.9,-36},{-35.43,-36},{-35.43,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(meetingRoom1.TSensor, dataBus.T1stFlr_MT1) annotation (Line(
      points={{21,12},{-61.7,12},{-61.7,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(meetingRoom2.TSensor, dataBus.T1stFlr_MT2) annotation (Line(
      points={{101,12},{-16,12},{-16,40.1},{-139.9,40.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  //Radiative and convective connections
  connect(northZone.gainCon, gainCon[1]);
  connect(northZone.gainRad, gainRad[1]);
  connect(southZone1.gainCon, gainCon[2]);
  connect(southZone1.gainRad, gainRad[2]);
  connect(southZone2.gainCon, gainCon[3]);
  connect(southZone2.gainRad, gainRad[3]);
  connect(meetingRoom1.gainCon, gainCon[4]);
  connect(meetingRoom1.gainRad, gainRad[4]);
  connect(meetingRoom2.gainCon, gainCon[5]);
  connect(meetingRoom2.gainRad, gainRad[5]);
  connect(hall.gainCon, gainCon[6]);
  connect(hall.gainRad, gainRad[6]);
  connect(bathroomZone.gainCon, gainCon[7]);
  connect(bathroomZone.gainRad, gainRad[7]);
  //Occupancy connections
  connect(meetingRoom1.yOcc, nOcc[4]) annotation (Line(points={{22,14},{22,-18},
          {90,-18},{90,-92}},           color={0,0,127}));
  connect(meetingRoom2.yOcc, nOcc[5]) annotation (Line(points={{102,14},{102,-52},
          {90,-52},{90,-84}},            color={0,0,127}));
  connect(gain1.y, northZone.yOcc) annotation (Line(points={{79,54.5},{79,73.6},
          {66.8,73.6}}, color={0,0,127}));
  connect(gain1.u, nOcc[1]) annotation (Line(points={{79,43},{79,-10},{90,-10},
          {90,-116}}, color={0,0,127}));
  connect(southZone1.yOcc, gain2.y) annotation (Line(points={{-16.2,-56},{-8,
          -56},{-8,-67.4},{0,-67.4}}, color={0,0,127}));
  connect(gain2.u, nOcc[2]) annotation (Line(points={{-4.44089e-16,-81.2},{
          -4.44089e-16,-108},{90,-108}}, color={0,0,127}));
  connect(gain3.y, southZone2.yOcc) annotation (Line(points={{84,-43.4},{84,-32},
          {73.8,-32}}, color={0,0,127}));
  connect(gain3.u, nOcc[3]) annotation (Line(points={{84,-57.2},{84,-100},{90,
          -100}}, color={0,0,127}));
annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
            {140,100}}), graphics={
          Rectangle(extent={{-140,100},{140,-100}},
                                                lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-70,70},{70,-70}},
          lineColor={28,108,200},
          textString="1")}),                                   Diagram(
      coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})));
end Floor1_noVent;
