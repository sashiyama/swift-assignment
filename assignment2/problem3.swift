import Foundation

func collectWords() -> [String] {
    var list: [String] = []

    print("Please enter a word")
    var word = readLine()

    while word != nil && !word!.isEmpty {
        if !list.contains(word!) {
            list.append(word!)
        }

        print("Please enter a word")
        word = readLine()
    }

    return list
}

func main() {
    print(collectWords())
}

main()
