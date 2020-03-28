within FdA_Lab.BaseClasses;

model partial_CTC
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-180, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-180, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {180, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

annotation(
    Icon(graphics = {Rectangle(origin = {0, -1}, lineColor = {78, 154, 6}, fillColor = {243, 243, 243}, fillPattern = FillPattern.Sphere, extent = {{-100, 101}, {100, -99}})}),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end partial_CTC;