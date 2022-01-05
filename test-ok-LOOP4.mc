//RETURN: 9

int main() {
	int a, b, c, d;
	d = 0;
	
	loop int i in ( 12 : 6 step 3 )
		loop int j in ( 6 : 12 step 3 )
		{
			d++;
		}
	//for unsigned u in ( 2u .. 16u step 1u )
	//	u=5u;
		
	return d;
}
