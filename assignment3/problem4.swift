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

func printShape(number: Int, shape: String) {
    switch shape {
    case "SHAPE1":
        printShape1(number: number)
    case "SHAPE2":
        printShape2(number: number)
    case "SHAPE3":
        printShape3(number: number)
    default:
        print("Invalid a shape code.")
    }
}

func printShape1(number: Int) {
    var blanks = 0

    for i in stride(from: number, to: 0, by: -2) {
        for _ in 0...blanks {
            print(" ", terminator: "")
        }
        for _ in 0..<i {
            print("*", terminator: "")
        }
        print()
        blanks += 1
    }
}

func printShape2(number: Int) {
    for i in stride(from: number, to: 0, by: -1) {
        for _ in 0..<i {
            print("*", terminator: "")
        }
        print()
    }
}

func printShape3(number: Int) {
    for i in stride(from: 1, to: number + 1, by: 1) {
        for _ in 0..<i {
            print("*", terminator: "")
        }
        print()
    }
}

func main() {
    let number = readInt("Please enter a number: ")
    print("Please enter a shape(SHAPE1, SHAPE2, SHAPE3): ", terminator: "")
    let shape = readLine()

    guard let number = number, let shape = shape else {
        return
    }

    printShape(number: number, shape: shape)
}

main()
