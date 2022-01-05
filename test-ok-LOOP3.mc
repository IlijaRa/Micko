//OPIS: generisanje koda za loop_statement, samo unsigned vrednosti
//RETURN: 51
unsigned main() {
  unsigned a = 10u;
  unsigned b = 9u;
  unsigned c = 8u;
  unsigned d = 7u;
  unsigned e = 6u;
  unsigned f = 5u;
  unsigned resultU = 0u;
  loop unsigned iteratorU1 in (1u : 5u step 1u){
    resultU++;
  }// result = 5u
  
  loop unsigned iteratorU1 in (1u : 10u step 2u){
    resultU++;
  }// result = 10u

  loop unsigned iteratorU1 in (1u : 3u step 1u){
    f = a++ + c - d;
  }// f = 13u, a = 13u

  resultU = resultU + f + a; // result = 36u

  loop unsigned i in (1u : 6u step 2u){
    loop unsigned j in (0u : 3u step 1u){
      resultU++;
    }
    resultU++;
  }// result = 51u;

  return resultU;
}
