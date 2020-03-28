within FdA_Lab.Apparatuses;

model App2TP_noFan
  extends FdA_Lab.BaseClasses.partial_App2TP_NoFan;
  parameter SI.HeatCapacity Ct = 2 "Transistors heat cap";
  parameter SI.HeatCapacity Cp = 0.2 "Plate heat cap";
  parameter SI.ThermalConductance Gtp = 0.05 "Transistor-plate thermal cond";
  parameter SI.ThermalConductance Gta = 0.02 "Transistor-air thermal cond";
  parameter SI.ThermalConductance Gpa = 0.025 "Plate-air thermal cond";
  parameter SI.Power Pmax = 0.6 "Max transistor pwr";
  parameter SI.Temperature Tstart = 273.15 + 20 "Initial T, all elements";
  SI.Temperature T1(start = Tstart,fixed=true);
  SI.Temperature T2(start = Tstart,fixed=true);
  SI.Temperature Tp(start = Tstart,fixed=true);
  SI.Power P1, P2;
  SI.Temperature Ta;
equation
  // Connectors
  P1 = Pmax*iQ1/100;
  P2 = Pmax*iQ2/100;
  T1 = oT1;
  T2 = oT2;
  Tp = oTp;
  Ta = iTa;
  // Core model
  Ct * der(T1) = P1 - Gtp * (T1 - Tp) - Gta * (T1 - Ta);
  Ct * der(T2) = P2 - Gtp * (T2 - Tp) - Gta * (T2 - Ta);
  Cp * der(Tp) = Gtp * (T1 - Tp) + Gtp * (T2 - Tp) - Gpa * (Tp - Ta);
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end App2TP_noFan;
