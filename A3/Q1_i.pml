chan div_result = [1] of {int};
chan fact_result = [1] of {int};
chan fact_rec = [1] of {int};
proctype division(int a, int b)
{
	int result;
	if
	:: (b == 0) -> printf("DIVISION ERROR : Cannot divide by zero\n");
	:: (b != 0) -> result = a/b;
	fi
	div_result!result;
}


proctype factorial_iter(int n)
{
	int result = 1;
	do
	:: (n == 0) -> break;
	:: (n != 0) -> result = result*n; n = n-1;
	od
	fact_result!result;
}

proctype factorial_recur(int n)
{
	int result;
	if
	:: (n == 0) -> skip;
	:: (n != 0) ->  fact_rec?result; result = result*n;
					fact_rec!result; run factorial_recur(n-1);
	fi
}


init
{
	
}
