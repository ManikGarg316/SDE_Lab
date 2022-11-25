#define A_TURN = 1, B_TURN = 0;
bit flag1, flag2;
byte mutex, turn;
active proctype A()
{
	flag1 = 1;
	turn = B_TURN;
	flag2 == 0 || turn == A_TURN;
	mutex++;
	mutex--;
	flag1 = 0;
}

active proctype B()
{
	flag2 = 1;
	turn = A_TURN;
	flag1 == 0 || turn == B_TURN;
	mutex++;
	mutex--;
	flag2 = 0;
} 

active proctype monitor()
{
	assert(mutex != 2);
}

init 
{
	
}