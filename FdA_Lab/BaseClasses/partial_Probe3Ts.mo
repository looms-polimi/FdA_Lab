within FdA_Lab.BaseClasses;

partial model partial_Probe3Ts
  FdA_Lab.Interfaces.Input_T iT1 annotation(
    Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Interfaces.Input_T iT2 annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Interfaces.Input_T iTp annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Interfaces.Output_T oT1m annotation(
    Placement(visible = true, transformation(origin = {70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Interfaces.Output_T oT2m annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 2.22045e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Interfaces.Output_T oTpm annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  annotation(
    Icon(graphics = {Rectangle(origin = {-91, 89}, lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-9, 11}, {191, -189}}), Rectangle(origin = {0, 60}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-60, 20}, {60, -20}}), Text(origin = {-15, 56}, extent = {{-33, 16}, {63, -8}}, textString = "Tprobe"), Rectangle(fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-60, 20}, {60, -20}}), Text(origin = {-15, -4}, extent = {{-33, 16}, {63, -8}}, textString = "Tprobe"), Rectangle(origin = {0, -60}, fillColor = {252, 233, 79}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-60, 20}, {60, -20}}), Text(origin = {-15, -64}, extent = {{-33, 16}, {63, -8}}, textString = "Tprobe"), Line(origin = {-58.176, 44.0928}, points = {{-41, 16}, {-3, 16}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {-58.176, -15.9072}, points = {{-41, 16}, {-3, 16}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {-58.176, -75.9072}, points = {{-41, 16}, {-3, 16}}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Line(origin = {101.82, 44.09}, points = {{-41, 16}, {-3, 16}}, thickness = 0.75, arrowSize = 10), Line(origin = {101.82, -15.91}, points = {{-41, 16}, {-3, 16}}, thickness = 0.75, arrowSize = 10), Line(origin = {101.82, -75.91}, points = {{-41, 16}, {-3, 16}}, thickness = 0.75, arrowSize = 10)}, coordinateSystem(initialScale = 0.1)));
end partial_Probe3Ts;
