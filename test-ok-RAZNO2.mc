//OPIS: Program koji racuna apsolutnu vrednost unetog broja
//RETURN: 456
/* Ovo je main funkcija
   koja ce samo pozvati abs funkciju
   i ispisati rezultat */

//Funkcija koja racuna apsolutnu vrednost
int abs(int broj) {
  int retVal;
  retVal = broj;

  if(retVal < 0)
    return 0 - retVal; //negativan broj
  else
    return retVal;     //pozitivan broj

}
int main() {
  int res;
  res = abs(-456); // poziv funkcije
  return res;
}




