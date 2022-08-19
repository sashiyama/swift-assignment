import Foundation

func isSubset(listA: [Int], listB: [Int]) -> Bool {
    let setA = Set(listA)
    let setB = Set(listB)
    return setA.isSubset(of: setB)
}

func main() {
    let list1 = [1, 2]
    let list2 = [2, 3, 4]
    let list3 = [3, 4]

    print("List1 is subset of List2?: \(isSubset(listA: list1, listB: list2))")
    print("List3 is subset of List2?: \(isSubset(listA: list3, listB: list2))")
}

main()
