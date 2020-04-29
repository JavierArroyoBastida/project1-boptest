within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model TavgGndFlr "average temperature of second floor"

  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  inner IDEAS.BoundaryConditions.SimInfoManager sim(incAndAziInBus={{IDEAS.Types.Tilt.Ceiling,
        0},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.S},{IDEAS.Types.Tilt.Wall,
        IDEAS.Types.Azimuth.W},{IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.N},{
        IDEAS.Types.Tilt.Wall,IDEAS.Types.Azimuth.E}})
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  IDEAS.Utilities.Math.Average T3rdFlr(nin=6)
    "average temperature of 3rd floor zones"
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(dataBus.TGndFlr_SVR, T3rdFlr.u[1]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-12},{-82,-12},{-82,-11.6667}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));

  connect(dataBus.TGndFlr_1stAid, T3rdFlr.u[2]) annotation (Line(
      points={{-99.9,0.1},{-98,0.1},{-98,-12},{-82,-12},{-82,-11}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.TGndFlr_KTR, T3rdFlr.u[3]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-10.3333},{-82,-10.3333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.TGndFlr_MT1, T3rdFlr.u[4]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-9.66667},{-82,-9.66667}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.TGndFlr_MT2, T3rdFlr.u[5]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-9},{-82,-9}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.TGndFlr_hall, T3rdFlr.u[6]) annotation (Line(
      points={{-99.9,0.1},{-99.9,0.1},{-99.9,-12},{-82,-12},{-82,-8.33333}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));

  connect(T3rdFlr.y, dataBus.Tavg_GndFlr) annotation (Line(points={{-59,-10},
          {-56,-10},{-56,6},{-99.9,6},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(T3rdFlr.y, y) annotation (Line(points={{-59,-10},{22,-10},{22,0},
          {110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TavgGndFlr;
