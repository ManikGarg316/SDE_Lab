proctype A()
{
	printf("Hello World\n");
	printf("This is the user process A: %d\n", _pid);
}


init
{
	run A();
	printf("This is the process init: %d\n", _pid);
}
