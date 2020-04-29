within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model Tavg1stFlr "average tmperature of 1st floor"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Utilities.Math.Average T3rdFlr(nin=5)
    "average temperature of 3rd floor zones"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(dataBus.T1stFlr_NZ, T3rdFlr.u[1]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-11.6},{-82,-11.6}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_SZ1, T3rdFlr.u[2]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-12},{-82,-12},{-82,-10.8}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_SZ2, T3rdFlr.u[3]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-10},{-82,-10}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_MT1, T3rdFlr.u[4]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-12},{-82,-12},{-82,-9.2}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_MT2, T3rdFlr.u[5]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-8.4},{-82,-8.4}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(T3rdFlr.y, dataBus.Tavg_1stFlr) annotation (Line(points={{-59,-10},
          {-56,-10},{-56,0},{-56,0.1},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(T3rdFlr.y, y) annotation (Line(points={{-59,-10},{22,-10},{22,0},
          {110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Tavg1stFlr;
