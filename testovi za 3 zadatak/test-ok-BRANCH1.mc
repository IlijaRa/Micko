//OPIS: provera sintakse i semantike za branch_statement

int main() {
  int a = 10;
  int b = 9;
  int c = 8;
  int d = 7;
  int e = 6;
  int f = 5;
  int g = 4;
  int h = 3;
  int i = 2;
  int j = 1;
  int k = 100;
  unsigned t = 10u;
  int result = 0;
  unsigned resultU = 0u;
  int iterator;
  int iterator2;
  unsigned iteratorU = 0u;
  int counter = 0;

  branch(a; 1, 5, 10)
    one a = a + 1;
    two b = b + 1;
    three c = c + 1;
    other k = 0;
  end_branch
//--------------------------------------------
  branch(t; 2u, 10u, 11u)
    one t = 20u;
    two t = 100u;
    three t = 110u;
    other t = t - 1u;
  end_branch
//-------------------------------------------- 
  // primer i pdf-a 
  branch ( a ; 1 , 3 , 5 )
    one a = a + 1;
    two a = a + 3;
    three a = a + 5;
    other a = a - 3;
  end_branch
//--------------------------------------------  
  branch(t; 2u, 10u, 11u)
    one {
	  counter++;
	  iteratorU = iteratorU + 4u;
	}
    two if(a > b){
	  a = 100;
	}
	else
	  b = 100;
    three h++;
    other counter = -1;
  end_branch
//-------------------------------------------- 
  // branch u branch-u, sa for-om i if-om
  branch(t; 2u, 10u, 11u)
    one {
	  counter++;
	  iteratorU = iteratorU + 4u;
	}
    two if(a > b){
	  a = 100;
	}
	else
	  b = 100;
    three for(iterator = 0 to 10 step 3){
	    a = a + 1;
    	    b = b + 1;
	  }
    other branch ( a ; 1 , 3 , 5 )
    	    one a = a + 1;
    	    two a = a + 3;
    	    three a = a + 5;
    	    other a = a - 3;
  	  end_branch
  end_branch
//-------------------------------------------- 
// branch u branch-u i u branchu, sa for-om i if-om
  branch(t; 2u, 10u, 11u)
    one {
	  counter++;
	  iteratorU = iteratorU + 4u;
	}
    two if(a > b){
	  a = 100;
	}
	else
	  b = 100;
    three h++;
    other branch(t; 2u, 10u, 11u)
    	    one {
	  	  counter++;
	  	  iteratorU = iteratorU + 4u;
		}
    	    two if(a > b){
	  	  a = 100;
	        }
		else
	  	  b = 100;
    	    three for(iterator = 0 to 10 step 3){
	    	    a = a + 1;
    	    	    b = b + 1;
	  	  }
    	    other branch ( a ; 1 , 3 , 5 )
    	    	    one a = a + 1;
    	    	    two a = a + 3;
    	    	    three a = a + 5;
    	    	    other a = a - 3;
  	  	  end_branch
  	  end_branch
  end_branch
  
  return 0;
}




