//OPIS: izrazi posle upitnika nisu promenljiva, parametar ili konstanta

int f(int u){
	u++;
	return u;
}
int main(int b){
	int x,y;
	x=0;
	y=2 + (x < 5) ? 1 + x : 2;
	
	return 0;
}
