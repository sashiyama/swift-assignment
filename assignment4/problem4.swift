func sorter(words: [String], comparator: (String, String) -> Bool) -> [String] {
    return words.sorted(by: comparator)
}

func main() {
    let list1 = ["one", "two", "three", "four", "five"]
    print("Alphabetically Ascendingly: \(sorter(words: list1, comparator: { a, b in a <= b } ))")
    print("Alphabetically Descendingly: \(sorter(words: list1, comparator: { a, b in a > b } ))")

    let list2 = ["aa", "aba", "b", "aabbb"]
    print("Descending based on the length of the items: \(sorter(words: list2, comparator: { a, b in a.count > b.count } ))")
}

main()
