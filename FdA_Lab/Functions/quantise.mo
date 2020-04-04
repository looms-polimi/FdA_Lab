within FdA_Lab.Functions;

function quantise
  extends Modelica.Icons.Function;
  input Real u;
  input Real quantum;
  output Real y;
algorithm
  y := sign(u)*quantum*floor(abs(u)/quantum);
annotation(
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end quantise;