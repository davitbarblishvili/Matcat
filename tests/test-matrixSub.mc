// Author: Davit
func main() int {
    matrix a;
    matrix b; 
    matrix c;

    a = [[1,2,3],[3,4,5],[1,2,3]];
    b =[[3,2,1],[2,4,6],[1,2,3]];
    c = a - b;
    printm(c);
    return 0;
}