//OPIS: unsigned funkcija sa vise razlicitih parametara
//RETURN: 8


unsigned f(int k, unsigned p, unsigned o){
	unsigned g;
	g = p + 1u;
	return (p + o) + g;
} 

unsigned main(){
	unsigned result;
	result = f(1, 2u, 3u);
	return result;
}
