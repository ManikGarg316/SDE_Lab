byte in1, in2, a, b, quo, rem;
but load = 0; done = 1;

proctype quo_rem()
{
	do
	:: (load == 1) -> a = in1; b = in2; quo = 0; rem = a; done = 0;
	:: (load != 1) -> 	if
						:: (rem >= b) -> rem = rem-b; quo=quo+1;
						:: (b > rem) -> done = 1;
						fi
	od
}	

proctype env()
{
	in1 = 7; in2 = 2; load = 1;
	done == 0; load = 0; done == 1;
	printf("quotient = %d\n", quo);
	printf("remainder = %d\n", rem);
}						

init
{
	atomic{run quo_rem(); run env();};
}