//OPIS: Program koji racuna najveci od 3 uneta broja
//RETURN: 90
int main() {
    int max;
    int first = 3;
    int second = 18;
    int third = 90;

    max = first;
    if(second > max)
      max = second;
    if(third > max)
      max = third;

    return max;
}




