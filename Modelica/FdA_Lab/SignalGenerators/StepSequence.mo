within FdA_Lab.SignalGenerators;

model StepSequence
  extends FdA_Lab.BaseClasses.partial_SG;
  parameter Real offset=20;
  parameter Real[:] amplitudes={20,10};
  parameter Real[:] sw_times={1000,2000};
  
equation
  y = Functions.sequence_of_steps(time,offset,amplitudes,sw_times);

annotation(
    Icon(graphics = {Text(origin = {-20, 73}, extent = {{-80, 27}, {80, -27}}, textString = "step seq")}, coordinateSystem(initialScale = 0.1)));
end StepSequence;