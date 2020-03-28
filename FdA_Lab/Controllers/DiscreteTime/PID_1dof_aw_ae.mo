within FdA_Lab.Controllers.DiscreteTime;

model PID_1dof_aw_ae
  extends FdA_Lab.BaseClasses.partial_DTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter SI.Time Td=0.1;
  parameter Real N=5;
  parameter SI.Time Tt=1;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  discrete Real eo,csp,csi,csio,csd,csdo,csnc,aeo;
algorithm
  when sample(0,Ts) then
    csp  := K*(SP-PV);
    csi  := csio+K*Ts/Ti*(SP-PV)-aeo/Tt;
    csio := csi;
    csd  := (Td*csdo+K*N*Td*(SP-PV-eo))/(Td+N*Ts);
    csdo := csd;
    eo   := SP-PV;
    csnc := csp+csi+csd;
    cs   := max(CSmin,min(CSmax,csnc));
    aeo  := csnc-cs;
  end when;
initial algorithm
  eo   := 0;
  csp  := 0;
  csi  := 0;
  csio := 0;
  csd  := 0;
  csdo := 0;
  csnc := 0;
  aeo  := 0;

  annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PID_DT\n1dof\naw_ae")}, coordinateSystem(initialScale = 0.1)));
end PID_1dof_aw_ae;