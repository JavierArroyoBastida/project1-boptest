within INFRAX.SubSystems.Controllers.Components;
model RunningMeanTemperature7to18
  "Calculate the running mean temperature from 7h to 18h"

  parameter Real[24] TAveDayIni(unit="K", displayUnit="degC") = ones(24).* 283.15
    "Initial running mean temperature";

  // Interface
   discrete Modelica.Blocks.Interfaces.RealOutput TRm(unit="K",displayUnit = "degC")
    "Running mean average temperature"
     annotation (Placement(transformation(extent={{96,-10},{116,10}})));

protected
  discrete Real[24] TAveDay(unit="K",displayUnit = "degC")
    "Vector with the average hour temperatures of the previous day";

public
  Modelica.Blocks.Sources.RealExpression TAmb(y=sim.Te)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  outer IDEAS.BoundaryConditions.SimInfoManager sim
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
algorithm
  when initial() then
    // initialization of the discrete variables
    TAveDay:= TAveDayIni;
  elsewhen sample(3600,3600) then
    // Update of TAveDay

     for i in 2:24 loop
      TAveDay[i] := pre(TAveDay[i-1]);
     end for;

     TAveDay[1] := TAmb.y;

  end when;

initial equation
  TRm = TAveDayIni[1];

equation

  when sample(3600*18, 3600*24) then
    TRm = sum(TAveDay[7:18])/12;
  end when
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
    experiment(StopTime=864000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Rectangle(
          extent={{100,100},{-100,-100}},
          lineColor={100,100,100},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255}),
        Line(
          points={{0,100},{98,0},{0,-100}},
          color={100,100,100},
          smooth=Smooth.None),
        Text(
          extent={{-100,140},{100,100}},
          lineColor={0,0,255},
          textString="%name"),
        Text(
          extent={{-48,32},{58,-26}},
          lineColor={0,0,255},
          textString="EN15251")}),
Documentation(revisions="<html>
<ul>
<li>
January 19, 2015, by Damien Picard:<br/>
First implementation.
</li>
</ul>
</html>"));

end RunningMeanTemperature7to18;
