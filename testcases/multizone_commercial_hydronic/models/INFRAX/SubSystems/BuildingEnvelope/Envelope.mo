within INFRAX.SubSystems.BuildingEnvelope;
model Envelope "Envelope of INFRAX"

  replaceable package Medium = IDEAS.Media.Air(extraPropertiesNames={"CO2"}) constrainedby
    Modelica.Media.Interfaces.PartialMedium;
  outer IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Floor,
        0},{IDEAS.Types.Tilt.Ceiling,0},{IDEAS.Types.Tilt.Wall,0},{IDEAS.Types.Tilt.Wall,
        INFRAX.Data.Orientations.E},{IDEAS.Types.Tilt.Wall,INFRAX.Data.Orientations.W},
        {IDEAS.Types.Tilt.Wall,INFRAX.Data.Orientations.N}})
  "Data reader, includes all the orientations in the building"
    annotation (Placement(transformation(extent={{-140,80},{-120,100}})));

  INFRAX.Data.Parameters.Structure structure
  "Record with general data from the building"
    annotation (Placement(transformation(extent={{120,-100},{140,-80}})));
  INFRAX.Data.Parameters.Str3rdFlr str3rdFlr
  "Record with 3rd floor data"
    annotation (Placement(transformation(extent={{120,-60},{140,-40}})));
  INFRAX.Data.Parameters.Str2ndFlr str2ndFlr
  "Record with 2nd floor data"
    annotation (Placement(transformation(extent={{120,-80},{140,-60}})));
  INFRAX.Data.Parameters.Str1stFlr str1stFlr
  "Record with 1st floor data"
    annotation (Placement(transformation(extent={{98,-80},{118,-60}})));
  INFRAX.Data.Parameters.StrGndFlr strGndFlr
  "Record with ground floor data"
    annotation (Placement(transformation(extent={{98,-100},{118,-80}})));
  IDEAS.Buildings.Components.Zone westStairs(
    nSurf=17,
    V=structure.Vol_westStair,
    hZone=structure.h,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.InterzonalAirFlow.n50FixedPressure
      interzonalAirFlow,
    redeclare IDEAS.Buildings.Components.RoomType.Generic rooTyp,
    redeclare IDEAS.Buildings.Components.LightingControl.OccupancyBased ligCtr,
    redeclare IDEAS.Buildings.Components.LightingType.Fluorescent ligTyp)
  "Western stairs block"
    annotation (Placement(transformation(extent={{-80,34},{-60,54}})));

  IDEAS.Buildings.Components.OuterWall westStairs_OW(
    azi=INFRAX.Data.Orientations.N,
    inc=IDEAS.Types.Tilt.Wall,
    redeclare INFRAX.Data.Constructions.OuterWalls constructionType,
    A=structure.h*4.85 - structure.AWindows_westStair,
    T_start=T_start)
   "North wall of western stairs"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-70,88})));
  IDEAS.Buildings.Components.Window windowStaW(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    frac=1 - structure.GlazingD/structure.WindowD,
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    A=structure.AWindows_westStair,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start)
   "Windows from western stairs"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-90,88})));
  IDEAS.Buildings.Components.Zone eastStairs(
    nSurf=14,
    V=structure.Vol_eastStair,
    hZone=structure.h,
    n50=1.3,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start,
    redeclare IDEAS.Buildings.Components.InterzonalAirFlow.n50FixedPressure
      interzonalAirFlow,
    redeclare IDEAS.Buildings.Components.RoomType.Generic rooTyp,
    redeclare IDEAS.Buildings.Components.LightingControl.OccupancyBased ligCtr,
    redeclare IDEAS.Buildings.Components.LightingType.Fluorescent ligTyp)
    "Eastern stairs block"
   annotation (Placement(transformation(extent={{60,34},{80,54}})));

  IDEAS.Buildings.Components.OuterWall[2] eastStairs_OW(
    each inc=IDEAS.Types.Tilt.Wall,
    azi={INFRAX.Data.Orientations.N,INFRAX.Data.Orientations.E},
    redeclare INFRAX.Data.Constructions.OuterWalls constructionType,
    A=structure.h*{2.55,5} - {structure.AWindows_eastStair,0},
    T_start=T_start)
   "Array of outer walls for eastern stairs"
   annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={90,88})));
  IDEAS.Buildings.Components.Window windowStaE(
    inc=IDEAS.Types.Tilt.Wall,
    azi=INFRAX.Data.Orientations.N,
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    redeclare INFRAX.Data.Frames.INFRAXWood fraType,
    A=structure.AWindows_eastStair,
    redeclare INFRAX.Data.Glazing.SGGCLIMAPLUSONE4dash15dash6 glazing,
    T_start=T_start)
  "Windows from eastern stairs"
   annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={70,88})));
  replaceable INFRAX.SubSystems.BuildingEnvelope.Floor3.Floor3 floor3(energyDynamicsAir=energyDynamicsAir, redeclare
      package
      Medium = Medium,
    mSenFac=mSenFac,
    allowFlowReversal=allowFlowReversal,
    T_start=T_start)
  "Third floor component"
    annotation (Placement(transformation(extent={{-12,50},{16,70}})));
  replaceable INFRAX.SubSystems.BuildingEnvelope.Floor2.Floor2 floor2(energyDynamicsAir=energyDynamicsAir, redeclare
      package
      Medium = Medium,
    mSenFac=mSenFac,
    allowFlowReversal=allowFlowReversal,
    T_start=T_start)
  "Second floor component"
    annotation (Placement(transformation(extent={{-12,8},{16,28}})));
 replaceable INFRAX.SubSystems.BuildingEnvelope.Floor1.Floor1 floor1(energyDynamicsAir=energyDynamicsAir, redeclare
      package
      Medium = Medium,
    mSenFac=mSenFac,
    allowFlowReversal=allowFlowReversal,
    T_start=T_start)
  "First floor component"
    annotation (Placement(transformation(extent={{-12,-38},{16,-18}})));
  replaceable INFRAX.SubSystems.BuildingEnvelope.Floor0.Floor0 floor0(energyDynamicsAir=energyDynamicsAir, redeclare
      package
      Medium = Medium,
    mSenFac=mSenFac,
    allowFlowReversal=allowFlowReversal,
    T_start=T_start)
  "Ground floor component"
    annotation (Placement(transformation(extent={{-12,-74},{16,-54}})));
  IDEAS.Buildings.Components.InternalWall[8] floor_0_garage(
    redeclare INFRAX.Data.Constructions.Floor constructionType,
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=strGndFlr.Areas_GndFlr,
    T_start=T_start)
  "Floor wall between ground floor and garage/parking"
   annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-84})));
  IDEAS.Buildings.Components.Zone basement(
    V=structure.HeightFlr*structure.A_Grg,
    hZone=structure.HeightFlr,
    nSurf=14,
    n50=1.3,
    redeclare replaceable IDEAS.Buildings.Components.InterzonalAirFlow.n50FixedPressure
    interzonalAirFlow,
    redeclare package Medium = Medium,
    mSenFac=mSenFac,
    T_start=T_start)
  "Parking/garage of INFRAX"
    annotation (Placement(transformation(extent={{-40,-92},{-20,-72}})));
  IDEAS.Buildings.Components.SlabOnGround slabOnGround(redeclare
      INFRAX.Data.Constructions.Slab constructionType,
      A=structure.A_Grg,
      T_start=T_start)
    "Concrete slab on the ground of the infrastructure"
    annotation (Placement(transformation(extent={{-60,-98},{-48,-78}})));
  IDEAS.Buildings.Components.BoundaryWall boundaryWall(
    inc=IDEAS.Types.Tilt.Wall,
    azi=0,
    use_T_in=true,
    redeclare INFRAX.Data.Constructions.GarageWall constructionType,
    A=structure.AWall_Grg_Soil,
    T_start=T_start)
    "Wall of the parking/garage in contact with the soil"
    annotation (Placement(transformation(extent={{-58,-70},{-46,-50}})));
  Modelica.Blocks.Sources.Constant soiltemp(k=273.15 + 10.8)
  "Constant temperature of soil for the boundary wall in contact with the garage"
   annotation (Placement(transformation(extent={{-100,-68},{-86,-54}})));
  IDEAS.Buildings.Components.InternalWall eastStairs_garage(
    redeclare INFRAX.Data.Constructions.Floor constructionType,
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_eastStair,
    T_start=T_start)
  "Floor wall between garage and eastern stairs"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={94,22})));
  IDEAS.Buildings.Components.InternalWall westStairs_garage(
    redeclare INFRAX.Data.Constructions.Floor constructionType,
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_westStair,
    T_start=T_start)
  "Floor wall between garage and western stairs"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={-102,26})));
  IDEAS.Buildings.Components.OuterWall roof_westStairs(
    redeclare INFRAX.Data.Constructions.Roof constructionType,
    inc=IDEAS.Types.Tilt.Ceiling,
    azi=0,
    A=structure.A_westStair,
    T_start=T_start)
  "Roof of western stairs"
   annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={-106,64})));
  IDEAS.Buildings.Components.OuterWall roof_eastStairs(
    redeclare INFRAX.Data.Constructions.Roof constructionType,
    inc=IDEAS.Types.Tilt.Ceiling,
    azi=0,
    A=structure.A_eastStair,
    T_start=T_start)
  "Roof of east stairs"
   annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={100,60})));
  IDEAS.Buildings.Components.InternalWall Floor_0_2(
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_hall_2SZ,
    T_start=T_start)
  "Floor between ground floor and second floor (glass hollow)"
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={-34,-16})));
  IDEAS.Buildings.Components.Window[2] brandkoepels(
    redeclare IDEAS.Buildings.Components.Shading.None shaType,
    inc=IDEAS.Types.Tilt.Ceiling,
    azi=0,
    frac=0,
    A=structure.A_stairs_koepel,
    redeclare IDEAS.Buildings.Data.Frames.None fraType,
    T_start=T_start,
    redeclare IDEAS.Examples.TwinHouses.BaseClasses.Data.Materials.Glazing
      glazing) "domes from stairs (cupulas)" annotation (Placement(
        transformation(
        extent={{-6,-10},{6,10}},
        rotation=-90,
        origin={0,88})));
  IDEAS.Buildings.Components.OuterWall[2] Grg_OuterWalls(
    redeclare INFRAX.Data.Constructions.GarageWallWithIns constructionType,
    inc={IDEAS.Types.Tilt.Wall,IDEAS.Types.Tilt.Ceiling},
    azi={INFRAX.Data.Orientations.W,0},
    A={structure.AWall_Grg_Out,structure.A_Grg_OutRoof},
    T_start=T_start)
    "Garage outer walls, on west and roof side"
    annotation (Placement(transformation(extent={{-90,-96},{-78,-76}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[35] cca
  "Embedded heat port for CCA"
    annotation (Placement(transformation(extent={{130,-10},{150,10}})));
  INFRAX.SubSystems.Controllers.DataBus dataBus
    "Data bus containing information of sensors" annotation (Placement(
        transformation(extent={{-160,-20},{-120,20}}), iconTransformation(
          extent={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[27] conv
  "Heat port for convective heat transfer"
    annotation (Placement(transformation(extent={{130,-50},{150,-30}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[27] rad
  "Heat port for radiative heat transfer"
    annotation (Placement(transformation(extent={{130,-90},{150,-70}})));
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsTABS=Modelica.Fluid.Types.Dynamics.FixedInitial
    "Type of energy balance for air model: dynamic (3 initialization options) or steady state";
  parameter Modelica.Fluid.Types.Dynamics energyDynamicsAir=Modelica.Fluid.Types.Dynamics.FixedInitial
    "Type of energy balance for air model: dynamic (3 initialization options) or steady state";
  parameter Boolean allowFlowReversal = true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal"
    annotation(Dialog(tab="Assumptions"), Evaluate=true);
  parameter Modelica.SIunits.Area[15] ATabs0 = {Floor_0_1_1.A, Floor_0_1_2.A,
  Floor_0_1_3.A, Floor_0_1_4.A, Floor_0_1_5.A, Floor_0_1_6.A, Floor_0_1_7.A,
  Floor_0_1_8.A, Floor_0_1_9.A, Floor_0_1_10.A, Floor_0_1_11.A, Floor_0_1_12.A,
  Floor_0_1_13.A, Floor_0_1_14.A, Floor_0_1_15.A}
  "TABS areas for ground floor";
  parameter Modelica.SIunits.Area[4] ATabs3 = floor3.ATabs;
  parameter Modelica.SIunits.Area[7] ATabs2 = {Floor_2_3_1.A, Floor_2_3_2.A,
  Floor_2_3_3.A, Floor_2_3_4.A, Floor_2_3_6.A, Floor_2_3_7.A, Floor_2_3_8.A}
  "TABS areas for second floor";
  parameter Modelica.SIunits.Area[9] ATabs1 = {Floor_1_2_1.A, Floor_1_2_2.A,
  Floor_1_2_3.A, Floor_1_2_4.A, Floor_1_2_5.A, Floor_1_2_7.A, Floor_0_2.A,
  floor1.roof1stFlr[1].A,floor1.roof1stFlr[2].A}
  "TABS areas for first floor";
  Modelica.Fluid.Interfaces.FluidPort_b[21] airOutlet(
     each m_flow(max=if allowFlowReversal then Modelica.Constants.inf else 0),
     redeclare package Medium = Medium)
  "Air outlet port of all the zones"
    annotation (Placement(transformation(extent={{130,30},{150,50}})));
  Modelica.Fluid.Interfaces.FluidPort_a[21] airInlet(
     each m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0),
     redeclare package Medium = Medium)
  "Air inlet port of all the zones"
    annotation (Placement(transformation(extent={{130,70},{150,90}})));
//Floor walls between different floors, they had to be split and not in an
//array due to MPC compilation problems with JModelica
  IDEAS.Buildings.Components.InternalWall Floor_2_3_1(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[1],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)        annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
  IDEAS.Buildings.Components.InternalWall Floor_2_3_2(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[2],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)         annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
  IDEAS.Buildings.Components.InternalWall Floor_2_3_3(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[3],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)         annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
  IDEAS.Buildings.Components.InternalWall Floor_2_3_4(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[4],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)         annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
  IDEAS.Buildings.Components.InternalWall Floor_2_3_5(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[5],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)         annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
  IDEAS.Buildings.Components.InternalWall Floor_2_3_6(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[6],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)         annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
  IDEAS.Buildings.Components.InternalWall Floor_2_3_7(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[7],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)         annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
  IDEAS.Buildings.Components.InternalWall Floor_2_3_8(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_2Flr_3Flr[8],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)         annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,38})));
      IDEAS.Buildings.Components.InternalWall Floor_0_1_1(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[1],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_2(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[2],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_3(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[3],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_4(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[4],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_5(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[5],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_6(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[6],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_7(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[7],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_8(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[8],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_9(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[9],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_10(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[10],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_11(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[11],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_12(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[12],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_13(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[13],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_14(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[14],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_0_1_15(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[15],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
   IDEAS.Buildings.Components.InternalWall Floor_0_1_16(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    A=structure.A_GndFlr_1stFlr[16],
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-46})));
  IDEAS.Buildings.Components.InternalWall Floor_1_2_1(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_1Flr_2Flr[1],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-4})));
  IDEAS.Buildings.Components.InternalWall Floor_1_2_2(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_1Flr_2Flr[2],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-4})));
  IDEAS.Buildings.Components.InternalWall Floor_1_2_3(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_1Flr_2Flr[3],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-4})));
  IDEAS.Buildings.Components.InternalWall Floor_1_2_4(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_1Flr_2Flr[4],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-4})));
  IDEAS.Buildings.Components.InternalWall Floor_1_2_5(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_1Flr_2Flr[5],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-4})));
  IDEAS.Buildings.Components.InternalWall Floor_1_2_6(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_1Flr_2Flr[6],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-4})));
  IDEAS.Buildings.Components.InternalWall Floor_1_2_7(
    inc=IDEAS.Types.Tilt.Floor,
    azi=0,
    A=structure.A_1Flr_2Flr[7],
    redeclare INFRAX.Data.Constructions.InnerFloor constructionType,
    energyDynamics=energyDynamicsTABS,
    T_start=T_start)
    annotation (Placement(transformation(
        extent={{-6,-10},{6,10}},
        rotation=90,
        origin={4,-4})));
  parameter Real mSenFac=5
    "Correction factor for thermal capacity of zone air.";
  replaceable IDEAS.Fluid.Movers.FlowControlled_dp   toiletExtract(
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    addPowerToMedium=false,
    use_inputFilter=false,
    allowFlowReversal=false,
    tau=60,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    dp_start=180,
    m_flow_nominal=1150*1.225/3600,
    dp_nominal(displayUnit="Pa") = 225,
    redeclare package Medium = Medium,
    constantHead=225,
    inputType=IDEAS.Fluid.Types.InputType.Continuous)
  "Extraction fan unit for the toilets"
    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-92,-28})));
  IDEAS.Fluid.Sources.Boundary_pT bouAmb(nPorts=1, redeclare package Medium =
        Medium)
  "Boundary with ambient air conditions"
    annotation (Placement(transformation(extent={{-138,-36},{-122,-20}})));
  Modelica.Blocks.Interfaces.RealInput[27] nOcc
  "Occupant number input for different zones"
    annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={80,-100})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=293.15
    "Start value of temperature";
  Modelica.Blocks.Interfaces.RealInput dp_toilet
   "Input pressure drop signal for the extracting fan unit of toilets"
    annotation (Placement(transformation(extent={{-180,-100},{-140,-60}})));
