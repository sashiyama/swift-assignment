import Foundation

func printAForNTimes(n: Int) {
    for _ in 0..<n {
        print("A", terminator: "")
    }
}

func main() {
    print("Please enter a positive number")
    let inputN = readLine()

    guard let optionalN = inputN else {
        return
    }

    guard let n = Int(optionalN) else {
        return
    }

    printAForNTimes(n: n)
    print()
}

main()
