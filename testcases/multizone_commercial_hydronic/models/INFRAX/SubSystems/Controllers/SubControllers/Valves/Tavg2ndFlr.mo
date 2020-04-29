within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model Tavg2ndFlr "average temperature of second floor"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Utilities.Math.Average T3rdFlr(nin=4)
    "average temperature of 3rd floor zones"
    annotation (Placement(transformation(extent={{-84,-48},{-64,-28}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(dataBus.T2ndFlr_NZ, T3rdFlr.u[1]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-39.5},{-86,-39.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T2ndFlr_SZ, T3rdFlr.u[2]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-10},{-86,-10},{-86,-38.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T2ndFlr_MT1, T3rdFlr.u[3]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-12},{-86,-12},{-86,-37.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T2ndFlr_MT2, T3rdFlr.u[4]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-36.5},{-86,-36.5}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(T3rdFlr.y, dataBus.Tavg_2ndFlr) annotation (Line(points={{-63,-38},
          {-56,-38},{-56,4},{-99.9,4},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(T3rdFlr.y, y) annotation (Line(points={{-63,-38},{20,-38},{20,0},
          {110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Tavg2ndFlr;
