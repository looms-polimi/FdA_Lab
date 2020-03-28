within FdA_Lab.Experiments;

model Exp001_OL
  extends Modelica.Icons.Example;
  FdA_Lab.Apparatuses.App2TP_noFan Apparatus annotation(
    Placement(visible = true, transformation(origin = {-20, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Instrumentation.Probe3Ts_lag_noise Probes annotation(
    Placement(visible = true, transformation(origin = {60, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Ta(y = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Q2 annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_1p0z M1(T = 80, mu = 0.08,ubar = 20, ybar = 21.6)  annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.SignalGenerators.SineSequence sines annotation(
    Placement(visible = true, transformation(origin = {-160, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.SignalGenerators.StepSequence steps annotation(
    Placement(visible = true, transformation(origin = {-160, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add ain annotation(
    Placement(visible = true, transformation(origin = {-90, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_2p0z M2(ubar = 20, ybar = 21.6)  annotation(
    Placement(visible = true, transformation(origin = {40, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_3p1z M3(mu = 0.08, ubar = 20, ybar = 21.6)  annotation(
    Placement(visible = true, transformation(origin = {101, -69}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
equation
  connect(Apparatus.oT1, Probes.iT1) annotation(
    Line(points = {{4, 54}, {36, 54}}, color = {0, 0, 127}));
  connect(Apparatus.oT2, Probes.iT2) annotation(
    Line(points = {{4, 42}, {36, 42}}, color = {0, 0, 127}));
  connect(Apparatus.oTp, Probes.iTp) annotation(
    Line(points = {{4, 30}, {36, 30}}, color = {0, 0, 127}));
  connect(Q2.y, Apparatus.iQ2) annotation(
    Line(points = {{-79, 30}, {-59.5, 30}, {-59.5, 42}, {-44, 42}}, color = {0, 0, 127}));
  connect(Ta.y, Apparatus.iTa) annotation(
    Line(points = {{-79, 90}, {-20, 90}, {-20, 66}}, color = {0, 0, 127}));
  connect(ain.y, Apparatus.iQ1) annotation(
    Line(points = {{-79, 54}, {-44, 54}}, color = {0, 0, 127}));
  connect(steps.y, ain.u1) annotation(
    Line(points = {{-136, 60}, {-102, 60}}, color = {0, 0, 127}));
  connect(sines.y, ain.u2) annotation(
    Line(points = {{-136, 2}, {-120, 2}, {-120, 48}, {-102, 48}}, color = {0, 0, 127}));
  connect(ain.y, M1.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -8}, {-44, -8}, {-44, -10}}, color = {0, 0, 127}));
  connect(ain.y, M2.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -40}, {16, -40}, {16, -40}}, color = {0, 0, 127}));
  connect(ain.y, M3.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -68}, {76, -68}, {76, -68}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 5400, Tolerance = 1e-6, Interval = 1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Exp001_OL;