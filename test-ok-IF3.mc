//OPIS: generisanje koda za logicke operatore 
//RETURN: 5
int main()
{
	int a, b, c, d, e, f, res;
	int i;
	a = 1;
	b = 2;
	c = 3;
	d = 4;
	e = 5;
	f = 1;
	res = 0;
      for(i = 0 to 5){
	if(a == f and b <= c and d != f){
	  if(d >= 0 or c <= 0){ 
	    if(a != e or 0 > d and d != f){
	      if(e < f or b <= c or d == f){
	        res++;
	      }
	    }
	  }
	}
      }
	return res;
}
