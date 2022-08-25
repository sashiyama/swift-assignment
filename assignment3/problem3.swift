func isPrime(number: Int) -> Bool {
    if number < 2 {
        return false
    }

    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }

    return true
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

func findNextPrime(number: Int) -> Int {
    var nextPrime = number + 1

    while !isPrime(number: nextPrime) {
        nextPrime += 1
    }

    return nextPrime
}

func main() {
    let number = readInt("Please enter a number: ")
    guard let number = number else {
        return
    }

    print("The next prime number is \(findNextPrime(number: number))")
}

main()
