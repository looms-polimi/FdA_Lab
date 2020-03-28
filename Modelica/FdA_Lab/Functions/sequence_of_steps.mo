within FdA_Lab.Functions;

function sequence_of_steps
  extends Modelica.Icons.Function;
  input Real t "time";
  input Real offset;
  input Real[:] amplitudes;
  input Real[:] sw_times;
  output Real y;
algorithm
  y := offset;
  for i in 1:size(sw_times,1) loop
    if t>=sw_times[i] then // and t<sw_times[i+1] then
       y := offset+sum(amplitudes[1:i]);
    end if;
  end for;
end sequence_of_steps;