within INFRAX.SubSystems.Controllers.SubControllers.Valves;
model TwoWayValvesTABS
  INFRAX.SubSystems.Controllers.SubControllers.Valves.TwoWayValveCCA3 twoWayCCA3Con
    "Control logic of 2way valve in floor 3"
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  INFRAX.SubSystems.Controllers.SubControllers.Valves.TwoWayValveCCA2 twoWayCCA2Con
    "Control logic of 2way valve in floor 3"
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  INFRAX.SubSystems.Controllers.SubControllers.Valves.TwoWayValveCCA1 twoWayCCA1Con
    "Control logic of 2way valve in floor 1"
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  INFRAX.SubSystems.Controllers.SubControllers.Valves.TwoWayValveCCA0 twoWayCCA0Con
    "Control logic of 2way valve in floor 0"
    annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
  DataBus dataBus annotation (Placement(transformation(extent={{-120,-20},{
            -80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  SignalBus signalBus annotation (Placement(transformation(extent={{80,-20},{
            120,20}}), iconTransformation(extent={{92,-10},{112,10}})));
equation
  connect(dataBus, twoWayCCA3Con.dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,60},{-10,60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus, twoWayCCA2Con.dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,20},{-10,20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus, twoWayCCA1Con.dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,-20},{-10,-20}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(dataBus, twoWayCCA0Con.dataBus) annotation (Line(
      points={{-100,0},{-56,0},{-56,-60},{-10,-60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(twoWayCCA3Con.signalBus, signalBus) annotation (Line(
      points={{10.2,60},{52,60},{52,0},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(twoWayCCA2Con.signalBus, signalBus) annotation (Line(
      points={{10.2,20},{52,20},{52,0},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(twoWayCCA1Con.signalBus, signalBus) annotation (Line(
      points={{10.2,-20},{52,-20},{52,0},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(twoWayCCA0Con.signalBus, signalBus) annotation (Line(
      points={{10.2,-60},{52,-60},{52,0},{100,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
                                                                         Text(
          extent={{-70,80},{70,-60}},
          lineColor={28,108,200},
          textString="2-way valves")}),                          Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TwoWayValvesTABS;
