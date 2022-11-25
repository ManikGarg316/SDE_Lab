#define push 1
#define pushback 0
byte lamps = 0;
byte lamp1_state = 0;
byte lamp2_state = 0;
byte x = 0;

chan user_movement = [0] for {bit};
proctype push_button()
{
	
	do
	:: (user_movement?push) -> lamps = (lamps + 1)%4; lamp1_state = lamps%2; lamp2_state = (lamps>>1)%2; user_movement!pushback;
	od
}

proctype user()
{
	do
	:: (user_movement!push) -> user_movement?push_back; printf("LAMP1: %d, LAMP2: %d\n", lamp1_state, lamp2_state);
	:: x++;
	:: x--;
	:: (x == 0) -> break;
	od
}

init
{

}