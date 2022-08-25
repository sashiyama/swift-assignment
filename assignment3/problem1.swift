func calculate(operand1: Int, operand2: Int, ope: String) -> Int {
    switch ope {
    case "+":
        return operand1 + operand2
    case "-":
        return operand1 - operand2
    case "*":
        return operand1 * operand2
    case "/":
        if operand1 == 0 || operand2 == 0 {
            return -1
        } else {
            return operand1 / operand2
        }
    default:
        return -1
    }
}

func readInt(_ msg: String) -> Int? {
    print(msg, terminator: "")
    let number = readLine()

    guard let number = number else {
        return nil
    }

    guard let number = Int(number) else {
        return nil
    }

    return number
}

func main() {
    let operand1 = readInt("Please enter a operand1: ")
    let operand2 = readInt("Please enter a operand2: ")
    print("Please enter a operator(+, -, *, /): ", terminator: "")
    let ope = readLine()

    guard let operand1 = operand1, let operand2 = operand2, let ope = ope else {
        return
    }

    print(calculate(operand1: operand1, operand2: operand2, ope: ope))
}

main()
