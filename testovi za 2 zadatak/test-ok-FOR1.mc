//OPIS: provera sintakse i semantike za for_statement

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
  unsigned t = 10u;
  int result = 0;
  unsigned resultU = 0u;
  int iterator;
  int iterator2;
  unsigned iteratorU;
  int zbir = 0;
  int razlika = 0;

  for(iterator = 1 to 5)
  {
    result++;
  }
//--------------------------------------------
  for(iteratorU = 1u to 20u)
  {
    resultU++;
  }
//--------------------------------------------
  for(iterator = 1 to 20 step 5)
  {
    a = a + 1;
    b = a++ + c - d++; 
  }
//--------------------------------------------
  for(iteratorU = 1u to 20u step 3u)
  {
    resultU++;
    t = t + resultU;
  }
//--------------------------------------------
  // primer iz pdf-a
  for(i = 1 to 5 step 2){
    zbir = zbir + i;
    razlika = razlika - i;
  }
    for(i = 0 to 3 )
      razlika = zbir - i;
//--------------------------------------------	
  // for u for-u
  for(iterator = 5 to 100 step 10)
  {
    k = k + i;
    h = h - i;
    for(iterator2 = 4 to 18){
      g = g - 1;
    }
  }

	
  return 0;
}




