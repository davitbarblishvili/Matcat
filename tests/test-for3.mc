// Author: Davit, James
func main() int
{
  int i;
  int j;
  for (i = 0; i < 1 ; i = i + 1) { 
    for (j = 0; j <= i ; j = j + 1) { // declare i inside loop 
      printStr("nested loop");
        
    }
  } 
  
  return 0;
}
