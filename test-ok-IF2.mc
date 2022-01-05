//OPIS: generisanje koda za logicke operatore 
//RETURN: 101
int main()
{
	int a, b, c, d, e, f, g, h, i, j;
	a = 1;
	b = 2;
	c = 3;
	d = 4;
	e = 5;
	f = 6; 
	g = 7;
	h = 8;
	i = 9;
	j = 10;
	if(a < d and b == c)
	{
	  b = 2;
	}
	else{
	  if(f > 5 and a <= 0 or a == 1 and b == 2){
	    if(b >= 2 and g != 5 or j < 10 and h == 9){
	      b = 101;
	    }
	    else
	      b = -101;
	  }
	  else{
	    b = 3;
	  }
	}

	return b;
}
