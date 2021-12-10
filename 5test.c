// OPIS: testiranje incrementa kada je kao izraz ili u num_expu gde je _ID promenljiva, parametar ili globalna
// RETURN: 575
int globI;
unsigned globU;

int incl(int a, int b, int c){
  int PARincrementI= 0;
  a++;
  b++;
  c++;
  PARincrementI = a++ + b++ + c++;
  return PARincrementI;
}

unsigned inclu(unsigned a, unsigned b, unsigned c){
  unsigned PARincrementU= 0u;
  a++;
  b++;
  c++;
  PARincrementU = a++ + b++ + c++;
  return PARincrementU;
}

unsigned main(){
  int a = 15;
  unsigned b = 9u;

  int final = 0;
  unsigned finalU = 0u;
  
  int VARincrementI;
  unsigned VARincrementU;
  int GVARincrementI;
  unsigned GVARincrementU;  

  globI = 200;
  globU = 250u;

  final = incl(1, 2, 3);
  finalU = inclu(10u, 20u, 30u);	

  a++;
  b++;
  globI++;
  globU++;

  VARincrementI = 10 + a++ + 5;
  VARincrementU = 16u + b++;
  GVARincrementI = 101 + globI++ + 5;
  GVARincrementU = 1u + globU++ + 73u + globU++;

  return GVARincrementU;
}
