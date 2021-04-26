// Author: James
func main() int
{

  bool b; 
  b = true;

  if(b) {
      if(!b) {
          if(true) {
              else { // nested but no corresponding if
                  printStr("very nested")
              }
          }
      }
  } 

  return 0;
}
