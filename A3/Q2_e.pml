chan sema = [0] of {bit};
int val = 0;
chan array = [10] of {int};
proctype djisktra()
{
	do
	:: sema!p -> sema?v;
	od
}

proctype P()
{
	sema?p;
	int result;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> int result = val++; array!result;
	od
	sema!v;
}

proctype C()
{
	sema?p;
	int result;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> array?result;
					printf("This is the value read: %d\n", result);
	od
	sema!v;
}

init
{
	atomic{run djisktra(); run P(); run C();};
}