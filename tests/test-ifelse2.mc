func main() int
{

  bool b = true;
  printb(b);
  printb(true);

  if(b) {
      printStr("goodprint");
  }

  if(!b) {
      printStr("badprint");
  }

  printb(b);

  return 0;
}
