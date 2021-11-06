int xY=54;
unsigned ra=1u;
int rc;

int sum(int t) {
  int c;
  c = t + t;
  return c;
}
int main(){
  int a ,b ,c ,d ,e;
  unsigned p;
  int i;
  int zbir=0;
  int razlika=0;

  //a= sum(1,2);

  if(a<b or c<d){
     a = a + 1;
     if(a>c){b++;}
  }



  for(i=1 to 6 step 3)
  {
    zbir = zbir + i;
    razlika = razlika - i;
    for(i = 0 to 3 ){
    razlika = zbir - i;
    }
    xY++;
  }

  branch ( a ; 1 , 3 , 5 )
    one if(a<b){}
    two for(i=1 to 6 step 3){}
    three return 5;
    other {
	  a = a + 1; 
	  b = b + 1;
	  }
  end_branch

  a=(a==b) ? b : 0;
  a = a + (a == b) ? a : b + 3;
  return 3;
}
