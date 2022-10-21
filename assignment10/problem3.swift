// Fibo: 0, 1, 1, 2, 3, 5, 8, 13
// fibo(0) = 0
// fibo(1) = 1
// fibo(2) = 1 + 0
// fibo(3) = fibo(2) + fibo(1) = 2

// fibo(n) = 0 (n == 0)
// fibo(n) = 1 (n == 1)
// fibo(n) = fibo(n - 1) + fibo(n - 2) (n > 1)

class Fibonacci {
    subscript(n: Int) -> Int {
        return Fibonacci.fibo(n)
    }

    static subscript(n: Int) -> Int {
        return fibo(n)
    }

    static func fibo(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }

        return fibo(n - 1) + fibo(n - 2)
    }
}

func main() {
    let fibo = Fibonacci()
    print(fibo[5])
    let fibo1 = Fibonacci[5]
    print(fibo1)
}

main()
