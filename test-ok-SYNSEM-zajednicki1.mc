//OPIS: provera sintakse i semantike za zajednicke zadatke

/*
   int xY;
   unsigned ra;
   int rc;
   unsigned rT;
*/

int xY;
unsigned ra;
int rc;
unsigned rT;

void multipleParamsAndVoid(int t, unsigned o, unsigned k) {
  unsigned c;
  c = o + k;
  //return c;
}

int multipleParamsAndReturn(int t, int o, unsigned k) {
  int c;
  int d = 0;
  c = t + d++;
  return c;
}

int main() {
  // int a ,b ,c ,d ,e, f;
  // unsigned p, q ,r s;
  int a ,b ,c ,d ,e, f;
  unsigned p, q ,r, s;
  int i = 0;
  int j = 1;
  int zbir=0;
  int razlika=0;
  i++;  
  j++;
  a = b + c++ - 5;

  //void multipleParamsAndVoid(1,25u, 91u);
  f = multipleParamsAndReturn(1,2, 4u);  

  ra = 5u;
  rT = 10u;
  p = ra + rT;

  a=(a==b) ? b : 0;
  a = a + (a == b) ? a : b + 3;

  p=(q==r) ? 1u : 0u;

		
  return 3;
}




