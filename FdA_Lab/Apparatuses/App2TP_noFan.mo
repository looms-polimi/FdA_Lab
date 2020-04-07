within FdA_Lab.Apparatuses;

model App2TP_noFan
  extends FdA_Lab.BaseClasses.partial_App2TP_NoFan;
equation
  Ct1 * der(T1) = P1 - Gt1p * (T1 - Tp) - Gt1a * (T1 - Ta);
  Ct2 * der(T2) = P2 - Gt2p * (T2 - Tp) - Gt2a * (T2 - Ta);
  Cp * der(Tp) = Gt1p * (T1 - Tp) + Gt2p * (T2 - Tp) - Gpa * (Tp - Ta);
  Ca * der(Ta) = Gt1a * (T1 - Ta) + Gt2a * (T2 - Ta) + Gpa * (Tp - Ta) - Gab * (Ta - Tb);
  Cb * der(Tb) = Gab * (Ta - Tb) - Gbe * (Tb - Te);
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end App2TP_noFan;
