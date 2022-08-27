func filter(numbers: [Int], predicates: [(Int) -> Bool]) -> [Int]? {
    var result: [Int] = []

    for number in numbers {
        var isAllTrue = true

        for predicate in predicates {
            if !predicate(number) {
                isAllTrue = false
            }
        }

        if isAllTrue {
            result.append(number)
        }
    }

    return result.isEmpty ? nil : result
}

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

func main() {
    let list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

    let predicate1: (Int) -> Bool = { a in a % 2 != 0 }
    let predicate2: (Int) -> Bool = isPrime
    let predicate3: (Int) -> Bool = { a in a % 2 != 0 && isPrime(number: a) }
    let predicate4: (Int) -> Bool = { a in a % 7 == 0 }

    let predicates = [predicate1, predicate2, predicate3, predicate4]

    guard let result = filter(numbers: list, predicates: predicates) else {
        return
    }

    print(result)
}

main()
