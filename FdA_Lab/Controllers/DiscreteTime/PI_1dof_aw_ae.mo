within FdA_Lab.Controllers.DiscreteTime;

model PI_1dof_aw_ae
  extends FdA_Lab.BaseClasses.partial_DTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter SI.Time Tt=1;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  discrete Real csp,csi,csio,csnc,aeo;
algorithm
  when sample(0,Ts) then
    csp  := K*(SP-PV);
    csi  := csio+K*Ts/Ti*(SP-PV)-aeo/Tt;
    csio := csi;
    csnc := csp+csi;
    cs   := max(CSmin,min(CSmax,csnc));
    aeo  := csnc-cs;
  end when;
initial algorithm
  csp  := 0;
  csi  := 0;
  csio := 0;
  csnc := 0;
  aeo  := 0;
  annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PI_DT
1dof
aw_ae")}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,evaluateAllParameters,NLSanalyticJacobian,newInst +d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PI_1dof_aw_ae;