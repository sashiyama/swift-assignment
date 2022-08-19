import Foundation

func isSortedList(list: [String]) -> Bool {
    return list == list.sorted()
}

func main() {
    let notSortedList = ["Lemon", "Banana", "Apple", "Grape", "Orange"]
    let sortedList = notSortedList.sorted()
    print("Not sorted: \(isSortedList(list: notSortedList))")
    print("Sorted: \(isSortedList(list: sortedList))")
}

main()
