import Foundation

func findNotRepeatedNumber(list: [Int]) -> Int {
    if list.isEmpty {
        return -1
    }

    var dict: [Int: Int] = [:]

    for item in list {
        dict[item] = dict[item] == nil ? 1 : nil
    }

    return [Int](dict.keys)[0]
}

func main() {
    let sampleList = [1, 1, 3, 3, 2, 2, 9, 9, 5, 6, 7, 7, 6]
    print(findNotRepeatedNumber(list: sampleList))
}

main()
