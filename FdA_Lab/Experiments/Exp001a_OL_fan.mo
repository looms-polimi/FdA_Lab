within FdA_Lab.Experiments;

model Exp001a_OL_fan
  extends Modelica.Icons.Example;
  Real fan=if Qf.y then 100 else 0;
  FdA_Lab.Apparatuses.App2TP_Fan Apparatus(Cb = 1000, Gab = 0.09, Gpa = 0.022, Gt1p = 0.22, Gt2p = 0.03, Pmax = 0.3, Tstart = 273.15 + 28,wfanOn = 0.0005)  annotation(
    Placement(visible = true, transformation(origin = {-14, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Instrumentation.Probe3Ts_lag_noise_quant Probes(An = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {66, 42}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Te(y = 273.15 + 24)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Q2 annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_1p0z M1(T = 120, mu = 0.18,ubar = 20, ybar = 24.45)  annotation(
    Placement(visible = true, transformation(origin = {-19, -5}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  FdA_Lab.SignalGenerators.SineSequence sines(amplitude = 10, offset = 0, start_time = 5000)  annotation(
    Placement(visible = true, transformation(origin = {-160, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.SignalGenerators.StepSequence steps(amplitudes = {20, 20, 20, 20, -20, -20, -20, -20, 20}, offset = 20, sw_times = {100, 700, 1300, 1900, 2900, 3300, 3700, 4100, 4500})  annotation(
    Placement(visible = true, transformation(origin = {-160, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Add ain annotation(
    Placement(visible = true, transformation(origin = {-90, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_2p0z M2(T1 = 80, T2 = 10, mu = 0.08,ubar = 20, ybar = 21.6)  annotation(
    Placement(visible = true, transformation(origin = {21, -25}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  FdA_Lab.ApparatusModels.Mlin_App2TP_3p1z M3(T1 = 130, T2 = 50, T3 = 10, Tz = 120,mu = 0.08, ubar = 20, ybar = 21.6)  annotation(
    Placement(visible = true, transformation(origin = {61, -45}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  FdA_Lab.Instrumentation.Recorder recorder(addHeader = true)  annotation(
    Placement(visible = true, transformation(origin = {136, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Qf(y = time > 2500 and time < 4100)  annotation(
    Placement(visible = true, transformation(origin = {-114, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Apparatus.oT1, Probes.iT1) annotation(
    Line(points = {{10, 54}, {42, 54}}, color = {0, 0, 127}));
  connect(Apparatus.oT2, Probes.iT2) annotation(
    Line(points = {{10, 42}, {42, 42}}, color = {0, 0, 127}));
  connect(Apparatus.oTp, Probes.iTp) annotation(
    Line(points = {{10, 30}, {42, 30}}, color = {0, 0, 127}));
  connect(Te.y, Apparatus.iTe) annotation(
    Line(points = {{-79, 90}, {-14, 90}, {-14, 66}}, color = {0, 0, 127}));
  connect(ain.y, Apparatus.iQ1) annotation(
    Line(points = {{-79, 54}, {-38, 54}}, color = {0, 0, 127}));
  connect(steps.y, ain.u1) annotation(
    Line(points = {{-136, 60}, {-102, 60}}, color = {0, 0, 127}));
  connect(sines.y, ain.u2) annotation(
    Line(points = {{-136, 2}, {-120, 2}, {-120, 48}, {-102, 48}}, color = {0, 0, 127}));
  connect(ain.y, M1.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -5}, {-37, -5}}, color = {0, 0, 127}));
  connect(ain.y, M2.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -25}, {3, -25}}, color = {0, 0, 127}));
  connect(ain.y, M3.u) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -45}, {43, -45}}, color = {0, 0, 127}));
  connect(ain.y, recorder.data[1]) annotation(
    Line(points = {{-78, 54}, {-70, 54}, {-70, -70}, {124, -70}}, color = {0, 0, 127}));
  connect(Probes.oT1m, recorder.data[3]) annotation(
    Line(points = {{90, 54}, {106, 54}, {106, -70}, {124, -70}, {124, -70}}, color = {92, 53, 102}));
  connect(Probes.oT2m, recorder.data[4]) annotation(
    Line(points = {{90, 42}, {106, 42}, {106, -70}, {124, -70}, {124, -70}}, color = {92, 53, 102}));
  connect(Probes.oTpm, recorder.data[5]) annotation(
    Line(points = {{90, 30}, {106, 30}, {106, -70}, {124, -70}, {124, -70}}, color = {92, 53, 102}));
  connect(Q2.y, Apparatus.iQ2) annotation(
    Line(points = {{-78, 30}, {-60, 30}, {-60, 42}, {-38, 42}}, color = {0, 0, 127}));
  connect(Q2.y, recorder.data[2]) annotation(
    Line(points = {{-78, 30}, {-60, 30}, {-60, -70}, {124, -70}}, color = {0, 0, 127}));
  connect(Qf.y, Apparatus.iVR) annotation(
    Line(points = {{-102, -36}, {-50, -36}, {-50, 30}, {-38, 30}}, color = {255, 0, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 7200, Tolerance = 1e-6, Interval = 2),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end Exp001a_OL_fan;