//OPIS: generisanje koda za for_statement, samo int vrednosti
//RETURN: 45
int main() {
  int a = 10;
  int b = 9;
  int c = 8;
  int d = 7;
  int e = 6;
  int f = 5;
  int result = 0;
  int iterator1;
  int iterator2;
  for(iterator1 = 1 to 5){
    result++;
  }// result = 4
  
  for(iterator1 = 1 to 10 step 2){
    result++;
  }// result = 9

  for(iterator1 = 1 to 3){
    f = a++ + c - d;
  }// f = 13, a = 12

  result = result + f + a; // result = 33

  for(iterator1 = 1 to 6 step 2){
    for(iterator2 = 0 to 3){
      result++;
    }
    result++;
  }// result = 45;

  return result;
}




