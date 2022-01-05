//OPIS: <const2> nije istog tipa kao <var>

int main() {
  int iterator;
  unsigned iteratorU;
  int a = 0;
  unsigned aU = 0u;

  branch ( a ; 1 , 3 , 5 )
    one a = a + 1;
    two a = a + 3;
    three a = a + 5;
    other a = a - 3;
  end_branch 

  branch ( aU ; 1u , 3u , 5u )
    one aU = aU + 1u;
    two aU = aU + 3u;
    three aU = aU + 5u;
    other aU = aU - 3u;
  end_branch
  
  branch ( a ; 1 , 3 , 5u ) // ovaj branch
    one a = a + 1;
    two a = a + 3;
    three a = a + 5;
    other a = a - 3;
  end_branch 

  branch ( a ; 1 , 3 , 5 )
    one a = a + 1;
    two a = a + 3;
    three a = a + 5;
    other a = a - 3;
  end_branch 

  return 0;
}




