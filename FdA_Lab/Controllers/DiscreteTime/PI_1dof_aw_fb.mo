within FdA_Lab.Controllers.DiscreteTime;

model PI_1dof_aw_fb
  extends FdA_Lab.BaseClasses.partial_DTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  discrete Real xfb,xfbo;
algorithm
  when sample(0,Ts) then
    cs   := max(CSmin,min(CSmax,K*(SP-PV)+xfb));
    xfb  := (Ti*xfbo+Ts*cs)/(Ti+Ts);
    xfbo := xfb;
  end when;
initial algorithm
  xfb  := 0;
  xfbo := 0;
  annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PI_DT
1dof
aw_fb")}, coordinateSystem(initialScale = 0.1)));
end PI_1dof_aw_fb;