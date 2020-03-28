within FdA_Lab.Functions;

function signal_seq_switch_times
 extends Modelica.Icons.Function;
  input Real start_time;
  input Real[:] periods;
  input Integer[:] n_periods;
  output Real sw_times[size(periods,1)+1];
algorithm
  sw_times[1] := start_time;
  for i in 1:size(periods,1) loop
    sw_times[i+1] := sw_times[i]+n_periods[i]*periods[i];
  end for;   

end signal_seq_switch_times;