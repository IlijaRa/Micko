//OPIS: <lit2> nije istog tipa kao <id>

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
  
  for(iterator = 0 to 10u step 2) // ovaj for
  {
    a++;
  }

  for(iterator = 1 to 5 step 23)
  {
    a++;
  }
  return 0;
}




