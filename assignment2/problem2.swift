import Foundation

func isPartiallySorted(list: [Int]) -> Bool {
    var result = false

    for (index, _) in list.enumerated() {
        var newList = list
        newList.remove(at: index)
        if newList == newList.sorted() {
            result = true
            break
        }
    }

    return result
}

func main() {
    let partiallySortedList = [1, 2, 5, 10, 6, 8, 9]
    let notPartiallySortedList = [3, 2, 4, 20, 10, 5]
    print("PartiallySortedList: \(isPartiallySorted(list: partiallySortedList))")
    print("NotPartiallySortedList: \(isPartiallySorted(list: notPartiallySortedList))")
}

main()
