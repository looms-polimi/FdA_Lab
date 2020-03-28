within FdA_Lab.Interfaces;

connector Input_T = input SI.Temperature(displayUnit="degC") "T input" annotation(
  Icon(graphics = {Polygon(lineColor = {92, 53, 102}, fillColor = {173, 127, 168}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}})}, coordinateSystem(initialScale = 0.1)));