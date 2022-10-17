class ListHandler<Element: Comparable> {
    var list: [Element]

    init(list: [Element]) {
        self.list = list
    }

    func addItemToList(_ item: Element) {
        self.list.append(item)
    }

    func removeItemFromTheList(_ item: Element) {
        self.list = self.list.filter({ i in i != item })
    }

    func performOperation(predicate: (Element) -> Bool) -> [Element]? {
        let result = self.list.filter(predicate)
        if 0 < result.count {
            return result
        } else {
            return nil
        }
    }
}

func main() {
    let handler = ListHandler(list: [0, 1, 2, 3, 4, 5])
    handler.removeItemFromTheList(4)
    print(handler.list)
    print(handler.performOperation(predicate: { i in i == 6 }) ?? "None")
}

main()
