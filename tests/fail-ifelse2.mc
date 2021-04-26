// Author: James
func main() int
{

  bool b; 
  b = true;

  if(b) {
      printStr("hm");
  } else {
      printStr("end?");  
  } else if(false) { // elif after else
      printStr("blah");
  }

  return 0;
}
