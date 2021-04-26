// Author: James
func main() int {
    matrix m; 
    m = [[1,2,3]];
    
    int i = 0;
    while(i < 3) {
        i = i+1;
        m = m[0,:];    
        printm(m);
    }


    return 0;
}