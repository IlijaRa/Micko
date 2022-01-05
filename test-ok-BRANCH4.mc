//OPIS: generisanje koda za branch_statement
//RETURN: 18

int main() {
  int x = 5;
  int y = 9;
  int h = 1;

  int counter = 0;
  int iterator;
  unsigned iteratorU = 0u;

//-------------------------------------------- 
// branch u branch-u i to sve u branchu, sa for-om i if-om
  branch(x; 2, 10, 11)
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
    	    other branch ( y ; 1 , 9 , 5 )
    	    	    one x = x + 1;
    	    	    two {
			  x = x + 3;
			  y++;
			}
    	    	    three x = x + 5;
    	    	    other x = x - 3;
  	  	  end_branch
  	  end_branch
  end_branch// x = 8, y = 10
  
  return x + y;// result = 18
}




