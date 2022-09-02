enum Calculator {
    case sum(Int, Int)
    case sub(Int, Int)
    case multi(Int, Int)
    case div(Int, Int)

    static func calculate(opt: Calculator) -> Int {
        switch opt {
        case let .sum(num1, num2):
            return num1 + num2
        case let.sub(num1, num2):
            return num1 - num2
        case let .multi(num1, num2):
            return num1 * num2
        case let .div(num1, num2):
            if num2 == 0 {
                return -1
            }

            return num1 / num2
        }
    }
}

func main() {
    let sum: Calculator = .sum(2, 3)
    let sub: Calculator = .sub(5, 2)
    let multi: Calculator = .multi(6, 2)
    let div: Calculator = .div(9, 3)

    print(Calculator.calculate(opt: sum))
    print(Calculator.calculate(opt: sub))
    print(Calculator.calculate(opt: multi))
    print(Calculator.calculate(opt: div))
}

main()
