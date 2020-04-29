within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model Tavg_of_floors
  Tavg3Flr avg3rdT "Average temperature of third floor"
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Tavg2ndFlr avg2ndT "Average temperature of second floor"
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Tavg1stFlr avg1stT "Average temperature of first floor"
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  TavgGndFlr avgGndT "Average temperature of ground floor"
    annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  IDEAS.Utilities.Math.Average ave(nin=4) "Building average temperature"
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(dataBus,avg3rdT. dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,60},{-10,60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus, avg2ndT.dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,20},{-10,20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus,avg1stT. dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,-20},{-10,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus,avgGndT. dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,-60},{-10,-60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(avg3rdT.y, ave.u[4]) annotation (Line(points={{11,60},{26,60},{26,
          1.5},{38,1.5}}, color={0,0,127}));
  connect(avg2ndT.y, ave.u[3]) annotation (Line(points={{11,20},{24,20},{24,
          0.5},{38,0.5}}, color={0,0,127}));
  connect(avg1stT.y, ave.u[2]) annotation (Line(points={{11,-20},{24,-20},{
          24,-0.5},{38,-0.5}}, color={0,0,127}));
  connect(avgGndT.y, ave.u[1]) annotation (Line(points={{11,-60},{24,-60},{
          24,-1.5},{38,-1.5}}, color={0,0,127}));
  connect(ave.y, dataBus.Tavg_building) annotation (Line(points={{61,0},{64,
          0},{64,86},{-99.9,86},{-99.9,0.1}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Tavg_of_floors;
