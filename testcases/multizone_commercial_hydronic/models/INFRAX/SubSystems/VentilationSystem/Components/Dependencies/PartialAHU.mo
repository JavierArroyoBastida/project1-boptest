within INFRAX.SubSystems.VentilationSystem.Components.Dependencies;
partial model PartialAHU "air handling unit of INFRAX"

  replaceable package MediumAir = IDEAS.Media.Air;
  replaceable package MediumHeaCoi = IDEAS.Media.Water;
  replaceable package MediumCooCoi = IDEAS.Media.Water;

    extends IDEAS.Fluid.Interfaces.PartialFourPortInterface(redeclare final
      package Medium1 =                                                                     MediumAir,redeclare
      final package Medium2 =                                                                                                     MediumAir,
    final m1_flow_nominal = mFlowAirRet_nominal, final m2_flow_nominal = mFlowAirSup_nominal);
      import Buildings;

  parameter Modelica.SIunits.Time tau = 200 "Time constant of components";
  parameter Modelica.SIunits.Time tauWater = 200;
  parameter Modelica.SIunits.Time tauAir = 200;
  parameter Modelica.SIunits.Time tauSensor = 200;
  parameter Modelica.SIunits.Time tauLoss = 3600*8
    "Time constant of heat losses to environment";

  parameter Modelica.SIunits.MassFlowRate mFlowAirSup_nominal
    "Nominal mass flow rate for supply air"
    annotation(Dialog(tab="General", group="Nominal mass flow rates"));
  parameter Modelica.SIunits.MassFlowRate mFlowAirRet_nominal
    "Nominal mass flow rate for return air"
    annotation(Dialog(tab="General", group="Nominal mass flow rates"));
  parameter Modelica.SIunits.MassFlowRate mFlowWatHeaCoi_nominal
    "Nominal water mass flow rate for heating coil"
    annotation(Dialog(tab="General", group="Nominal mass flow rates"));
  parameter Modelica.SIunits.MassFlowRate mFlowWatCooCoi_nominal
    "Nominal water mass flow rate for cooling coil"
    annotation(Dialog(tab="General", group="Nominal mass flow rates"));

  parameter Modelica.SIunits.Power QHeaCoi_nominal = min(mFlowWatHeaCoi_nominal*4180*(THeaCoiWatSup_nominal-THeaCoiWatRet_nominal),mFlowAirSup_nominal*1005*(THeaCoiAirRet_nominal - THeaCoiAirSup_nominal))
    "Nominal heating power"
    annotation(Dialog(tab="General", group="Nominal power"));
  parameter Modelica.SIunits.Power QCooCoi_nominal = max(mFlowWatCooCoi_nominal*4180*(TCooCoiWatSup_nominal-TCooCoiWatRet_nominal),mFlowAirSup_nominal*1005*(TCooCoiAirRet_nominal - TCooCoiAirSup_nominal))
    "Nominal cooling power"
    annotation(Dialog(tab="General", group="Nominal power"));

  parameter Modelica.SIunits.Temperature TCooCoiWatSup_nominal = 15+273.15
    annotation(Dialog(tab="General", group="Nominal temperatures"));
  parameter Modelica.SIunits.Temperature TCooCoiWatRet_nominal = 20+273.15
  annotation(Dialog(tab="General", group="Nominal temperatures"));
  parameter Modelica.SIunits.Temperature TCooCoiAirSup_nominal = 32+273.15
  annotation(Dialog(tab="General", group="Nominal temperatures"));
  parameter Modelica.SIunits.Temperature TCooCoiAirRet_nominal = 24+273.15
  annotation(Dialog(tab="General", group="Nominal temperatures"));

  parameter Modelica.SIunits.Temperature THeaCoiWatSup_nominal = 70+273.15
  annotation(Dialog(tab="General", group="Nominal temperatures"));
  parameter Modelica.SIunits.Temperature THeaCoiWatRet_nominal = 50+273.15
  annotation(Dialog(tab="General", group="Nominal temperatures"));
  parameter Modelica.SIunits.Temperature THeaCoiAirSup_nominal = -10+273.15
  annotation(Dialog(tab="General", group="Nominal temperatures"));
  parameter Modelica.SIunits.Temperature THeaCoiAirRet_nominal = 23+273.15
  annotation(Dialog(tab="General", group="Nominal temperatures"));

  Modelica.Fluid.Interfaces.FluidPort_a portCooCoi_a1(redeclare package Medium =
        MediumCooCoi)
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-90,-110},{-70,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b portCooCoi_b1(redeclare package Medium =
        MediumCooCoi)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-50,-110},{-30,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_a portHeaCoi_a1(redeclare package Medium =
        MediumHeaCoi)
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{30,-110},{50,-90}})));
  Modelica.Fluid.Interfaces.FluidPort_b portHeaCoi_b1(redeclare package Medium =
        MediumHeaCoi)
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{70,-110},{90,-90}})));
  parameter Real epsRecovery=0.7
    "Heat exchanger effectiveness of the recovery unit";
  parameter Modelica.SIunits.TemperatureDifference dTRecovery_nominal=30
    "Nominal/maximum temperature difference between inlet ports of recovery, used for regularization";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
    annotation (Placement(transformation(extent={{-50,90},{-30,110}})));
  Modelica.Blocks.Interfaces.RealInput TSupply
    "Mixed outlet temperature setpoint" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={40,108}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={56,90})));
  parameter Modelica.SIunits.PressureDifference dpWatCooCoi_nominal
    "Pressure difference" annotation (Dialog(group="Nominal pressure drops"));
  parameter Modelica.SIunits.PressureDifference dpAirCooCoi_nominal
    "Pressure difference" annotation (Dialog(group="Nominal pressure drops"));
  parameter Modelica.SIunits.PressureDifference dpWatHeaCoi_nominal
    "Pressure difference" annotation (Dialog(group="Nominal pressure drops"));
  parameter Modelica.SIunits.PressureDifference dpAirHeaCoi_nominal
    "Pressure difference" annotation (Dialog(group="Nominal pressure drops"));
  parameter Modelica.SIunits.PressureDifference dpAirRetTW_nominal
    "Pressure difference of air supply in thermal wheel"
    annotation (Dialog(group="Nominal pressure drops"));
  parameter Modelica.SIunits.PressureDifference dpAirSupTW_nominal
    "Pressure difference of exhaust air in thermal wheel"
    annotation (Dialog(group="Nominal pressure drops"));
  Controllers.SignalBus signalBus annotation (Placement(transformation(extent={
            {-94,86},{-66,114}}), iconTransformation(extent={{-210,-30},{-190,-10}})));
equation

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,58},{-40,18},{0,-22},{40,18},{0,58}},
          lineColor={0,0,0},
          smooth=Smooth.None,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,60},{-26,60},{0,34},{26,60},{98,60}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{100,-62},{26,-62},{26,-26},{0,0},{-28,-28},{-28,-62},{-100,
              -62}},
          color={0,0,0},
          smooth=Smooth.None),
        Rectangle(
          extent={{-76,-36},{-50,-86}},
          lineColor={0,128,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{52,-34},{78,-84}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{58,-50},{70,-72}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="+"),
        Text(
          extent={{-76,-48},{-50,-70}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="-"),
        Line(
          points={{-38,-60},{-38,-84},{0,-100}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),
        Text(
          extent={{-42,-40},{-32,-60}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash,
          textString="T"),
        Text(
          extent={{-74,-82},{-48,-104}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="-"),
        Text(
          extent={{54,-82},{66,-104}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="+")}),
              Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialAHU;
