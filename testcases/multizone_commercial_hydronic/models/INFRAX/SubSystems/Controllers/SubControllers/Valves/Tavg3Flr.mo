within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model Tavg3Flr "3rd floor average temp"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Utilities.Math.Average T3rdFlr(nin=4)
    "average temperature of 3rd floor zones"
    annotation (Placement(transformation(extent={{-86,-54},{-66,-34}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(dataBus.T3rdFlr_SZ, T3rdFlr.u[1]) annotation (Line(
      points={{-99.9,0.1},{-120,0.1},{-120,6},{-100,6},{-100,16.1},{-100,
          -45.5},{-88,-45.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T3rdFlr_MTR, T3rdFlr.u[2]) annotation (Line(
      points={{-99.9,0.1},{-119.9,0.1},{-119.9,6},{-100,6},{-100,16.1},{
          -100,-44.5},{-88,-44.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T3rdFlr_CPR, T3rdFlr.u[3]) annotation (Line(
      points={{-99.9,0.1},{-120,0.1},{-120,6},{-100,6},{-100,16.1},{-100,
          -43.5},{-88,-43.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T3rdFlr_SmaR, T3rdFlr.u[4]) annotation (Line(
      points={{-99.9,0.1},{-119.9,0.1},{-119.9,6},{-100,6},{-100,16.1},{
          -100,-42.5},{-88,-42.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(T3rdFlr.y, dataBus.Tavg_3rdFlr) annotation (Line(points={{-65,-44},
          {-56,-44},{-56,0.1},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(T3rdFlr.y, y) annotation (Line(points={{-65,-44},{18,-44},{18,0},
          {110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Tavg3Flr;
