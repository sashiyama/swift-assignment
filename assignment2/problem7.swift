import Foundation

func getInitDict() -> [String: [String]] {
    var dict: [String: [String]] = [:]
    for i in 65...90 {
        dict[String(UnicodeScalar(UInt8(i)))] = []
    }
    return dict
}

func collectWordsInDictionary() -> [String: [String]] {
    var result: [String: [String]] = getInitDict()

    print("Please enter a word")
    var word = readLine()

    while word != nil && word! != "exit" {
        let firstLetter = String(word!.prefix(1)).uppercased()
        if result[firstLetter] != nil && !result[firstLetter]!.contains(word!){
            result[firstLetter]!.append(word!)
        }

        print("Please enter a word")
        word = readLine()
    }

    return result
}

func main() {
    print(collectWordsInDictionary())
}

main()
