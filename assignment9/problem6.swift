struct Stack<Element: StringProtocol> {
    static func findFirst(list: [Element], begin: Int, end: Int, predicate: (Element, Element) -> Bool) -> Int? {
        for i in begin..<end {
            if predicate(list[i], list[i+1]) {
                return Int(list[i])
            }
        }

        return nil
    }
}

func gcd(_ m: Int, _ n: Int) -> Int {
    let r: Int = m % n
    if r != 0 {
        return gcd(n, r)
    } else {
        return n
    }
}

func main() {
    let result = Stack.findFirst(list: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"], begin: 2, end: 8, predicate: {
        (m, n) in
        guard let m = Int(m), let n = Int(n) else {
            return false
        }
        return gcd(m, n) == 1
    })

    print(result ?? "None")
}

main()
