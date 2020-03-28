within FdA_Lab.Controllers.DiscreteTime;

model PID_1dof_aw_fb
  extends FdA_Lab.BaseClasses.partial_DTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter SI.Time Td=0.1;
  parameter Real N=5;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  discrete Real cspi,eo,xfb,xfbo,csd,csdo;
algorithm
  when sample(0,Ts) then
    cspi := max(CSmin,min(CSmax,K*(SP-PV)+xfb));
    xfb  := (Ti*xfbo+Ts*cspi)/(Ti+Ts);
    xfbo := xfb;
    csd  := (Td*csdo+K*N*Td*(SP-PV-eo))/(Td+N*Ts);
    csdo := csd;
    eo   := SP-PV;
    cs   := max(CSmin,min(CSmax,cspi+csd));
  end when;
initial algorithm
  cspi := 0;
  eo   := 0;
  xfb  := 0;
  xfbo := 0;
  csd  := 0;
  csdo := 0;
  annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PID_DT\n1dof\naw_fb")}, coordinateSystem(initialScale = 0.1)));
end PID_1dof_aw_fb;