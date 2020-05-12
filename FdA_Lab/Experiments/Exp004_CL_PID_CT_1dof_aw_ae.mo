within FdA_Lab.Experiments;

model Exp004_CL_PID_CT_1dof_aw_ae
  extends Modelica.Icons.Example;
  FdA_Lab.Apparatuses.App2TP_noFan Apparatus annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FdA_Lab.Instrumentation.Probe3Ts_lag_noise_quant Probes annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Te(y = 273.15 + 20)  annotation(
    Placement(visible = true, transformation(origin = {-70, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression Q2(y = if time < 800 then 0 else 20)  annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression SP_Tp(y = 273.15 + (if time < 400 then 25 else 28)) annotation(
    Placement(visible = true, transformation(origin = {-170, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FdA_Lab.Controllers.ContinuousTime.PID_1dof_aw_ae PID annotation(
    Placement(visible = true, transformation(origin = {-120, 12}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(Apparatus.oT1, Probes.iT1) annotation(
    Line(points = {{24, 12}, {56, 12}}, color = {0, 0, 127}));
  connect(Apparatus.oT2, Probes.iT2) annotation(
    Line(points = {{24, 0}, {56, 0}}, color = {0, 0, 127}));
  connect(Apparatus.oTp, Probes.iTp) annotation(
    Line(points = {{24, -12}, {56, -12}}, color = {0, 0, 127}));
  connect(Q2.y, Apparatus.iQ2) annotation(
    Line(points = {{-79, -60}, {-38.5, -60}, {-38.5, 0}, {-24, 0}}, color = {0, 0, 127}));
  connect(Te.y, Apparatus.iTe) annotation(
    Line(points = {{-58, 48}, {0, 48}, {0, 24}, {0, 24}}, color = {0, 0, 127}));
  connect(SP_Tp.y, PID.SP) annotation(
    Line(points = {{-158, 24}, {-146, 24}, {-146, 24}, {-144, 24}}, color = {0, 0, 127}));
  connect(PID.CS, Apparatus.iQ1) annotation(
    Line(points = {{-96, 12}, {-26, 12}, {-26, 12}, {-24, 12}}, color = {0, 0, 127}));
  connect(PID.PV, Probes.oTpm) annotation(
    Line(points = {{-144, 0}, {-160, 0}, {-160, -80}, {120, -80}, {120, -12}, {104, -12}, {104, -12}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    experiment(StartTime = 0, StopTime = 1200, Tolerance = 1e-6, Interval = 1),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Exp004_CL_PID_CT_1dof_aw_ae;