within INFRAX.SubSystems.Controllers.SubControllers.Situations;
model SituationActions
  import INFRAX;

  Modelica.Blocks.Interfaces.IntegerOutput p10
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.IntegerOutput p11
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput twv_hex
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
                                                   //valves v7 and v8
  Modelica.Blocks.Interfaces.BooleanOutput twv_cc
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
                                                  //valves v9 and v10
  Modelica.Blocks.Interfaces.BooleanInput sit1
    annotation (Placement(transformation(extent={{-120,20},{-80,60}})));
  Modelica.Blocks.Interfaces.BooleanInput sit2
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.BooleanInput sit3
    annotation (Placement(transformation(extent={{-120,-60},{-80,-20}})));

  INFRAX.Data.Parameters.Hydronic hydronic
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
//  Modelica.Blocks.Interfaces.RealOutput p10_real
//    annotation (Placement(transformation(extent={{100,30},{120,50}})));
//  Modelica.Blocks.Interfaces.RealOutput p11_real
//    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
//  Modelica.Blocks.Interfaces.RealOutput twv_cc_real
//    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
//  Modelica.Blocks.Interfaces.RealOutput twv_hex_real
//    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
equation

  if sit1 == true then
    p10 = 1;
//    p10_real = 1;
    p11 = 1;
//    p11_real = 1;
    twv_cc = false;
//    twv_cc_real = 0;
    twv_hex = true;
//    twv_hex_real = 1;
  elseif sit2 == true then
    p10 = 0;
//    p10_real = 0;
    p11 = 1;
//    p11_real = 1;
    twv_cc = true;
//    twv_cc_real = 1;
    twv_hex = false;
//    twv_hex_real = 0;
  elseif sit3 == true then
    p10 = 0;
//    p10_real = 0;
    p11 = 1;
 //   p11_real = 1;
    twv_cc = true;
//    twv_cc_real = 1;
    twv_hex = false;
//    twv_hex_real = 0;
  else //sit0
    p10 = 0;
//    p10_real = 0;
    p11 = 0;
//    p11_real = 0;
    twv_cc = false;
//    twv_cc_real = 0;
    twv_hex = false;
//    twv_hex_real = 0;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SituationActions;
