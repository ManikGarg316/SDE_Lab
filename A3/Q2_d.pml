#define true 1
#define false 0
#define Aturn 1
#define Bturn 0
int val = 0;
chan array = [10] of {int};
bool ARuns, BRuns, t;

proctype P()
{
	int result;
	ARuns = true;
	t = Bturn;
	(BRuns == false || t==Aturn);
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> int result = val++; array!result;
	od
	ARuns = false;
}

proctype C()
{
	int result;
	BRuns = true;
	t = Aturn;
	(ARuns == false || t==Aturn);
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> array?result;
					printf("This is the value read: %d\n", result);
	od
	BRuns = false;
}

init
{
	run A();
	run B();
}