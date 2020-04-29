within INFRAX.SubSystems.HeatingSystem;
model HeatingSystemBOPTEST
  extends HeatingSystem(borField(allowFlowReversal=true), pump1(
        allowFlowReversal=true));
  IBPSA.Utilities.IO.SignalExchange.Read heaPumPow1(
    description="Power of heat pump 1",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "heat pump 1 power"
    annotation (Placement(transformation(extent={{-98,140},{-78,160}})));

  IBPSA.Utilities.IO.SignalExchange.Read heaPumPow2(
    description="Power of heat pump 2",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "heat pump 2 power"
    annotation (Placement(transformation(extent={{-98,162},{-78,182}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow1(
    description="Power of hydraulic pump 1",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 1 power"
    annotation (Placement(transformation(extent={{-178,-62},{-198,-42}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow3(
    description="Power of hydraulic pump 3",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 3 power"
    annotation (Placement(transformation(extent={{-36,90},{-16,110}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow4(
    description="Power of hydraulic pump 4",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 4 power"
    annotation (Placement(transformation(extent={{-66,10},{-50,26}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow5(
    description="Power of hydraulic pump 5",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 5 power"
    annotation (Placement(transformation(extent={{-50,-58},{-34,-42}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow8(
    description="Power of hydraulic pump 8",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 8 power"
    annotation (Placement(transformation(extent={{128,48},{138,58}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow7(
    description="Power of hydraulic pump7 ",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 7 power"
    annotation (Placement(transformation(extent={{70,100},{54,116}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow10(
    description="Power of hydraulic pump 10",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 10 power"
    annotation (Placement(transformation(extent={{244,86},{260,102}})));

  IBPSA.Utilities.IO.SignalExchange.Read pumPow11(
    description="Power of hydraulic pump 11",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "hydraulic pump 11 power"
    annotation (Placement(transformation(extent={{244,62},{260,78}})));

  IBPSA.Utilities.IO.SignalExchange.Read cooTowPow(
    description="Power of the cooling tower",
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.ElectricPower,
    y(unit="W")) "cooling tower power"
    annotation (Placement(transformation(extent={{230,116},{246,132}})));

equation
   connect(heaPum1.P, heaPumPow1.u) annotation (Line(points={{-114,83},{-114,150},
          {-100,150}}, color={0,0,127}));
  connect(heaPum2.P, heaPumPow2.u) annotation (Line(points={{-114,119},{-114,172},
          {-100,172}}, color={0,0,127}));
  connect(pump1.P, pumPow1.u) annotation (Line(points={{-159,-41},{-172,-41},{-172,
          -52},{-176,-52}}, color={0,0,127}));
  connect(pump3.P, pumPow3.u) annotation (Line(points={{-44.9,43.1},{-44.9,60},{
          -30,60},{-30,80},{-46,80},{-46,100},{-38,100}}, color={0,0,127}));
  connect(pump4.P, pumPow4.u) annotation (Line(points={{-63,1},{-63,10},{-80,10},
          {-80,18},{-67.6,18}}, color={0,0,127}));
  connect(pump5.P, pumPow5.u) annotation (Line(points={{-59.2,-52.9},{-55.6,-52.9},
          {-55.6,-50},{-51.6,-50}}, color={0,0,127}));
  connect(pumPow8.u, pump8.P) annotation (Line(points={{127,53},{123.9,53},{123.9,
          41.8}}, color={0,0,127}));


  connect(tABS_detailed.P_pump, pumPow7.u) annotation (Line(points={{85.0909,
          75.5},{82,75.5},{82,108},{71.6,108}}, color={0,0,127}));
  connect(coolingTower_detailed.P_CT, cooTowPow.u) annotation (Line(points={{
          219,99},{219,124},{228.4,124}}, color={0,0,127}));
  connect(coolingTower_detailed.P10, pumPow10.u) annotation (Line(points={{219,
          88},{231.5,88},{231.5,94},{242.4,94}}, color={0,0,127}));
  connect(coolingTower_detailed.P11, pumPow11.u) annotation (Line(points={{219,
          86.2},{230.5,86.2},{230.5,70},{242.4,70}}, color={0,0,127}));
end HeatingSystemBOPTEST;
