within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model TwoWayValveCCA2
  extends BaseClasses.TwoWayValveCCA(        FloorAvg(nin=4));
equation

  connect(neutralCheck.y, signalBus.CCA2_val) annotation (Line(points={{81,0},{
          100,0}},
               color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(dataBus.TretCCA2, deltaTABS.u2) annotation (Line(
      points={{-99.9,0.1},{-99.9,-76},{-42,-76}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,-6},{-3,-6}},
      horizontalAlignment=TextAlignment.Right));
  connect(dataBus.T2ndFlr_NZ, FloorAvg.u[1]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-92,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T2ndFlr_SZ, FloorAvg.u[2]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-92,-20},{-92,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T2ndFlr_MT1, FloorAvg.u[3]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-22},{-92,-22},{-92,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T2ndFlr_MT2, FloorAvg.u[4]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-92,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
end TwoWayValveCCA2;
