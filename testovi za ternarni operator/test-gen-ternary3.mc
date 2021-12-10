//OPIS: ternarni operator
//RETURN: 18

int x;

int main(){

	int a, b;
	a = 1;
	b = 1;
	x = 13;

	a = 5 + (a == b) ? x : -1;

	return a;
}
