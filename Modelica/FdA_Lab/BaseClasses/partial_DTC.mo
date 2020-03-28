within FdA_Lab.BaseClasses;

model partial_DTC
  parameter SI.Time Ts;
  Modelica.Blocks.Interfaces.RealInput SP annotation(
    Placement(visible = true, transformation(origin = {-180, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput PV annotation(
    Placement(visible = true, transformation(origin = {-180, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput CS annotation(
    Placement(visible = true, transformation(origin = {180, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
protected
  discrete Real cs;
equation
  CS = cs;

annotation(
    Icon(graphics = {Rectangle(origin = {0, -1}, lineColor = {173, 127, 168}, fillColor = {243, 243, 243}, fillPattern = FillPattern.Sphere, extent = {{-100, 101}, {100, -99}})}, coordinateSystem(initialScale = 0.1)),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end partial_DTC;