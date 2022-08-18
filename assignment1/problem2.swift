import Foundation

func f(x1: Double, x2: Double, x3: Double, x4: Double) -> Double {
    return max(x1, x2, x3, x4) - min(x1, x2, x3, x4) + pow(x1, x2) + abs(x3 - x4)
}

func main() {
    print("Please enter X1")
    let inputX1 = readLine()

    print("Please enter X2")
    let inputX2 = readLine()

    print("Please enter X3")
    let inputX3 = readLine()

    print("Please enter X4")
    let inputX4 = readLine()

    if let stringX1 = inputX1, let stringX2 = inputX2, let stringX3 = inputX3, let stringX4 = inputX4 {
        let optionalX1 = Double(stringX1)
        let optionalX2 = Double(stringX2)
        let optionalX3 = Double(stringX3)
        let optionalX4 = Double(stringX4)

        if let x1 = optionalX1, let x2 = optionalX2, let x3 = optionalX3, let x4 = optionalX4 {
            print("Result: \(f(x1: x1, x2: x2, x3: x3, x4: x4))")
        }
    }
}

main()
