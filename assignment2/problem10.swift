import Foundation

func combineLists(list1: [Int], list2: [Int], list3: [Int]) -> [Int] {
    let set1 = Set(list1)
    let set2 = Set(list2)
    let set3 = Set(list3)

    return Array(set1.union(set2).union(set3))
}

func main() {
    let list1 = [1,2,3,4,2,3]
    let list2 = [3,4,6,7]
    let list3 = [-1,0,23,4]

    print(combineLists(list1: list1, list2: list2, list3: list3))
}

main()
