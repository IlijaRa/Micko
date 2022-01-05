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
  int iterator2;
  unsigned iteratorU;
  int zbir = 0;
  int razlika = 0;

  loop int iterator in (1 : 5 step 1)
  {
    result++;
  }
//--------------------------------------------
  loop unsigned iteratorU in (1u : 20u step 1u)
  {
    resultU++;
  }
//--------------------------------------------
  loop int iterator in (1 : 20 step 5)
  {
    a = a + 1;
    b = a++ + c - d++; 
  }
//--------------------------------------------
  loop unsigned iteratorU in (1u : 20u step 3u)
  {
    resultU++;
    t = t + resultU;
  }
//--------------------------------------------
  // primer iz pdf-a sa modifikacijom da bude loop
  loop int i in (1 : 5 step 2){
    zbir = zbir + i;
    razlika = razlika - i;
  }
    loop int i in (0 : 3 step 1)
      razlika = zbir - i;
//--------------------------------------------	
  // loop u loop-u
  loop int iterator in (5 : 100 step 10)
  {
    k = k + i;
    h = h - i;
    loop int iterator2 in (4 : 18 step 1){
      g = g - 1;
    }
  }

	
  return 0;
}




