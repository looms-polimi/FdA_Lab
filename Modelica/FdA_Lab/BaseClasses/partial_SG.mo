within FdA_Lab.BaseClasses;

partial model partial_SG
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {120, -3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  annotation(
    Icon(graphics = {Rectangle(origin = {-80, 80}, lineColor = {252, 175, 62}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-20, 20}, {180, -180}}), Line(points = {{60, 0}, {100, 0}}, thickness = 0.5), Rectangle(origin = {-23, 25}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-37, 15}, {83, -67}}),  Text(origin = {1, 13}, extent = {{-43, 27}, {37, -53}}, textString = "SG")}, coordinateSystem(initialScale = 0.1)));
end partial_SG;