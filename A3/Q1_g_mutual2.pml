bit flag1, flag2;
byte mutex;

active proctype A()
{
	flag1 = 1;
	flag2 == 0;
	mutex++;
	mutex--;
	flag1 = 0;
}

active proctype B()
{
	flag2 = 1;
	flag1 == 0;
	mutex++;
	mutex--;
	flag2 = 0;
}

active proctype monitor(){
	assert(mutex!=2);
}