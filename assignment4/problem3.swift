let calculation: [String: (Int, Int) -> Double] = [
    "sum": sum,
    "division": division,
    "difference": difference,
    "power": power,
    "multiplication": multiplication
]

func sum(a: Int, b: Int) -> Double {
    return Double(a + b)
}

func division(a: Int, b: Int) -> Double {
    if (b == 0) {
        return -1
    } else {
        return Double(a / b)
    }
}

func difference(a: Int, b: Int) -> Double {
    return Double(a - b)
}

func power(a: Int, b: Int) -> Double {
    var result = a

    for _ in 1..<b {
        result *= a
    }

    return Double(result)
}

func multiplication(a: Int, b: Int) -> Double {
    return Double(a * b)
}

func initOperations(numOfItem: Int) -> [String] {
    let operations = ["sum", "division", "difference", "power", "multiplication"]

    if numOfItem < 5 || 10 < numOfItem {
        return operations
    }

    var list: [String] = []

    for i in 0..<numOfItem {
        list.append(operations[i % 5])
    }

    return list
}

func calculator(_ a: Int, _ b: Int, _ ope: String) -> (Double, (Int, Int) -> Double)? {
    guard let calcFunc = calculation[ope] else {
        return nil
    }

    return (calcFunc(a, b), calcFunc)
}

func main() {
    let operations: [String] = initOperations(numOfItem: 5)
    for operation in operations {
        if let result = calculator(2, 3, operation) {
            print(result)
        }
    }
}

main()
