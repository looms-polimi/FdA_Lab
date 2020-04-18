within FdA_Lab.Instrumentation;

model Recorder
  parameter Real Ts=0.5 "sampling time";
  parameter String csvName="data.csv" "cav file name";
  parameter Integer Ndata=5 "number of columns excluding time (1st)";
  parameter Boolean addHeader=false "add header to csv";
  parameter String csvHeader="Q1,Q2,T1,T2,Tp" "comma separated Ndata column headers";
  Modelica.Blocks.Interfaces.RealInput data[Ndata] annotation(
    Placement(visible = true, transformation(origin = {-118, -34}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
protected
  String csvLine;
algorithm
  when initial() then
     Modelica.Utilities.Files.remove(csvName);
     if addHeader then
        Modelica.Utilities.Streams.print("time,"+csvHeader,csvName);
     end if;
  end when;
  when sample(0,Ts) then
     csvLine := String(time);
     for i in 1:Ndata loop
        csvLine := csvLine+","+String(data[i]);
     end for;
     Modelica.Utilities.Streams.print(csvLine,csvName);
  end when;
  when terminal() then
     Modelica.Utilities.Streams.close(csvName);
  end when;
annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
    Icon(graphics = {Rectangle(origin = {0.23, -0.22}, lineColor = {114, 159, 207}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Sphere, extent = {{-100, 100}, {100, -100}}), Rectangle(origin = {0.18, -9.74}, fillColor = {233, 185, 110}, fillPattern = FillPattern.Solid, extent = {{-40.18, 49.74}, {40.18, -49.74}}), Ellipse(origin = {-40.03, 30.15}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, extent = {{-29.98, 29.85}, {29.98, -29.85}}, endAngle = 360), Ellipse(origin = {39.97, 30.15}, fillColor = {238, 238, 236}, fillPattern = FillPattern.Solid, extent = {{-29.98, 29.85}, {29.98, -29.85}}, endAngle = 360), Rectangle(origin = {0, -20}, fillColor = {186, 189, 182}, fillPattern = FillPattern.Solid, extent = {{-12, 6}, {12, -6}}), Rectangle(origin = {0, -44}, fillColor = {211, 215, 207}, fillPattern = FillPattern.Solid, extent = {{-38, 14}, {38, -14}})}));
end Recorder;