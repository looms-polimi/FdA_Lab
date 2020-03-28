within FdA_Lab.BaseClasses;

model partial_App2TP_Fan
  extends BaseClasses.partial_App2TP_NoFan;
  Modelica.Blocks.Interfaces.BooleanInput iVR annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -58}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  annotation(
    Icon(graphics = {Ellipse(origin = {-43, 62}, fillColor = {186, 189, 182}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-33, 10}, {33, -10}}, endAngle = 360), Rectangle(origin = {0, 61}, fillColor = {238, 238, 236}, fillPattern = FillPattern.VerticalCylinder, extent = {{-10, 9}, {12, -9}}), Ellipse(origin = {45, 62}, fillColor = {186, 189, 182}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-33, 10}, {33, -10}}, endAngle = 360)}));
end partial_App2TP_Fan;
