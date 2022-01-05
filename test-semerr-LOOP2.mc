//OPIS: granice nisu istog tipa

int main() {
  int a = 0;
  unsigned aU = 0u;
  loop unsigned iteratorU in (0u : 10u step 2u){
    aU++;
  }  
  loop unsigned iteratorU in (1u : 5u step 5u){
    aU++;
  }
  loop int iterator in (0u : 10 step 2)// ovaj loop
  {
    a++;
  }
  loop int iterator in (1 : 5 step 2){
    a++;
  }
  return 0;
}




