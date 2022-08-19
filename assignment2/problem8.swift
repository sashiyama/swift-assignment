import Foundation

func divisibleNumbers(key: Int) -> [Int: [Int]] {
    var numbers: [Int: [Int]] = [:]

    for i in 2...9 {
        for j in i...key {
            if j % i == 0 {
                if numbers[i] == nil {
                    numbers[i] = []
                }

                numbers[i]!.append(j)
            }
        }
    }

    return numbers
}

func main() {
    print("Please enter a number which is greater than 50")
    let inputNum = readLine()

    guard let stringNum = inputNum else {
        return
    }

    guard let num = Int(stringNum) else {
        return
    }

    if num <= 50 {
        print("Error: You must enter a number which is greater than \"50\"")
        return
    }

    print(divisibleNumbers(key: num))
}

main()
