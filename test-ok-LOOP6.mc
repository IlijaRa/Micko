//OPIS: for u loop-u i obrnuto
//RETURN: 59
int main() {
  int a = 10;
  int b = 9;
  int c = 8;
  int d = 7;
  int e = 6;
  int f = 5;
  int i;
  int result = 0;
  loop int iterator1 in (1 : 5 step 1){
    for(i = 0 to 5){
      result++;
    }
    for(i = 0 to 5){
      result++;
    }
  }// result = 50
  
  for(i = 0 to 3){
    loop int iterator1 in (1 : 3 step 1){
      result++;
    }
  }// result = 59
  return result;
}
