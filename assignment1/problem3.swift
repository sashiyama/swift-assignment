import Foundation

func printAForNTimes(n: Int) {
    for _ in 0..<n {
        print("A", terminator: "")
    }
}

func main() {
    print("Please enter a positive number")
    let inputN = readLine()

    if let optionalN = inputN {
        if let n = Int(optionalN) {
            printAForNTimes(n: n)
            print()
        }
    }
}

main()
