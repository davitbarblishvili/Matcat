// Author: Davit
func main() int{
    matrix m;
    matrix c;
    matrix t;
    double d;
    matrix rhs;
    matrix lhs;
    double dp;
    matrix p;

    m = [[1,2,-1],[-2,0,1],[1,-1,0]];
    rhs = [[1,2,3,4]];
    lhs = [[2,5,7,5]];
    printStr("matrix m:");
    printm(m);
    printStr("");
    printStr("===========================");

    //invertible
    isInv(m);

    c=inv(m);
    printStr("inverse of m is c:");
    printm(c);

    printStr("");
    printStr("===========================");

    t=transpose(m);
    printStr("transpose of m is t:");
    printm(t);

    printStr("");
    printStr("===========================");

    d=det(m);
    printStr("determinant of m is");
    printd(d);

    printStr("");
    printStr("===========================");

    
    dp=rhs dot lhs;
    printStr("dot product of");
    printm(rhs);
    printStr("and");
    printm(lhs);
    printd(dp);

    printStr("");
    printStr("===========================");

    p=m^5;
    printStr("m in power 5 is:");
    printm(p);

    printStr("");
    printStr("===========================");

    rotate90(m);
    printStr("m rotated by 90 is:");
    printm(m);
   
    


    return 0;
});
    printm(m);
   
    


    return 0;
}