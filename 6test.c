// OPIS: logop testiranje
// RETURN: 15

int main(){
  int retVal = 0;
  int a = 10;

  branch ( a ; 1 , 3 , 10 )
    one a = a + 1;
    two a = a + 3;
    three a = a + 5;
    other a = a - 3;
  end_branch// a = 15

  branch ( a ; 1 , 13 , 10 )
    one a = a + 1;
    two a = a + 3;
    three a = a + 5;
    other branch ( a ; 18 , 15 , 10 )
    	    one a = a + 1;
    	    two a = a + 3;
    	    three a = a + 5;
    	    other a = a - 3;
  	  end_branch
  end_branch// a = 18

  
  return a;
}
