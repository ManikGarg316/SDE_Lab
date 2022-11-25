bit flag1, flag2;
byte mutex;
int val = 0;
chan array = [10] of {int};
active proctype P()
{
	int result;
	flag1 = 1;
	flag2 == 0;
	mutex++;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> int result = val++; array!result;
	od
	mutex--;
	flag1 = 0;
}

active proctype C()
{
	int result;
	flag2 = 1;
	flag1 == 0;
	mutex++;
	do
	:: (val >= 100) -> break;
	:: (val < 100) -> array?result;
					printf("This is the value read: %d\n", result);
	od
	mutex--;
	flag2 = 0;
}

active proctype monitor(){
	assert(mutex!=2);
}

init
{
	
}