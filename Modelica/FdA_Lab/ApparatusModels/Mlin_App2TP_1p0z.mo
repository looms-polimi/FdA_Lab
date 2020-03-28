within FdA_Lab.ApparatusModels;

model Mlin_App2TP_1p0z
  extends BaseClasses.partial_LinSISO(final b={mu},final a={T,1});
  parameter Real mu=1;
  parameter Real T=1;
equation

annotation(
    Icon(graphics = {Text(origin = {-70, 85}, extent = {{-30, 15}, {108, -41}}, textString = "1p0z")}));
end Mlin_App2TP_1p0z;
