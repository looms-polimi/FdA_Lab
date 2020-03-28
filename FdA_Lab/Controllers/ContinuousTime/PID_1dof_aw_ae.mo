within FdA_Lab.Controllers.ContinuousTime;

model PID_1dof_aw_ae
  extends FdA_Lab.BaseClasses.partial_CTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter SI.Time Td=0.1;
  parameter Real N=5;
  parameter SI.Time Tt=1;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  Modelica.Blocks.Math.Gain gK(k = K)  annotation(
    Placement(visible = true, transformation(origin = {-58, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback ae annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Nonlinear.Limiter sat(limitsAtInit = true, uMax = CSmax, uMin = CSmin)  annotation(
    Placement(visible = true, transformation(origin = {94, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gTt(k = 1 / Tt) annotation(
    Placement(visible = true, transformation(origin = { -30, -22}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback di annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator I(k = K / Ti)  annotation(
    Placement(visible = true, transformation(origin = {-58, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add3 apid annotation(
    Placement(visible = true, transformation(origin = {32, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction D(a = {Td / N, 1}, b = {K * Td, 0})  annotation(
    Placement(visible = true, transformation(origin = {-32, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SP, fb.u1) annotation(
    Line(points = {{-180, 60}, {-138, 60}, {-138, 60}, {-138, 60}}, color = {0, 0, 127}));
  connect(PV, fb.u2) annotation(
    Line(points = {{-180, 20}, {-130, 20}, {-130, 52}, {-130, 52}}, color = {0, 0, 127}));
  connect(fb.y, gK.u) annotation(
    Line(points = {{-120, 60}, {-110, 60}, {-110, 68}, {-70, 68}}, color = {0, 0, 127}));
  connect(ae.y, gTt.u) annotation(
    Line(points = {{60, 1}, {60, -22}, {-18, -22}}, color = {0, 0, 127}));
  connect(fb.y, di.u1) annotation(
    Line(points = {{-120, 60}, {-110, 60}, {-110, 10}, {-98, 10}}, color = {0, 0, 127}));
  connect(gTt.y, di.u2) annotation(
    Line(points = {{-41, -22}, {-90, -22}, {-90, 2}}, color = {0, 0, 127}));
  connect(di.y, I.u) annotation(
    Line(points = {{-81, 10}, {-70, 10}}, color = {0, 0, 127}));
  connect(gK.y, apid.u1) annotation(
    Line(points = {{-47, 68}, {20, 68}}, color = {0, 0, 127}));
  connect(I.y, apid.u2) annotation(
    Line(points = {{-46, 10}, {-22, 10}, {-22, 60}, {20, 60}, {20, 60}}, color = {0, 0, 127}));
  connect(fb.y, D.u) annotation(
    Line(points = {{-120, 60}, {-110, 60}, {-110, -60}, {-44, -60}, {-44, -60}}, color = {0, 0, 127}));
  connect(D.y, apid.u3) annotation(
    Line(points = {{-20, -60}, {0, -60}, {0, 52}, {20, 52}, {20, 52}}, color = {0, 0, 127}));
  connect(apid.y, sat.u) annotation(
    Line(points = {{44, 60}, {82, 60}, {82, 60}, {82, 60}}, color = {0, 0, 127}));
  connect(apid.y, ae.u1) annotation(
    Line(points = {{44, 60}, {60, 60}, {60, 18}, {60, 18}}, color = {0, 0, 127}));
  connect(sat.y, CS) annotation(
    Line(points = {{106, 60}, {166, 60}, {166, 60}, {180, 60}}, color = {0, 0, 127}));
  connect(sat.y, ae.u2) annotation(
    Line(points = {{106, 60}, {120, 60}, {120, 10}, {68, 10}, {68, 10}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PID_CT\n1dof\naw_ae")}, coordinateSystem(initialScale = 0.1)));
end PID_1dof_aw_ae;