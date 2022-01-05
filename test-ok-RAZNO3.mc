//OPIS: funkcija sa vise parametara i assignment_statement u funkciji
//RETURN: 17
int x;
int y;
int sum(int a, int b, int c, int d, int e){
    int f;
    int k = 4;
    f = c++ + d + k++ + 1;
    return f;
  }
int main() {
  int a = 5;
  int b = 12;
  int c = 3;
  int d = 9;
  int e = 10;
  int final = 0;

  x = 10;
  y = 15;

  final = sum(a,b,c,d,e);
  

  return final;
}




