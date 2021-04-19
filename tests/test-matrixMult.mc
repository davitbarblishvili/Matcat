func main() int {
    matrix a; 
    matrix b; 
    matrix c; 

    a = [[1,2,3],[4,5,6],[7,8,9]];
    b = [[10,11,12],[13,14,15],[16,17,18]];

    c = a * b;
    printm(c);

    return 0;
}