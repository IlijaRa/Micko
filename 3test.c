
int raz(int a, unsigned b) {
  int c;
  c = a+a;
  return c;
}

int raz1(unsigned a, int p, unsigned ty, int op, unsigned po) {
  int u = 50;
  int c;
  c = u - 5;
  return c;
}

unsigned sum(unsigned t) {
  unsigned c;
  c = t + t;
  return c;
}

unsigned sum1(unsigned t, int pp) {
  unsigned c;
  c = t + t;
  return c;
}

int main(){
  int a, b;
  unsigned c, d;
  //a = raz(1, 4u);
  b = raz1(5u, 90, 14u, 3, 18u);
  //c = sum(1u);
  //d = sum1(65u, 14);
  return 3;
}
