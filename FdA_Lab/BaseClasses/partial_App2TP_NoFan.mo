within FdA_Lab.BaseClasses;

partial model partial_App2TP_NoFan
  Modelica.Blocks.Interfaces.RealInput iQ1 "Transistor 1 cmd [0-100]" annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iQ2 annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.Output_T oT1 annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.Output_T oT2 annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 2.22045e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.Output_T oTp annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iTa annotation(
    Placement(visible = true, transformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  annotation(
    Icon(graphics = {Rectangle(origin = {-91, 89}, lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-9, 11}, {191, -189}}), Rectangle(origin = {-1, 10}, fillColor = {193, 125, 17}, fillPattern = FillPattern.Solid, extent = {{-59, 24}, {61, -30}}), Rectangle(origin = {-26, -20}, fillColor = {136, 138, 133}, fillPattern = FillPattern.VerticalCylinder, extent = {{-24, 40}, {16, -20}}), Rectangle(origin = {34, -20}, fillColor = {136, 138, 133}, fillPattern = FillPattern.VerticalCylinder, extent = {{-24, 40}, {16, -20}}), Line(origin = {-40, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {-30, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {-20, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {20, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {30, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {40, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75)}, coordinateSystem(initialScale = 0.1)));
end partial_App2TP_NoFan;
