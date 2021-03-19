within FdA_Lab.Instrumentation;

model Probe3Ts_lag_noise_quant
  extends BaseClasses.partial_Probe3Ts;
  parameter SI.Time tau = 5 "probes time constant";
  parameter Real qs = 0.05 "sensor quantum";
  parameter Real qo = 5/4096 "output quantum";
  parameter Real An=0.3 "noise power";
  constant SI.Time Tsn=1 "noise sampling time";
  constant SI.Time Tfn=2 "noise filter time constant";
  SI.Temperature T1(start=273.15+20,fixed=false);
  SI.Temperature T2(start=273.15+20,fixed=false);
  SI.Temperature Tp(start=273.15+20,fixed=false);
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed annotation(
    Placement(visible = true, transformation(origin = {-20, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  Modelica.Blocks.Noise.TruncatedNormalNoise noiseT1(samplePeriod = Tsn, useAutomaticLocalSeed = true, useGlobalSeed = false, y_max = An, y_min = -An)  annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.TruncatedNormalNoise noiseT2(samplePeriod = Tsn, useAutomaticLocalSeed = true, useGlobalSeed = false, y_max = An, y_min = -An) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.TruncatedNormalNoise noiseTp(samplePeriod = Tsn, useAutomaticLocalSeed = true, useGlobalSeed = false, y_max = An, y_min = -An) annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real n1(start=0,fixed=true);
  Real n2(start=0,fixed=true);
  Real np(start=0,fixed=true);
equation
  // Connectors
  oT1m = Functions.quantise(T1+n1,qo);
  oT2m = Functions.quantise(T2+n2,qo);
  oTpm = Functions.quantise(Tp+np,qo);
  // Core model
  T1+tau*der(T1) = Functions.quantise(iT1,qs);
  T2+tau*der(T2) = Functions.quantise(iT2,qs);
  Tp+tau*der(Tp) = Functions.quantise(iTp,qs);
  n1+Tfn*der(n1) = noiseT1.y;
  n2+Tfn*der(n2) = noiseT2.y;
  np+Tfn*der(np) = noiseTp.y;
initial equation
  T1 = iT1;
  T2 = iT2;
  Tp = iTp;
annotation(
    Icon(graphics = {Ellipse(origin = {80, 60}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-12, 10}, {8, -10}}, endAngle = 360), Text(origin = {69, 88}, lineColor = {92, 53, 102}, extent = {{-8.99999, 12}, {33, -12}}, textString = "N,q"), Ellipse(origin = {80, 0}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-12, 10}, {8, -10}}, endAngle = 360), Ellipse(origin = {80, -60}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-12, 10}, {8, -10}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Probe3Ts_lag_noise_quant;