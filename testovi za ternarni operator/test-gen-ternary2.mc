//OPIS: ternarni operator u if-u
//RETURN: 10
int main(){
	int a,b,c;
	a=2;
	b=0;
	if(a< (b>3)?1: a - 5)
		c=b++;
	else
		c=10;
		
	return c;
}
