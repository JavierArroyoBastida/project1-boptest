within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model TwoWayValveCCA1
  extends BaseClasses.TwoWayValveCCA(        FloorAvg(nin=5));
equation

  connect(dataBus.TretCCA1, deltaTABS.u2) annotation (Line(
      points={{-99.9,0.1},{-99.9,-76},{-42,-76}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(neutralCheck.y, signalBus.CCA1_val) annotation (Line(points={{71,0},{100,
          0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(dataBus.T1stFlr_NZ, FloorAvg.u[1]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-82,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_SZ1, FloorAvg.u[2]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-22},{-82,-22},{-82,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_SZ2, FloorAvg.u[3]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-82,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_MT1, FloorAvg.u[4]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-22},{-82,-22},{-82,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus.T1stFlr_MT2, FloorAvg.u[5]) annotation (Line(
      points={{-99.9,0.1},{-99.9,-20},{-82,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
end TwoWayValveCCA1;
