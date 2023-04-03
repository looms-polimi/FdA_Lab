within FdA_Lab.Controllers.ContinuousTime;

model PID_1dof_aw_fb
  extends FdA_Lab.BaseClasses.partial_CTC;
  parameter Real K=1;
  parameter SI.Time Ti=1;
  parameter SI.Time Td=0.1;
  parameter Real N=5;
  parameter Real CSmin=0;
  parameter Real CSmax=100;
  Modelica.Blocks.Math.Gain gK(k = K)  annotation(
    Placement(visible = true, transformation(origin = {-70, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback fb annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter satfb(uMax = CSmax, uMin = CSmin)  annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ppi annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder FOfb(T = Ti, initType = Modelica.Blocks.Types.Init.InitialOutput)  annotation(
    Placement(visible = true, transformation(origin = {-10, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter satout(uMax = CSmax, uMin = CSmin) annotation(
    Placement(visible = true, transformation(origin = {130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ad annotation(
    Placement(visible = true, transformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction D(a = {Td / N, 1}, b = {K * Td, 0}, initType = Modelica.Blocks.Types.Init.InitialOutput)  annotation(
    Placement(visible = true, transformation(origin = {-10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(SP, fb.u1) annotation(
    Line(points = {{-180, 60}, {-138, 60}, {-138, 60}, {-138, 60}}, color = {0, 0, 127}));
  connect(PV, fb.u2) annotation(
    Line(points = {{-180, 20}, {-130, 20}, {-130, 52}, {-130, 52}}, color = {0, 0, 127}));
  connect(ppi.y, satfb.u) annotation(
    Line(points = {{-19, 60}, {-2, 60}}, color = {0, 0, 127}));
  connect(fb.y, gK.u) annotation(
    Line(points = {{-120, 60}, {-100, 60}, {-100, 66}, {-82, 66}}, color = {0, 0, 127}));
  connect(gK.y, ppi.u1) annotation(
    Line(points = {{-59, 66}, {-42, 66}}, color = {0, 0, 127}));
  connect(FOfb.y, ppi.u2) annotation(
    Line(points = {{-21, 10}, {-52, 10}, {-52, 54}, {-22, 54}}, color = {0, 0, 127}));
  connect(satfb.y, ad.u1) annotation(
    Line(points = {{22, 60}, {40, 60}, {40, 66}, {78, 66}, {78, 66}}, color = {0, 0, 127}));
  connect(satfb.y, FOfb.u) annotation(
    Line(points = {{22, 60}, {40, 60}, {40, 10}, {2, 10}}, color = {0, 0, 127}));
  connect(fb.y, D.u) annotation(
    Line(points = {{-120, 60}, {-100, 60}, {-100, -30}, {-22, -30}, {-22, -30}}, color = {0, 0, 127}));
  connect(D.y, ad.u2) annotation(
    Line(points = {{2, -30}, {60, -30}, {60, 54}, {78, 54}, {78, 54}}, color = {0, 0, 127}));
  connect(ad.y, satout.u) annotation(
    Line(points = {{102, 60}, {116, 60}, {116, 60}, {118, 60}}, color = {0, 0, 127}));
  connect(satout.y, CS) annotation(
    Line(points = {{142, 60}, {162, 60}, {162, 60}, {180, 60}}, color = {0, 0, 127}));
  annotation(
    Icon(graphics = {Text(origin = {2, 5}, extent = {{-64, 55}, {58, -65}}, textString = "PID_CT\n1dof\naw_fb")}, coordinateSystem(initialScale = 0.1)));
end PID_1dof_aw_fb;