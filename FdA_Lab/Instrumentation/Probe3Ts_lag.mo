within FdA_Lab.Instrumentation;

model Probe3Ts_lag
  extends BaseClasses.partial_Probe3Ts;
  parameter SI.Time tau = 1 "probes time constant";
  SI.Temperature T1,T2,Tp;
equation
  // Connectors
  oT1m = T1;
  oT2m = T2;
  oTpm = Tp;
  // Core model
  T1+tau*der(T1) = iT1;
  T2+tau*der(T2) = iT2;
  Tp+tau*der(Tp) = iTp;
initial equation
  T1 = iT1;
  T2 = iT2;
  Tp = iTp;
end Probe3Ts_lag;
