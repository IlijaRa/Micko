//OPIS: generisanje koda za logicke operatore 
//RETURN: 4
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
	for(i = 0 to 10 step 3){
		if(a == f and b <= c and d != f){
		  if(a >= 0 and b >= 0 and c >= 0 and d >= 0 and e >= 0 or f < 0){ 
		    if(a != e and 10 > d and d != f or a == e and 10 < d and d == f){
		      if(e < f or b <= c or d == f){
			res++;
		      }
		      else{
			res = 10;}
		    }
		    else{
		      res = 20;}
		  }
		  else{
		    res = 30;}
		}
		else{
		  res = 40;}
	}
	return res;
}
