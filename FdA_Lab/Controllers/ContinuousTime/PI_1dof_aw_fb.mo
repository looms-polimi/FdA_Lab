within FdA_Lab.Controllers.ContinuousTime;

model PI_1dof_aw_fb
  extends FdA_Lab.BaseClasses.partial_CTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  Modelica.Blocks.Math.Gain gK(k = K)  annotation(
    Placement(visible = true, transformation(origin = {-70, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter sat(limitsAtInit = true, uMax = CSmax, uMin = CSmin)  annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ppi annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder FOfb(T = Ti, initType = Modelica.Blocks.Types.Init.InitialOutput)  annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(SP, fb.u1) annotation(
    Line(points = {{-180, 60}, {-138, 60}, {-138, 60}, {-138, 60}}, color = {0, 0, 127}));
  connect(PV, fb.u2) annotation(
    Line(points = {{-180, 20}, {-130, 20}, {-130, 52}, {-130, 52}}, color = {0, 0, 127}));
  connect(sat.y, CS) annotation(
    Line(points = {{61, 60}, {180, 60}}, color = {0, 0, 127}));
  connect(ppi.y, sat.u) annotation(
    Line(points = {{-19, 60}, {38, 60}}, color = {0, 0, 127}));
  connect(fb.y, gK.u) annotation(
    Line(points = {{-120, 60}, {-100, 60}, {-100, 66}, {-82, 66}}, color = {0, 0, 127}));
  connect(gK.y, ppi.u1) annotation(
    Line(points = {{-59, 66}, {-42, 66}}, color = {0, 0, 127}));
  connect(FOfb.y, ppi.u2) annotation(
    Line(points = {{38, 10}, {-1, 10}, {-1, 10}, {-50, 10}, {-50, 54}, {-22, 54}, {-22, 54}}, color = {0, 0, 127}));
  connect(sat.y, FOfb.u) annotation(
    Line(points = {{62, 60}, {100, 60}, {100, 10}, {62, 10}, {62, 10}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PI_CT
1dof
aw_fb")}, coordinateSystem(initialScale = 0.1)));
end PI_1dof_aw_fb;