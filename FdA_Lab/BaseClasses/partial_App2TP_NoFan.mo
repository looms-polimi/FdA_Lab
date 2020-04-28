within FdA_Lab.BaseClasses;

partial model partial_App2TP_NoFan
  parameter SI.HeatCapacity Ct1 = 2.1 "Transistor 1 heat capacity";
  parameter SI.HeatCapacity Ct2 = 1.8 "Transistor 2 heat capacity";
  parameter SI.HeatCapacity Cp = 0.2 "Plate heat capacity";
  parameter SI.HeatCapacity Ca = 1.834 "Air (in box) heat capacity";
  parameter SI.HeatCapacity Cb = 100 "Box heat capacity";  
  parameter SI.ThermalConductance Gt1p = 0.045 "Transistor1-plate thermal cond";
  parameter SI.ThermalConductance Gt2p = 0.055 "Transistor1-plate thermal cond";
  parameter SI.ThermalConductance Gt1a = 0.021 "Transistor1-air thermal cond";
  parameter SI.ThermalConductance Gt2a = 0.018 "Transistor1-air thermal cond";
  parameter SI.ThermalConductance Gpa = 0.025 "Plate-air thermal cond";
  parameter SI.ThermalConductance Gab = 0.1 "Air-box thermal cond";
  parameter SI.ThermalConductance Gbe = 0.1 "Box-exterior thermal cond";
  parameter SI.Power Pmax = 0.6 "Max transistor pwr";
  parameter SI.Temperature Tstart = 273.15 + 20 "Initial T, all elements";
  SI.Temperature T1(start = Tstart,fixed=true);
  SI.Temperature T2(start = Tstart,fixed=true);
  SI.Temperature Tp(start = Tstart,fixed=true);
  SI.Temperature Ta(start = Tstart,fixed=true);
  SI.Temperature Tb(start = Tstart,fixed=true);
  SI.Power P1, P2;
  SI.Temperature Te;

  Modelica.Blocks.Interfaces.RealInput iQ1 "Transistor 1 cmd [0-100]" annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iQ2 "Transistor 2 cmd [0-100]" annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.Output_T oT1 "Transistor 1 temperature" annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.Output_T oT2 "Transistor 2 temperature" annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 2.22045e-16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.Output_T oTp "Plat temperature" annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput iTe "External temperature" annotation(
    Placement(visible = true, transformation(origin = {0, 80}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
equation
  P1 = Pmax*iQ1/100;
  P2 = Pmax*iQ2/100;
  T1 = oT1;
  T2 = oT2;
  Tp = oTp;
  Te = iTe;

  annotation(
    Icon(graphics = {Rectangle(origin = {-91, 89}, lineColor = {52, 101, 164}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-9, 11}, {191, -189}}), Rectangle(origin = {-1, 10}, fillColor = {193, 125, 17}, fillPattern = FillPattern.Solid, extent = {{-59, 24}, {61, -30}}), Rectangle(origin = {-26, -20}, fillColor = {136, 138, 133}, fillPattern = FillPattern.VerticalCylinder, extent = {{-24, 40}, {16, -20}}), Rectangle(origin = {34, -20}, fillColor = {136, 138, 133}, fillPattern = FillPattern.VerticalCylinder, extent = {{-24, 40}, {16, -20}}), Line(origin = {-40, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {-30, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {-20, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {20, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {30, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75), Line(origin = {40, -60}, points = {{0, 20}, {0, -20}}, thickness = 0.75)}, coordinateSystem(initialScale = 0.1)));
end partial_App2TP_NoFan;
