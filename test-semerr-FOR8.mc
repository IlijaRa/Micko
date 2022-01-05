//OPIS: step je veci od granice dokle ide for

int main() {
  int iterator;
  unsigned iteratorU;
  int a = 0;
  unsigned aU = 0u;

  for(iteratorU = 0u to 10u step 2u)
  {
    aU++;
  }  

  for(iteratorU = 1u to 5u step 5u)
  {
    aU++;
  }
  
  for(iterator = 0 to 10 step 2) 
  {
    a++;
  }

  for(iterator = 1 to 5 step 23) // ovaj for
  {
    a++;
  }
  return 0;
}




