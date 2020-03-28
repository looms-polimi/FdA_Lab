within FdA_Lab.SignalGenerators;

model SineSequence
  extends FdA_Lab.BaseClasses.partial_SG;
  parameter Real offset=0;
  parameter Real amplitude=20;
  parameter Real start_time = 3000;
  parameter Real[:] periods={240,120,60};
  parameter Integer[:] n_periods={5,5,5};
  
  final parameter Integer n=size(periods,1);
  final parameter Real[n+1] sw_times
        = Functions.signal_seq_switch_times(start_time,periods,n_periods);
equation
  y = Functions.sequence_of_sines(time,offset,amplitude,periods,sw_times);

annotation(
    Icon(graphics = {Text(origin = {-20, 73}, extent = {{-80, 27}, {80, -27}}, textString = "sine seq")}));
end SineSequence;