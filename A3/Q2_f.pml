#define p 0
#define v 1
int val = 0;
chan array = [10] of {int};
byte count = 0;
proctype semaphore()
{
	do
	:: sema!p -> sema?v;
	od
}


proctype P()
{
	sema?p;
	count = count + 1;
	int result;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> int result = val++; array!result;
	od
	count = count - 1;
	sema!v;
}


proctype C()
{
	sema?p;
	count++;
	int result;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> array?result;
					printf("This is the value read: %d\n", result);
	od
	count--;
	sema!v;
}

proctype monitor()
{
	do
	:: assert(count<=5);
	od
}

init
{
	atomic{run sempahore(); run P(); run C(); run monitor();};
}