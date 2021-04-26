// Authors: Davit, James
func main() int
{

    bool b1; 
    bool b2; 
    bool r; 
    int a;
    int b;
    bool geq; 
    bool neq; 
    bool lt;  
    

    b1 = false;
    b2 = true;
    neq = b1 != b2;
    printb(neq); // 1
    a = 1;
    b = 0;
    geq = a >= b;
    lt = a < b;

    printb(geq); // 1
    printb(lt); // 0

    return 0;
}
