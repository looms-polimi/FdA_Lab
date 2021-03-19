within FdA_Lab.BaseClasses;

model partial_App2TP_Fan
  extends BaseClasses.partial_App2TP_NoFan;
  parameter SI.ThermalConductance DGt1a = 0.012 "Gt1a increment when fan is on";
  parameter SI.ThermalConductance DGt2a = 0.009 "Gt2a increment when fan is on";
  parameter SI.ThermalConductance DGpa = 0.01 "Gpa increment when fan is on";
  parameter SI.MassFlowRate wfanOn=1 "air mass flowrate when fan is on";
  SI.ThermalConductance Gt1ae,Gt2ae,Gpae;
  Modelica.Blocks.Interfaces.BooleanInput iVR "Fan on/off command" annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -58}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  annotation(
    Icon(graphics = {Ellipse(origin = {-43, 62}, fillColor = {186, 189, 182}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-33, 10}, {33, -10}}, endAngle = 360), Rectangle(origin = {0, 61}, fillColor = {238, 238, 236}, fillPattern = FillPattern.VerticalCylinder, extent = {{-10, 9}, {12, -9}}), Ellipse(origin = {45, 62}, fillColor = {186, 189, 182}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-33, 10}, {33, -10}}, endAngle = 360)}));
end partial_App2TP_Fan;
