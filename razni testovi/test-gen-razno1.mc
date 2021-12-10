//OPIS: Program koji racuna najveci od 3 uneta broja
//RETURN: 90
int maxNumber(int first, int second, int third)
{
    int max;
    max = first;
    if(second > max)
      max = second;
    if(third > max)
      max = third;
    return max;
}
int main() {
    int first = 3;
    int second = 18;
    int third = 90;
    int result;
    result = maxNumber(first, second, third);
    return result;
}




