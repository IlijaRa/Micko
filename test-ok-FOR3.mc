//OPIS: generisanje koda za for_statement, samo unsigned vrednosti
//RETURN: 45
unsigned main() {
  unsigned a = 10u;
  unsigned b = 9u;
  unsigned c = 8u;
  unsigned d = 7u;
  unsigned e = 6u;
  unsigned f = 5u;
  unsigned resultU = 0u;
  unsigned iteratorU1;
  unsigned iteratorU2;
  for(iteratorU1 = 1u to 5u){
    resultU++;
  }// result = 4u
  
  for(iteratorU1 = 1u to 10u step 2u){
    resultU++;
  }// result = 9u

  for(iteratorU1 = 1u to 3u){
    f = a++ + c - d;
  }// f = 13u, a = 12u

  resultU = resultU + f + a; // result = 33u

  for(iteratorU1 = 1U to 6U step 2U){
    for(iteratorU2 = 0U to 3U){
      resultU++;
    }
    resultU++;
  }// result = 45u;

  return resultU;
}




