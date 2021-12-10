//OPIS: provera sintakse i semantike za if_statement

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
  int k = 0;
  int result = 0;
  
  if(e >= f)
    result = 1;
  else
    result = -1;
//--------------------------------------------
  if(a != d and b < e){
    result = 1;
  }  
  else{
    result = -1;
  }
//--------------------------------------------
  if(g == k or i <= j)
    result = 1;
  else
    result = -1;
//--------------------------------------------
  if(a < b or c < d and e != f){
     a = a + 1;
     if(a > c){
       b++;
     }
  }
  else{
    a = a + 1;
  }
//--------------------------------------------
  if(h > f and k > i or j == i){
     a = a + 1; 
  }
  else{
    for(i = 0 to 10 step 2){
      a = a + i;
    }
  }
//--------------------------------------------
  if(a < b and c >= d or a > d and e < f or a != d){
    result = 100;
  }
  else if(f > e or j < i and a > b){
    branch(result ; 1 , 5 , 9)
      one result = 1;
      two result = 2;
      three result = 3;
      other result = 10000;
    end_branch
  }
//--------------------------------------------	
  return 0;
}




