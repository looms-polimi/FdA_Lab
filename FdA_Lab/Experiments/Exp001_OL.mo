within FdA_Lab.Experiments;

model Exp001_OL
  extends Modelica.Icons.Example;
  FdA_Lab.Apparatuses.App2TP_noFan Apparatus annotation(
    Placement(visible = true, transformation(origin = {-20, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Instrumentation.Probe3Ts_lag_noise_quant Probes annotation(
    Placement(visible = true, transformation(origin = {60, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Te(y = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Q2 annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_1p0z M1(T = 120, mu = 0.18,ubar = 20, ybar = 24.45)  annotation(
    Placement(visible = true, transformation(origin = {-25, -5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  FdA_Lab.SignalGenerators.SineSequence sines annotation(
    Placement(visible = true, transformation(origin = {-160, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.SignalGenerators.StepSequence steps(amplitudes = {20, 20, 20, 20, -20, -20, -20, -20, -20, 20}, offset = 20, sw_times = {100, 700, 1300, 900, 2900, 3200, 3800, 4100})  annotation(
    Placement(visible = true, transformation(origin = {-160, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add ain annotation(
    Placement(visible = true, transformation(origin = {-90, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_2p0z M2(T1 = 80, T2 = 10, mu = 0.08,ubar = 20, ybar = 21.6)  annotation(
    Placement(visible = true, transformation(origin = {15, -25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_3p1z M3(T1 = 130, T2 = 50, T3 = 10, Tz = 120,mu = 0.08, ubar = 20, ybar = 21.6)  annotation(
    Placement(visible = true, transformation(origin = {55, -45}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  FdA_Lab.Instrumentation.Recorder recorder(addHeader = true)  annotation(
    Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Apparatus.oT1, Probes.iT1) annotation(
    Line(points = {{4, 54}, {36, 54}}, color = {0, 0, 127}));
  connect(Apparatus.oT2, Probes.iT2) annotation(
    Line(points = {{4, 42}, {36, 42}}, color = {0, 0, 127}));
  connect(Apparatus.oTp, Probes.iTp) annotation(
    Line(points = {{4, 30}, {36, 30}}, color = {0, 0, 127}));
  connect(Te.y, Apparatus.iTe) annotation(
    Line(points = {{-79, 90}, {-20, 90}, {-20, 66}}, color = {0, 0, 127}));
  connect(ain.y, Apparatus.iQ1) annotation(
    Line(points = {{-79, 54}, {-44, 54}}, color = {0, 0, 127}));
  connect(steps.y, ain.u1) annotation(
    Line(points = {{-136, 60}, {-102, 60}}, color = {0, 0, 127}));
  connect(sines.y, ain.u2) annotation(
    Line(points = {{-136, 2}, {-120, 2}, {-120, 48}, {-102, 48}}, color = {0, 0, 127}));
  connect(ain.y, M1.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -5}, {-43, -5}}, color = {0, 0, 127}));
  connect(ain.y, M2.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -25}, {-3, -25}}, color = {0, 0, 127}));
  connect(ain.y, M3.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -45}, {37, -45}}, color = {0, 0, 127}));
  connect(ain.y, recorder.data[1]) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -70}, {118, -70}, {118, -70}}, color = {0, 0, 127}));
  connect(Probes.oT1m, recorder.data[3]) annotation(
    Line(points = {{84, 54}, {100, 54}, {100, -70}, {118, -70}, {118, -70}}, color = {92, 53, 102}));
  connect(Probes.oT2m, recorder.data[4]) annotation(
    Line(points = {{84, 42}, {100, 42}, {100, -70}, {118, -70}, {118, -70}}, color = {92, 53, 102}));
  connect(Probes.oTpm, recorder.data[5]) annotation(
    Line(points = {{84, 30}, {100, 30}, {100, -70}, {118, -70}, {118, -70}}, color = {92, 53, 102}));
  connect(Q2.y, Apparatus.iQ2) annotation(
    Line(points = {{-78, 30}, {-60, 30}, {-60, 42}, {-44, 42}, {-44, 42}}, color = {0, 0, 127}));
  connect(Q2.y, recorder.data[2]) annotation(
    Line(points = {{-78, 30}, {-60, 30}, {-60, -70}, {118, -70}, {118, -70}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 9000, Tolerance = 1e-6, Interval = 1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Exp001_OL;