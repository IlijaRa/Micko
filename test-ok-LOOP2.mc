//OPIS: generisanje koda za loop_statement, samo int vrednosti
//RETURN: 51
int main() {
  int a = 10;
  int b = 9;
  int c = 8;
  int d = 7;
  int e = 6;
  int f = 5;
  int result = 0;
  loop int iterator1 in (1 : 5 step 1){
    result++;
  }// result = 5
  
  loop int iterator1 in (1 : 10 step 2){
    result++;
  }// result = 10

  loop int iterator1 in (3 : 1 step 1){
    f = a++ + c - d;
  }// f = 13, a = 13

  result = result + f + a; // result = 36

  loop int i in (6 : 1 step 2){
    loop int j in (0 : 3 step 1){
      result++;
    }
    result++;
  }// result = 51;

  return result;
}
