//OPIS: <var> nije deklarisana pre branch_statement-a

int main() {
  //int a;
  int b = 3;
  int c = 5;
  unsigned aU = 1u;

  branch ( b ; 1 , 3 , 5 )
    one b = b + 1;
    two b = b + 3;
    three b = b + 5;
    other b = b - 3;
  end_branch 

  branch ( aU ; 1u , 3u , 5u )
    one aU = aU + 1u;
    two aU = aU + 3u;
    three aU = aU + 5u;
    other aU = aU - 3u;
  end_branch
  
  branch ( a ; 1 , 3 , 5 ) // ovaj branch
    one c = c + 1;
    two c = c + 3;
    three c = c + 5;
    other c = c - 3;
  end_branch 

  branch ( c ; 1 , 3 , 5 )
    one c = c + 1;
    two c = c + 3;
    three c = c + 5;
    other c = c - 3;
  end_branch 

  return 0;
}




