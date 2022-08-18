import Foundation

func f(x: Decimal, y: Decimal) -> Decimal {
    return x * y + pow(y, 2) + abs(x - y)
}

func findA(x: Decimal, y: Decimal) -> Decimal {
    return pow(x, 2) + pow(y, 3) - 5
}

func main() {
    print("Please enter X number")
    let inputX = readLine()

    print("Please enter Y number")
    let inputY = readLine()

    if let stringX = inputX, let stringY = inputY {
        if let x = Decimal(string: stringX), let y = Decimal(string: stringY) {
            print("F(X, Y): \(f(x: x, y: y))")
            print("A: \(findA(x: x, y: y))")
        }
    }
}

main()
