#define high 1
#define slight 0

chan temp = [0] for {bit};
chan pressure = [0] for {bit};

proctype plant_model()
{
	do
	:: (temp?high || pressure?high) -> printf("Complete Shut Off!\n); break;
	:: (temp?slight && pressure?slight) -> printf("Going in recovery mode\n); skip;
	od
}

proctype simulate()
{
	do
	:: (temp!high) -> 	if
						:: (pressure!high) -> break;
						:: (pressure!slight) -> break;
						fi
	:: (temp!slight) -> 	if
							:: (pressure!high) -> break;
							:: (pressure!slight);
							fi
	od
}

init
{
	atomic{run plant_model(); run simulate();};
}