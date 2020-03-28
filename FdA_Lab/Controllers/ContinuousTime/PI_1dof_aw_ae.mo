within FdA_Lab.Controllers.ContinuousTime;

model PI_1dof_aw_ae
  extends FdA_Lab.BaseClasses.partial_CTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter SI.Time Tt=1;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  Modelica.Blocks.Math.Gain gK(k = K)  annotation(
    Placement(visible = true, transformation(origin = {-30, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback ae annotation(
    Placement(visible = true, transformation(origin = {70, 10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Nonlinear.Limiter sat(limitsAtInit = true, uMax = CSmax, uMin = CSmin)  annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ppi annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gTt(k = 1 / Tt) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback di annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I(k = K / Ti)  annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SP, fb.u1) annotation(
    Line(points = {{-180, 60}, {-138, 60}, {-138, 60}, {-138, 60}}, color = {0, 0, 127}));
  connect(PV, fb.u2) annotation(
    Line(points = {{-180, 20}, {-130, 20}, {-130, 52}, {-130, 52}}, color = {0, 0, 127}));
  connect(sat.y, CS) annotation(
    Line(points = {{121, 60}, {180, 60}}, color = {0, 0, 127}));
  connect(sat.y, ae.u2) annotation(
    Line(points = {{121, 60}, {140, 60}, {140, 10}, {78, 10}}, color = {0, 0, 127}));
  connect(ppi.y, sat.u) annotation(
    Line(points = {{41, 60}, {98, 60}}, color = {0, 0, 127}));
  connect(ppi.y, ae.u1) annotation(
    Line(points = {{41, 60}, {70, 60}, {70, 18}}, color = {0, 0, 127}));
  connect(fb.y, gK.u) annotation(
    Line(points = {{-120, 60}, {-100, 60}, {-100, 66}, {-42, 66}}, color = {0, 0, 127}));
  connect(gK.y, ppi.u1) annotation(
    Line(points = {{-19, 66}, {18, 66}}, color = {0, 0, 127}));
  connect(ae.y, gTt.u) annotation(
    Line(points = {{70, 1}, {70, -30}, {42, -30}}, color = {0, 0, 127}));
  connect(fb.y, di.u1) annotation(
    Line(points = {{-120, 60}, {-100, 60}, {-100, 10}, {-78, 10}, {-78, 10}}, color = {0, 0, 127}));
  connect(gTt.y, di.u2) annotation(
    Line(points = {{19, -30}, {-70, -30}, {-70, 2}}, color = {0, 0, 127}));
  connect(di.y, I.u) annotation(
    Line(points = {{-60, 10}, {-42, 10}, {-42, 10}, {-42, 10}}, color = {0, 0, 127}));
  connect(I.y, ppi.u2) annotation(
    Line(points = {{-18, 10}, {0, 10}, {0, 54}, {18, 54}, {18, 54}}, color = {0, 0, 127}));
annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PI_CT\n1dof\naw_ae")}, coordinateSystem(initialScale = 0.1)));
end PI_1dof_aw_ae;