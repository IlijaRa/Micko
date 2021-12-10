//OPIS: generisanje koda za branch_statement
//RETURN: 122

int main() {
  int x = 5;
  int y = 9;
  int h = 1;

  int counter = 0;
  int iterator;
  unsigned iteratorU = 0u;

  branch ( x ; 1 , 3 , 5 )
    one x = x + 1;
    two x = x + 3;
    three x = x + 5;
    other x = x - 3;
  end_branch// x = 10, y = 9
  
  branch(y; 2, 9, 7)
    one {
	  counter++;
	  y = y + 10;
	}
    two if(x > y){
	  x = 100;
	}
	else
	  y = 100;
    three y++;
    other counter = -1;
  end_branch// x = 100,  y = 9

  branch(x; 100, 5, 1)
    one for(iterator = 0 to 10 step 2){
	    x = x + 1;
    	    y = y + 1;
	}
    two if(x > y){
	  x = 100;
	}
	else
	  y = 100;
    three {
	    counter++;
	    iteratorU = iteratorU + 4u;
	  }
    other branch (x ; 1 , 100 , 5 )
    	    one x = x + 1;
    	    two x = x + y;
    	    three x = x + 5;
    	    other x = x - 3;
  	  end_branch
  end_branch// x = 105, y = 14
//-------------------------------------------- 
// branch u branch-u i u branchu, sa for-om i if-om
  branch(y; 2, 10, 11)
    one {
	  counter++;
	  iteratorU = iteratorU + 4u;
	}
    two if(x > y){
	  x = 100;
	}
	else
	  y = 100;
    three h++;
    other branch(y; 2, 190, 5)
    	    one {
	  	  counter++;
	  	  iteratorU = iteratorU + 4u;
		}
    	    two if(x > y){
	  	  x = 100;
	        }
		else
	  	  y = 100;
    	    three for(iterator = 0 to 10 step 3){
	    	    x = x + 1;
    	    	    y = y + 1;
	  	  }
    	    other branch ( y ; 1 , 14 , 5 )
    	    	    one x = x + 1;
    	    	    two x = x + 3;
    	    	    three x = x + 5;
    	    	    other x = x - 3;
  	  	  end_branch
  	  end_branch
  end_branch// x = 108, y = 14
  
  return x + y;// result = 122
}




