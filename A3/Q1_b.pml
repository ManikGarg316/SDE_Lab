byte state = 1;
proctype A()
{
 (state == 1) −> state = state + 1
}

proctype B()
{
 (state == 1) −> state = state − 1 
}

init
{
 run A();
 run B()
}
