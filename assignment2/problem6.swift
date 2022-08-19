import Foundation

func readNumber() -> Int? {
    let inputNumber = readLine()

    guard let stringNumber = inputNumber else {
        return nil
    }

    guard let number = Int(stringNumber) else {
        return nil
    }

    return number
}

func sum(list: [Int]) -> Int {
    var sum = 0

    for i in list {
        sum += i
    }

    return sum
}

func sumInputNumbers() -> Int {
    var list: [Int] = []

    print("Please enter a number")
    guard var number = readNumber() else {
        return sum(list: list)
    }

    while number != 0 {
        if !list.contains(number) {
            list.append(number)
        } else {
            print("Error: enter a unique number")
        }

        print("Please enter a number")
        guard let tmp = readNumber() else {
            return sum(list: list)
        }
        number = tmp
    }

    return sum(list: list)
}

func main() {
    print("Sum: \(sumInputNumbers())")
}

main()
