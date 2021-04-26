// Author: James, Andreas (Renaming only)
func main() int {
    matrix m; 
    int a = 1;
    double b = 44.25;

    m = [[a]];
    m = [[b]]; // fails here
    m = [[a], [b]];
    printStr("OK");

    return 0;
}