equation
//Stairs connections
    //Connection to outer walls and windows
  connect(westStairs.propsBus[1],westStairs_OW. propsBus_a) annotation (Line(
      points={{-80,49.8824},{-84,49.8824},{-84,70},{-68,70},{-68,83}},
      color={255,204,51},
      thickness=0.5));
  connect(westStairs.propsBus[2], windowStaW.propsBus_a) annotation (Line(
      points={{-80,49.6471},{-84,49.6471},{-84,70},{-88,70},{-88,83}},
      color={255,204,51},
      thickness=0.5));
  connect(eastStairs.propsBus[1], eastStairs_OW[1].propsBus_a) annotation (Line(
      points={{60,49.8571},{60,49.8571},{60,74},{92,74},{92,83}},
      color={255,204,51},
      thickness=0.5));
  connect(eastStairs.propsBus[2], eastStairs_OW[2].propsBus_a) annotation (Line(
      points={{60,49.5714},{60,49.5714},{60,74},{92,74},{92,83}},
      color={255,204,51},
      thickness=0.5));
  connect(eastStairs.propsBus[3], windowStaE.propsBus_a) annotation (Line(
      points={{60,49.2857},{60,49.2857},{60,83},{72,83}},
      color={255,204,51},
      thickness=0.5));
    //Connection to floors
        //Floor 3
  connect(floor3.staW[1], westStairs.propsBus[3]) annotation (Line(
      points={{-12,61.7333},{-46,61.7333},{-46,62},{-80,62},{-80,49.4118}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.staW[2], westStairs.propsBus[4]);
  connect(floor3.staW[3], westStairs.propsBus[5]);
  connect(floor3.staE[1], eastStairs.propsBus[4]) annotation (Line(
      points={{17,60},{38,60},{38,49},{60,49}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.staE[2], eastStairs.propsBus[5]);
        //Floor 2
  connect(floor2.staW[1], westStairs.propsBus[6]) annotation (Line(
      points={{-12,19.7333},{-24,19.7333},{-24,20},{-40,20},{-80,20},{-80,
          48.7059}},
      color={255,204,51},
      thickness=0.5));
  connect(floor2.staW[2], westStairs.propsBus[7]);
  connect(floor2.staW[3], westStairs.propsBus[8]);
  connect(floor2.staE[1], eastStairs.propsBus[6]) annotation (Line(
      points={{17,18},{22,18},{30,18},{30,48.4286},{60,48.4286}},
      color={255,204,51},
      thickness=0.5));
  connect(floor2.staE[2], eastStairs.propsBus[7]);
        //Floor 1
  connect(floor1.staW[1], westStairs.propsBus[9]) annotation (Line(
      points={{-12,-26.2667},{-46,-26.2667},{-46,-26},{-80,-26},{-80,48}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.staW[2], westStairs.propsBus[10]);
  connect(floor1.staW[3], westStairs.propsBus[11]);
  connect(floor1.staE[1], eastStairs.propsBus[8]) annotation (Line(
      points={{17,-28},{17,-28},{60,-28},{60,47.8571}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.staE[2], eastStairs.propsBus[9]);
         //Floor 0
  connect(floor0.staW[1], westStairs.propsBus[12]) annotation (Line(
      points={{-12,-62.2667},{-12,-40.8},{-80,-40.8},{-80,47.2941}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.staW[2], westStairs.propsBus[13]);
  connect(floor0.staW[3], westStairs.propsBus[14]);
  connect(floor0.staE[1], eastStairs.propsBus[10]) annotation (Line(
      points={{17,-64},{17,-62},{60,-62},{60,47.2857}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.staE[2], eastStairs.propsBus[11]);
  //Roofs and floors of different stages
  //Floor 3 to 2
  connect(floor3.flo[1], Floor_2_3_1.propsBus_a) annotation (Line(
      points={{2,48.25},{2,48.25},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_1.propsBus_b, floor2.cei[1]) annotation (Line(
      points={{2,33},{2,29.75}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.flo[2], Floor_2_3_2.propsBus_a) annotation (Line(
      points={{2,48.75},{2,48.75},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_2.propsBus_b, floor2.cei[2]) annotation (Line(
      points={{2,33},{2,29.25}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.flo[3], Floor_2_3_3.propsBus_a) annotation (Line(
      points={{2,49.25},{2,49.25},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_3.propsBus_b, floor2.cei[3]) annotation (Line(
      points={{2,33},{2,28.75}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.flo[4], Floor_2_3_4.propsBus_a) annotation (Line(
      points={{2,49.75},{2,49.75},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_4.propsBus_b, floor2.cei[4]) annotation (Line(
      points={{2,33},{2,28.25}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.flo[5], Floor_2_3_5.propsBus_a) annotation (Line(
      points={{2,50.25},{2,50.25},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_5.propsBus_b, floor2.cei[5]) annotation (Line(
      points={{2,33},{2,27.75}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.flo[6], Floor_2_3_6.propsBus_a) annotation (Line(
      points={{2,50.75},{2,50.75},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_6.propsBus_b, floor2.cei[6]) annotation (Line(
      points={{2,33},{2,27.25}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.flo[7], Floor_2_3_7.propsBus_a) annotation (Line(
      points={{2,51.25},{2,51.25},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_7.propsBus_b, floor2.cei[7]) annotation (Line(
      points={{2,33},{2,26.75}},
      color={255,204,51},
      thickness=0.5));
  connect(floor3.flo[8], Floor_2_3_8.propsBus_a) annotation (Line(
      points={{2,51.75},{2,51.75},{2,43}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_2_3_8.propsBus_b, floor2.cei[8]) annotation (Line(
      points={{2,33},{2,26.25}},
      color={255,204,51},
      thickness=0.5));
  //Floor 2 to 1
  connect(floor1.cei[1], Floor_1_2_1.propsBus_b) annotation (Line(
      points={{2,-16.2857},{2,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_1_2_1.propsBus_a, floor2.flo[1]) annotation (Line(
      points={{2,1},{2,6.28571}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.cei[2], Floor_1_2_2.propsBus_b) annotation (Line(
      points={{2,-16.8571},{2,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_1_2_2.propsBus_a, floor2.flo[2]) annotation (Line(
      points={{2,1},{2,6.85714}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.cei[3], Floor_1_2_3.propsBus_b) annotation (Line(
      points={{2,-17.4286},{2,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_1_2_3.propsBus_a, floor2.flo[3]) annotation (Line(
      points={{2,1},{2,7.42857}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.cei[4], Floor_1_2_4.propsBus_b) annotation (Line(
      points={{2,-18},{2,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_1_2_4.propsBus_a, floor2.flo[4]) annotation (Line(
      points={{2,1},{2,4.5},{2,8}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.cei[5], Floor_1_2_5.propsBus_b) annotation (Line(
      points={{2,-18.5714},{2,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_1_2_5.propsBus_a, floor2.flo[5]) annotation (Line(
      points={{2,1},{2,8.57143}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.cei[6], Floor_1_2_6.propsBus_b) annotation (Line(
      points={{2,-19.1429},{2,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_1_2_6.propsBus_a, floor2.flo[6]) annotation (Line(
      points={{2,1},{2,9.14286}},
      color={255,204,51},
      thickness=0.5));
  connect(floor1.cei[7], Floor_1_2_7.propsBus_b) annotation (Line(
      points={{2,-19.7143},{2,-9}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_1_2_7.propsBus_a, floor2.flo[7]) annotation (Line(
      points={{2,1},{2,9.71429}},
      color={255,204,51},
      thickness=0.5));
  //Floor 1 to 0
  connect(floor0.cei[1], Floor_0_1_1.propsBus_b) annotation (Line(
      points={{2,-52.125},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_1.propsBus_a, floor1.flo[1]) annotation (Line(
      points={{2,-41},{2,-39.875}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[2], Floor_0_1_2.propsBus_b) annotation (Line(
      points={{2,-52.375},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_2.propsBus_a, floor1.flo[2]) annotation (Line(
      points={{2,-41},{2,-39.625}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[3], Floor_0_1_3.propsBus_b) annotation (Line(
      points={{2,-52.625},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_3.propsBus_a, floor1.flo[3]) annotation (Line(
      points={{2,-41},{2,-39.375}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[4], Floor_0_1_4.propsBus_b) annotation (Line(
      points={{2,-52.875},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_4.propsBus_a, floor1.flo[4]) annotation (Line(
      points={{2,-41},{2,-39.125}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[5], Floor_0_1_5.propsBus_b) annotation (Line(
      points={{2,-53.125},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_5.propsBus_a, floor1.flo[5]) annotation (Line(
      points={{2,-41},{2,-38.875}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[6], Floor_0_1_6.propsBus_b) annotation (Line(
      points={{2,-53.375},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_6.propsBus_a, floor1.flo[6]) annotation (Line(
      points={{2,-41},{2,-38.625}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[7], Floor_0_1_7.propsBus_b) annotation (Line(
      points={{2,-53.625},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_7.propsBus_a, floor1.flo[7]) annotation (Line(
      points={{2,-41},{2,-38.375}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[8], Floor_0_1_8.propsBus_b) annotation (Line(
      points={{2,-53.875},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_8.propsBus_a, floor1.flo[8]) annotation (Line(
      points={{2,-41},{2,-38.125}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[9], Floor_0_1_9.propsBus_b) annotation (Line(
      points={{2,-54.125},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_9.propsBus_a, floor1.flo[9]) annotation (Line(
      points={{2,-41},{2,-37.875}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[10], Floor_0_1_10.propsBus_b) annotation (Line(
      points={{2,-54.375},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_10.propsBus_a, floor1.flo[10]) annotation (Line(
      points={{2,-41},{2,-37.625}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[11], Floor_0_1_11.propsBus_b) annotation (Line(
      points={{2,-54.625},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_11.propsBus_a, floor1.flo[11]) annotation (Line(
      points={{2,-41},{2,-37.375}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[12], Floor_0_1_12.propsBus_b) annotation (Line(
      points={{2,-54.875},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_12.propsBus_a, floor1.flo[12]) annotation (Line(
      points={{2,-41},{2,-37.125}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[13], Floor_0_1_13.propsBus_b) annotation (Line(
      points={{2,-55.125},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_13.propsBus_a, floor1.flo[13]) annotation (Line(
      points={{2,-41},{2,-36.875}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[14], Floor_0_1_14.propsBus_b) annotation (Line(
      points={{2,-55.375},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_14.propsBus_a, floor1.flo[14]) annotation (Line(
      points={{2,-41},{2,-36.625}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[15], Floor_0_1_15.propsBus_b) annotation (Line(
      points={{2,-55.625},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_15.propsBus_a, floor1.flo[15]) annotation (Line(
      points={{2,-41},{2,-36.375}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.cei[16], Floor_0_1_16.propsBus_b) annotation (Line(
      points={{2,-55.875},{2,-51}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_1_16.propsBus_a, floor1.flo[16]) annotation (Line(
      points={{2,-41},{2,-36.125}},
      color={255,204,51},
      thickness=0.5));
  //Floor 0 to -1 (garage)
  connect(floor_0_garage.propsBus_a, floor0.flo) annotation (Line(
      points={{2,-79},{2,-74}},
      color={255,204,51},
      thickness=0.5));
  connect(floor_0_garage[1].propsBus_b, basement.propsBus[1]) annotation (Line(
      points={{2,-89},{2,-89},{2,-96},{-40,-96},{-40,-76.1429}},
      color={255,204,51},
      thickness=0.5));
  connect(basement.propsBus[2], floor_0_garage[2].propsBus_b);
  connect(basement.propsBus[3], floor_0_garage[3].propsBus_b);
  connect(basement.propsBus[4], floor_0_garage[4].propsBus_b);
  connect(basement.propsBus[5], floor_0_garage[5].propsBus_b);
  connect(basement.propsBus[6], floor_0_garage[6].propsBus_b);
  connect(basement.propsBus[7], floor_0_garage[7].propsBus_b);
  connect(basement.propsBus[8], floor_0_garage[8].propsBus_b);
  //Floor and walls of garage
  connect(basement.propsBus[9], slabOnGround.propsBus_a) annotation (Line(
      points={{-40,-78.4286},{-44,-78.4286},{-44,-86},{-49,-86}},
      color={255,204,51},
      thickness=0.5));
  connect(basement.propsBus[10], boundaryWall.propsBus_a) annotation (Line(
      points={{-40,-78.7143},{-40,-58},{-47,-58}},
      color={255,204,51},
      thickness=0.5));
  connect(boundaryWall.T, soiltemp.y) annotation (Line(points={{-63,-58},{-68,
          -58},{-68,-61},{-85.3,-61}},
                             color={0,0,127}));
  connect(westStairs.propsBus[15], roof_westStairs.propsBus_a) annotation (Line(
      points={{-80,46.5882},{-92,46.5882},{-104,46.5882},{-104,59}},
      color={255,204,51},
      thickness=0.5));
  connect(westStairs.propsBus[16], westStairs_garage.propsBus_a) annotation (
      Line(
      points={{-80,46.3529},{-104,46.3529},{-104,31}},
      color={255,204,51},
      thickness=0.5));
  connect(eastStairs.propsBus[12], roof_eastStairs.propsBus_a) annotation (Line(
      points={{60,46.7143},{60,55},{102,55}},
      color={255,204,51},
      thickness=0.5));
  connect(eastStairs.propsBus[13], eastStairs_garage.propsBus_a) annotation (
      Line(
      points={{60,46.4286},{60,46.4286},{60,24},{60,27},{92,27}},
      color={255,204,51},
      thickness=0.5));
  connect(westStairs_garage.propsBus_b, basement.propsBus[11]) annotation (Line(
      points={{-104,21},{-104,-46},{-40,-46},{-40,-79}},
      color={255,204,51},
      thickness=0.5));
  connect(eastStairs_garage.propsBus_b, basement.propsBus[12]) annotation (Line(
      points={{92,17},{60,17},{60,20},{60,-96},{-40,-96},{-40,-79.2857}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.sndcei, Floor_0_2.propsBus_b) annotation (Line(
      points={{-4,-54},{-4,-54},{-36,-54},{-36,-21}},
      color={255,204,51},
      thickness=0.5));
  connect(Floor_0_2.propsBus_a, floor2.gflo) annotation (Line(
      points={{-36,-11},{-36,8},{-2,8}},
      color={255,204,51},
      thickness=0.5));
  connect(floor0.glasswall, floor1.glasswall) annotation (Line(
      points={{-8,-54},{-10,-54},{-10,-38}},
      color={255,204,51},
      thickness=0.5));
  connect(brandkoepels[1].propsBus_a, westStairs.propsBus[17]) annotation (
      Line(
      points={{2,83},{2,76},{-54,76},{-54,62},{-80,62},{-80,46.1176}},
      color={255,204,51},
      thickness=0.5));
  connect(brandkoepels[2].propsBus_a, eastStairs.propsBus[14]) annotation (
      Line(
      points={{2,83},{2,76},{60,76},{60,46.1429}},
      color={255,204,51},
      thickness=0.5));
  connect(Grg_OuterWalls[1].propsBus_a, basement.propsBus[13]) annotation (
      Line(
      points={{-79,-84},{-76,-84},{-76,-76},{-40,-76},{-40,-79.5714}},
      color={255,204,51},
      thickness=0.5));
  connect(Grg_OuterWalls[2].propsBus_a, basement.propsBus[14]) annotation (
      Line(
      points={{-79,-84},{-76,-84},{-76,-76},{-74,-76},{-40,-76},{-40,-79.8571}},
      color={255,204,51},
      thickness=0.5));
  //Connections to CCA
    //3rd floor roof
  connect(floor3.port_emb[1], cca[1]);
  connect(floor3.port_emb[2], cca[2]);
  connect(floor3.port_emb[3], cca[3]);
  connect(floor3.port_emb[4], cca[4]);
    //2nd floor roof
  connect(cca[5], Floor_2_3_1.port_emb[1]);
  connect(cca[6], Floor_2_3_2.port_emb[1]);
  connect(cca[7], Floor_2_3_3.port_emb[1]);
  connect(cca[8], Floor_2_3_4.port_emb[1]);
  connect(cca[9], Floor_2_3_6.port_emb[1]);
  connect(cca[10], Floor_2_3_7.port_emb[1]);
  connect(cca[11], Floor_2_3_8.port_emb[1]);
   //1st floor roof
  connect(cca[12], Floor_1_2_1.port_emb[1]);
  connect(cca[13], Floor_1_2_2.port_emb[1]);
  connect(cca[14], Floor_1_2_3.port_emb[1]);
  connect(cca[15], Floor_1_2_4.port_emb[1]);
  connect(cca[16], Floor_1_2_5.port_emb[1]);
  connect(cca[17], Floor_1_2_7.port_emb[1]);
  connect(cca[18], Floor_0_2.port_emb[1]);
  connect(cca[19], floor1.port_emb[1]);
  connect(cca[20], floor1.port_emb[2]);
   //Gnd floor roof
  connect(cca[21], Floor_0_1_1.port_emb[1]);
  connect(cca[22], Floor_0_1_2.port_emb[1]);
  connect(cca[23], Floor_0_1_3.port_emb[1]);
  connect(cca[24], Floor_0_1_4.port_emb[1]);
  connect(cca[25], Floor_0_1_5.port_emb[1]);
  connect(cca[26], Floor_0_1_6.port_emb[1]);
  connect(cca[27], Floor_0_1_7.port_emb[1]);
  connect(cca[28], Floor_0_1_8.port_emb[1]);
  connect(cca[29], Floor_0_1_9.port_emb[1]);
  connect(cca[30], Floor_0_1_10.port_emb[1]);
  connect(cca[31], Floor_0_1_11.port_emb[1]);
  connect(cca[32], Floor_0_1_12.port_emb[1]);
  connect(cca[33], Floor_0_1_13.port_emb[1]);
  connect(cca[34], Floor_0_1_14.port_emb[1]);
  connect(cca[35], Floor_0_1_15.port_emb[1]);
//Connections of data bus
  connect(floor3.dataBus, dataBus) annotation (Line(
      points={{-8,60},{-76,60},{-76,0},{-140,0}},
      color={255,204,51},
      thickness=0.5,
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(floor2.dataBus, dataBus) annotation (Line(
      points={{-8,18},{-76,18},{-76,0},{-140,0}},
      color={255,204,51},
      thickness=0.5,
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(floor1.dataBus, dataBus) annotation (Line(
      points={{-8,-28},{-74,-28},{-74,0},{-140,0}},
      color={255,204,51},
      thickness=0.5,
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(floor0.dataBus, dataBus) annotation (Line(
      points={{-8,-64},{-74,-64},{-74,0},{-140,0}},
      color={255,204,51},
      thickness=0.5,
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(westStairs.TSensor, dataBus.TGndFlr_WStairs) annotation (Line(
      points={{-59,46},{-98,46},{-98,42},{-139.9,42},{-139.9,0.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(eastStairs.TSensor, dataBus.TGndFlr_EStairs) annotation (Line(
      points={{81,46},{-28,46},{-28,0.1},{-139.9,0.1}},
      color={0,0,127},
      visible=false), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
//Convective heat port connections
  connect(floor3.gainCon[1], conv[1]);
  connect(floor3.gainCon[2], conv[2]);
  connect(floor3.gainCon[3], conv[3]);
  connect(floor3.gainCon[4], conv[4]);
  connect(floor3.gainCon[5], conv[5]);
  connect(floor2.gainCon[1], conv[6]);
  connect(floor2.gainCon[2], conv[7]);
  connect(floor2.gainCon[3], conv[8]);
  connect(floor2.gainCon[4], conv[9]);
  connect(floor2.gainCon[5], conv[10]);
  connect(floor1.gainCon[1], conv[11]);
  connect(floor1.gainCon[2], conv[12]);
  connect(floor1.gainCon[3], conv[13]);
  connect(floor1.gainCon[4], conv[14]);
  connect(floor1.gainCon[5], conv[15]);
  connect(floor1.gainCon[6], conv[16]);
  connect(floor1.gainCon[7], conv[17]);
  connect(floor0.gainCon[1], conv[18]);
  connect(floor0.gainCon[2], conv[19]);
  connect(floor0.gainCon[3], conv[20]);
  connect(floor0.gainCon[4], conv[21]);
  connect(floor0.gainCon[5], conv[22]);
  connect(floor0.gainCon[6], conv[23]);
  connect(floor0.gainCon[7], conv[24]);
  connect(floor0.gainCon[8], conv[25]);
//Radiative heat port connections
  connect(floor3.gainRad[1], rad[1]);
  connect(floor3.gainRad[2], rad[2]);
  connect(floor3.gainRad[3], rad[3]);
  connect(floor3.gainRad[4], rad[4]);
  connect(floor3.gainRad[5], rad[5]);
  connect(floor2.gainRad[1], rad[6]);
  connect(floor2.gainRad[2], rad[7]);
  connect(floor2.gainRad[3], rad[8]);
  connect(floor2.gainRad[4], rad[9]);
  connect(floor2.gainRad[5], rad[10]);
  connect(floor1.gainRad[1], rad[11]);
  connect(floor1.gainRad[2], rad[12]);
  connect(floor1.gainRad[3], rad[13]);
  connect(floor1.gainRad[4], rad[14]);
  connect(floor1.gainRad[5], rad[15]);
  connect(floor1.gainRad[6], rad[16]);
  connect(floor1.gainRad[7], rad[17]);
  connect(floor0.gainRad[1], rad[18]);
  connect(floor0.gainRad[2], rad[19]);
  connect(floor0.gainRad[3], rad[20]);
  connect(floor0.gainRad[4], rad[21]);
  connect(floor0.gainRad[5], rad[22]);
  connect(floor0.gainRad[6], rad[23]);
  connect(floor0.gainRad[7], rad[24]);
  connect(floor0.gainRad[8], rad[25]);
  connect(westStairs.gainCon, conv[26]);
  connect(westStairs.gainRad, rad[26]);
  connect(eastStairs.gainCon, conv[27]);
  connect(eastStairs.gainRad, rad[27]);
//Inlet ventilation air connections
  connect(floor3.airInlet[1], airInlet[1]) annotation (Line(points={{5.6,69.25},
          {6,69.25},{6,78},{140,78},{140,70.4762}}, color={0,127,255},
      visible=false));
  connect(floor3.airInlet[2], airInlet[2]);
  connect(floor3.airInlet[3], airInlet[3]);
  connect(floor3.airInlet[4], airInlet[4]);
  connect(floor2.airInlet[1], airInlet[5]);
  connect(floor2.airInlet[2], airInlet[6]);
  connect(floor2.airInlet[3], airInlet[7]);
  connect(floor2.airInlet[4], airInlet[8]);
  connect(floor1.airInlet[1], airInlet[9]);
  connect(floor1.airInlet[2], airInlet[10]);
  connect(floor1.airInlet[3], airInlet[11]);
  connect(floor1.airInlet[4], airInlet[12]);
  connect(floor1.airInlet[5], airInlet[13]);
  connect(floor0.airInlet[1], airInlet[14]);
  connect(floor0.airInlet[2], airInlet[15]);
  connect(floor0.airInlet[3], airInlet[16]);
  connect(floor0.airInlet[4], airInlet[17]);
  connect(floor0.airInlet[5], airInlet[18]);
  connect(floor0.airInlet[6], airInlet[19]);
//Outlet ventilation air connections
  connect(floor3.airOutlet[1], airOutlet[1]) annotation (Line(points={{-2.4,
          69.25},{-2,69.25},{-2,76},{-2,74},{130,74},{130,30.4762},{140,30.4762}},
        color={0,127,255},
      visible=false));
  connect(floor3.airOutlet[2], airOutlet[2]);
  connect(floor3.airOutlet[3], airOutlet[3]);
  connect(floor3.airOutlet[4], airOutlet[4]);
  connect(floor2.airOutlet[1], airOutlet[5]);
  connect(floor2.airOutlet[2], airOutlet[6]);
  connect(floor2.airOutlet[3], airOutlet[7]);
  connect(floor2.airOutlet[4], airOutlet[8]);
  connect(floor1.airOutlet[1], airOutlet[9]);
  connect(floor1.airOutlet[2], airOutlet[11]);
  connect(floor1.airOutlet[3], airOutlet[12]);
  connect(floor1.airOutlet[4], airOutlet[13]);
  connect(floor0.airOutlet[1], airOutlet[14]);
  connect(floor0.airOutlet[2], airOutlet[15]);
  connect(floor0.airOutlet[3], airOutlet[16]);
  connect(floor0.airOutlet[4], airOutlet[17]);
  connect(floor0.airOutlet[5], airOutlet[18]);
  connect(floor0.airOutlet[6], airOutlet[19]);
  connect(floor0.airOutlet[7], airOutlet[10]);
//Air inlet and outlets of stair blocks
  connect(westStairs.ports[1], airInlet[20]) annotation (Line(points={{-70,54},
          {-68,54},{-68,76},{140,76},{140,88.5714}},color={0,127,255},
      visible=false));
  connect(westStairs.ports[2], airOutlet[20]) annotation (Line(points={{-70,54},
          {-42,54},{-42,48.5714},{140,48.5714}},color={0,127,255},
      visible=false));
  connect(eastStairs.ports[1], airInlet[21]) annotation (Line(points={{70,54},{
          70,89.5238},{140,89.5238}},
                                   color={0,127,255},
      visible=false));
  connect(eastStairs.ports[2], airOutlet[21]) annotation (Line(points={{70,54},
          {70,52},{140,52},{140,49.5238}},color={0,127,255},
      visible=false));
//Extraction fan of the toilets
  connect(toiletExtract.port_b, bouAmb.ports[1]) annotation (Line(points={{-98,
          -28},{-98,-28},{-122,-28}}, color={0,127,255}));
  connect(floor3.bathExtract, toiletExtract.port_a) annotation (Line(points={{
          -12,66.6},{-50,66.6},{-50,-28},{-86,-28}}, color={0,127,255}));
  connect(floor2.bathExtract, toiletExtract.port_a) annotation (Line(points={{
          -12,24.8},{-50,24.8},{-50,-28},{-86,-28}}, color={0,127,255}));
  connect(floor1.bathExtract, toiletExtract.port_a) annotation (Line(points={{
          -12,-21.2},{-50,-21.2},{-50,-28},{-86,-28}}, color={0,127,255}));
  connect(floor0.bathExtract, toiletExtract.port_a) annotation (Line(points={{
          -12,-57.2},{-50,-57.2},{-50,-28},{-86,-28}}, color={0,127,255}));
  connect(toiletExtract.dp_in, dp_toilet) annotation (Line(points={{-92,-20.8},
          {-92,-10},{-120,-10},{-120,-80},{-160,-80}}, color={0,0,127}));
//No of occupant connections
  connect(nOcc[1], floor3.nOcc[1]) annotation (Line(points={{80,-119.259},{80,
          -119.259},{80,-20},{80,0},{40,0},{40,46},{10,46},{10,49}}, color={0,0,
          127}));
  connect(nOcc[3], floor3.nOcc[2]) annotation (Line(points={{80,-116.296},{80,0},
          {40,0},{40,46},{10,46},{10,51}}, color={0,0,127}));
  connect(nOcc[6], floor2.nOcc[1]) annotation (Line(points={{80,-111.852},{80,
          -111.852},{80,-10},{80,0},{20,0},{20,4},{9,4},{9,6.5}}, color={0,0,
          127}));
  connect(nOcc[7], floor2.nOcc[2]) annotation (Line(points={{80,-110.37},{80,
          -110.37},{80,0},{20,0},{20,7.5},{9,7.5}}, color={0,0,127}));
  connect(nOcc[8], floor2.nOcc[3]) annotation (Line(points={{80,-108.889},{80,
          -108.889},{80,0},{20,0},{20,4},{9,4},{9,8.5}}, color={0,0,127}));
  connect(nOcc[9], floor2.nOcc[4]) annotation (Line(points={{80,-107.407},{80,
          -107.407},{80,-2},{80,0},{20,0},{20,4},{9,4},{9,9.5}}, color={0,0,127}));
  connect(nOcc[11], floor1.nOcc[1]) annotation (Line(points={{80,-104.444},{80,
          -39.6},{11,-39.6}}, color={0,0,127}));
  connect(nOcc[12], floor1.nOcc[2]) annotation (Line(points={{80,-102.963},{80,
          -102.963},{80,-42},{11,-42},{11,-38.8}}, color={0,0,127}));
  connect(nOcc[13], floor1.nOcc[3]) annotation (Line(points={{80,-101.481},{80,
          -101.481},{80,-42},{80,-38},{11,-38}}, color={0,0,127}));
  connect(nOcc[14], floor1.nOcc[4]) annotation (Line(points={{80,-100},{80,
          -37.2},{11,-37.2}}, color={0,0,127}));
  connect(nOcc[15], floor1.nOcc[5]) annotation (Line(points={{80,-98.5185},{80,
          -98.5185},{80,-40},{11,-40},{11,-36.4}}, color={0,0,127}));
  connect(nOcc[20], floor0.nOcc[1]) annotation (Line(points={{80,-91.1111},{80,
          -75.3333},{7,-75.3333}}, color={0,0,127}));
  connect(nOcc[21], floor0.nOcc[2]) annotation (Line(points={{80,-89.6296},{80,
          -74},{7,-74}}, color={0,0,127}));
  connect(nOcc[22], floor0.nOcc[3]) annotation (Line(points={{80,-88.1481},{80,
          -72.6667},{7,-72.6667}}, color={0,0,127}));
  connect(westStairs.ppm, dataBus.CO2_GndFlr_WStairs) annotation (Line(points={
          {-59,44},{-54,44},{-54,18},{-139.9,18},{-139.9,0.1}}, color={0,0,127}),
      Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(eastStairs.ppm, dataBus.CO2_GndFlr_EStairs) annotation (Line(points={
          {81,44},{84,44},{84,0.1},{-139.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
            {140,100}}), graphics={
        Rectangle(
          extent={{-140,100},{140,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,68},{112,-66}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,16},{112,16}}, color={28,108,200}),
        Line(points={{-36,16},{-36,-66}}, color={28,108,200}),
        Text(
          extent={{-10,68},{112,42}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="i n f r a x",
          fontName="Broadway")}),                                Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})),
    experiment(
      StopTime=86400,
      __Dymola_NumberOfIntervals=15000,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=30,
      __Dymola_Algorithm="Euler"));
end Envelope;
