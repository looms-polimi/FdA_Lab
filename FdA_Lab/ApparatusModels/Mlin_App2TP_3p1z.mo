within FdA_Lab.ApparatusModels;

model Mlin_App2TP_3p1z
  extends BaseClasses.partial_LinSISO
    (final b=mu*{Tz,1},final a={T1*T2*T3,((T2+T1)*T3+T1*T2),T1+T2+T3,1});
  parameter Real mu=1;
  parameter Real T1=1;
  parameter Real T2=1;
  parameter Real T3=1;
  parameter Real Tz=0.5;
equation

annotation(
    Icon(graphics = {Text(origin = {-31, 73}, extent = {{-69, 27}, {69, -27}}, textString = "3p1z")}));
end Mlin_App2TP_3p1z;
