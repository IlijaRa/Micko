//OPIS: dva ista naziva iteratora u ugnjezdenim for-ovima

int main() {
  int iterator1;
  int iterator2, iterator3;
  int a = 0;
  int result = 0;

  for(iterator1 = 1 to 6 step 2){
    for(iterator1 = 0 to 3){
      result++;
    }
    result++;
  }
  
  for(iterator1 = 1 to 15)
  {
    a++;
  }

  for(iterator2 = 1 to 6 step 2){
    for(iterator2 = 0 to 3){
      result++;
      for(iterator2 = 0 to 3){
        result++;
      }
    }
    result++;
  }
  return 0;
}




