within FdA_Lab.Interfaces;

connector Output_T = output SI.Temperature(displayUnit="degC") "T output" annotation(
  Icon(graphics = {Polygon(lineColor = {92, 53, 102}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}})}, coordinateSystem(initialScale = 0.1)));