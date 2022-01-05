//RETURN: 81


int main()
{
	int a, b, c, d, e;
	a = 0;
	c = 0;
	
	loop int i in (17 : 28 step 2)
		a++;
	
	loop int i in (1 : 5 step 2)
	{
		loop int j in (13 : 5 step 4)
			c = c + j;
	}
	
	loop int i in (17 : 28 step 2)
		a++;
		
	return c;
}
