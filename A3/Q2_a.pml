bit flag;
byte mutex;
int val = 0;
chan array = [10] of {int};
proctype P()
{
	int result;
	flag != 1;
	flag = 1;
	mutex++;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> int result = val++; array!result;
	od
	mutex--;
	flag = 0;
}

proctype C()
{
	int result;
	flag != 1;
	flag = 1;
	mutex++;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> array?result;
					printf("This is the value read: %d\n", result);
	od
	mutex--;
	flag = 0;
}

proctype monitor()
{
	assert(mutex != 2);
}

init
{
	atomic{run P(0); run P(1); run monitor();}
}