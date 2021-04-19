func foo(int x) int {
    int x;
    x = 2; // this is an issue
    return x; 
}


func main() int {

    print(foo(5));

    return 0;
}
