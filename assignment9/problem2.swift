struct Stack<Element> {
    var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

class StackHandler<Element> {
    var stack: Stack<Element> = Stack()
    let list: [Element]

    init(list: [Element]) {
        self.list = list
    }

    func addStack(_ num: Int) -> Stack<Element> {
        if self.list.count < num {
            return self.stack
        }

        for i in 0..<num {
            self.stack.push(list[i])
        }

        return self.stack
    }
}

func main() {
    let list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let handler = StackHandler(list: list)
    let stack = handler.addStack(5)
    print(stack.items)
}

main()
