within FdA_Lab.ApparatusModels;

model Mlin_App2TP_2p0z
  extends BaseClasses.partial_LinSISO(final b={mu},final a={T1*T2,T1+T2,1});
  parameter Real mu=1;
  parameter Real T1=1;
  parameter Real T2=1;
equation

annotation(
    Icon(graphics = {Text(origin = {-32, 73}, extent = {{-68, 27}, {70, -27}}, textString = "2p0z")}));
end Mlin_App2TP_2p0z;
