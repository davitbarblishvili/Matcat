func foo(int n) int {
    if (n == 1) {
        return 0;
    }
    return bar(n - 1);
}

func bar(int n) int {
    if (n == 1) {
        return 0;
    }
    return foo(n - 1);
}

func main() int {
    print(foo(5));
    return 0;
}
