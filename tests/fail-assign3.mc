func myvoid() void
{
  return;
}

func main() int
{
  int i;

  i = myvoid(); /* Fail: assigning a void to an integer */
}
