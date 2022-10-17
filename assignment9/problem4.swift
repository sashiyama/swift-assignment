struct SwappableList<Element> {
    var items: [Element]

    mutating func push(_ item: Element) {
        self.items.append(item)
    }

    mutating func pop() -> Element {
        return self.items.removeLast()
    }

    mutating func swap(from: Int, to: Int) {
        let tmp = self.items[from]
        self.items[from] = self.items[to]
        self.items[to] = tmp
    }

    static func swap(list: inout [Element], from: Int, to: Int) {
        let tmp = list[from]
        list[from] = list[to]
        list[to] = tmp
    }
}

func main() {
    var swappableList = SwappableList<Int>(items: [0, 1, 2, 3, 4, 5])
    print(swappableList.items)
    swappableList.swap(from: 2, to: 4)
    print(swappableList.items)

    var list = [0, 1, 2, 3, 4, 5]
    SwappableList.swap(list: &list, from: 1, to: 5)
    print(list)
}

main()
