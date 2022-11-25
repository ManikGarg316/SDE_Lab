#define abnormal 0
#define normal 1
chan signal = [0] for {bit};
bit flag = 0;

proctype sensors()
{
	do
	:: signal?normal -> if
						:: (flag == 0) -> skip;
						:: (flag == 1) -> printf("ALERT\n"); flag = 0;
						fi
						
	:: signal?abnormal ->	if
							:: (flag == 0) -> printf("ALERT\n); flag = 1;
							:: (flag == 1) -> skip;
							fi
	od
}

proctype simulate()
{
	do
	:: (signal!normal);
	:: (signal!abnormal);
	:: break;
	od
}

init
{
	atomic{run sensors(); run simulate();};	
}
