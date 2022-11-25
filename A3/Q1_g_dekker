#define true 1
#define false 0
#define Aturn 1
#define Bturn 0

bool ARuns, BRuns, t;

proctype A()
{
	ARuns = true;
	t = Bturn;
	(BRuns == false || t==Aturn);
	/*critical section*/
	ARuns = false;
}

proctype B()
{
	BRuns = true;
	t = Aturn;
	(ARuns == false || t==Aturn);
	/*critical section*/
	BRuns = false;
}

init
{
	run A();
	run B();
}