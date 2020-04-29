within INFRAX.SubSystems.Controllers.SubControllers.Pumps;
model P4 "hydraulic pumps logic"
  import INFRAX;

  Modelica.Blocks.Interfaces.RealInput p13
    annotation (Placement(transformation(extent={{-120,-10},{-80,30}})));
  Modelica.Blocks.Sources.Constant
                            gain(k=hydronic.p04_m_flow)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,0},{120,20}})));
  INFRAX.Data.Parameters.Hydronic hydronic
    annotation (Placement(transformation(extent={{-20,80},{0,100}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=if p13 == 0 then
        0 else gain.y)
    annotation (Placement(transformation(extent={{30,0},{50,20}})));
equation

  connect(realExpression.y, y)
    annotation (Line(points={{51,10},{110,10}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),                                Text(
          extent={{-62,76},{78,-64}},
          lineColor={28,108,200},
          textString="P4")}),    Diagram(coordinateSystem(preserveAspectRatio=false)));
end P4;
