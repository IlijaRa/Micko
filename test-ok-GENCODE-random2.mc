//OPIS: Program koji racuna apsolutnu vrednost unetog broja
//RETURN: 33
/* Ovo je main funkcija
   koja ce samo pozvati abs funkciju
   i ispisati rezultat */

//Funkcija koja racuna apsolutnu vrednost
int abs(int broj) {
  if(broj < 0)
    return 0 - broj; //negativan broj
  else
    return broj;     //pozitivan broj
}
int main() {
  int res;
  res = abs(-33); // poziv funkcije
  return res;
}




