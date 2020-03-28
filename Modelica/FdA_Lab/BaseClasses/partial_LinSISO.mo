within FdA_Lab.BaseClasses;

partial model partial_LinSISO
  parameter Real[:] b  "Transfer function num"; 
  parameter Real[:] a  "Transfer function den"; 
  parameter Real ubar "Equilibrium input";
  parameter Real ybar "Equilibrium output";
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction G(a = a, b = b, initType = Modelica.Blocks.Types.Init.InitialOutput)  annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  G.u = u-ubar;
  G.y+ybar = y;
  annotation(
    Icon(graphics = {Rectangle(origin = {-80, 80}, lineColor = {252, 175, 62}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-20, 20}, {180, -180}}), Line(points = {{-100, 0}, {100, 0}}, thickness = 0.5), Rectangle(origin = {-5, 5}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-37, 35}, {43, -45}}), Ellipse(origin = {-59, -10}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-21, 20}, {-1, 0}}, endAngle = 360), Ellipse(origin = {81, -10}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-21, 20}, {-1, 0}}, endAngle = 360), Text(origin = {3, 13}, extent = {{-43, 27}, {37, -53}}, textString = "G"), Line(origin = {-70, -45}, points = {{0, -35}, {0, 35}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {70, -45}, points = {{0, -35}, {0, 35}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10)}));
end partial_LinSISO;
