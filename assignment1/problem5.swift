import Foundation

func findMaxDistance(n1: Int, n2: Int, n3: Int) -> Int {
    return abs(max(n1, n2, n3) - min(n1, n2, n3))
}

func main() {
    print("Please enter number1")
    let inputNumber1 = readLine()

    print("Please enter number2")
    let inputNumber2 = readLine()

    print("Please enter number3")
    let inputNumber3 = readLine()

    guard let stringN1 = inputNumber1, let stringN2 = inputNumber2, let stringN3 = inputNumber3 else {
        return
    }

    guard let n1 = Int(stringN1), let n2 = Int(stringN2), let n3 = Int(stringN3) else {
        return
    }

    print("Max: \(findMaxDistance(n1: n1, n2: n2, n3: n3))")
}

main()
