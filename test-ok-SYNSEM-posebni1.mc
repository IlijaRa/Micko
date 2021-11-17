//OPIS: provera sintakse i semantike za posebne zadatke

int main() {
  int a = 10;
  int b = 9;
  int c = 8;
  int d = 7;
  int e = 6;
  int f = 5;

  unsigned p, q ,r, s;
  int i = 0;
  int j = 1;
  int iti = 0;
  int jti = 1;
  int zbir=0;
  int razlika=0;

  if(a < b or c < d and e != f){
     a = a + 1;
     if(a>c){
       b++;
     }
  }
  else{
    a = a + 1;
  }

  if(a < b and c >= d and a > d or e < f and a != d){
    zbir = 100;
  }

  // for u for-u
  for(i=1 to 6 step 3)
  {
    zbir = zbir + i;
    razlika = razlika - i;
    for(i = 0 to 3 ){
      razlika = zbir - i;
    }
  }

  for(i=1 to 10)
  {
    iti++;
    jti = jti + 10;
  }

  branch ( a ; 1 , 3 , 5 )
    one if(a < b or b > a){}
    two for(i=1 to 6 step 3){}
    three return 5;
    other {
	  a = a + 1; 
	  b = b + 1;
	  }
  end_branch

  // branch u branch-u
  branch ( a ; 2 , 4 , 6 )
    one branch ( a ; 1 , 3 , 5 )
    	  one if(a < b or b > a){}
    	  two for(i=1 to 6 step 3){}
    	  three return 5;
    	  other {
	  	a = a + 1; 
	  	b = b + 1;
	  	}
  	  end_branch
    two for(i=1 to 6 step 3){}
    three return 5;
    other {
	  a = a + 1; 
	  b = b + 1;
	  }
  end_branch
		
  return 0;
}




