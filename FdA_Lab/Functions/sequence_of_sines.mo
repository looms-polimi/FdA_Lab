within FdA_Lab.Functions;

function sequence_of_sines
  extends Modelica.Icons.Function;
  input Real t "time";
  input Real offset;
  input Real amplitude;
  input Real[:] periods;
  input Real[:] sw_times;
  output Real y;
algorithm
  y := offset;
  for i in 1:size(periods,1) loop
    if t>=sw_times[i] and t<sw_times[i+1] then
       y := offset+amplitude*sin(2*MC.pi/periods[i]*(t-sw_times[i]));
    end if;
  end for;
end sequence_of_sines;