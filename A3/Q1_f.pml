#define f 0
#define t 1
chan signal1=[0] of {bit};
chan signal2=[0] of {bit};

proctype Hello()
{
	signal1?f;
	printf("Hello\n");
	signal1!t;

}

proctype World()
{
	signal2?f;
	printf("World\n");
}

proctype control()
{
	signal1!f->signal1?t;
	signal2!f;
}

init
{
	atomic{ run Hello(); run World(); run control();}
}
