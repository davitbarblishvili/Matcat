// Author: Davit
func main() int {
    int test; 
    matrix a = [[1,2,3],[2,4,5],[3,5,6]];
    matrix b; 

    test = check_symmetry(a); 
    if(test == 1){
        printStr("The matrix is symmetric");
        printStr("Here is the original matrix:"); 
        printm(a); 
        printStr("");
        printStr("Here is the transposed matrix:"); 
        b = transpose(a);
        printm(b);
        
    }else{
        printStr("The matrix is not symmetric");
    }
}