class Search {
    var numbers: [Int]

    init() {
        self.numbers = []
    }

    func reset() {
        self.numbers = []
    }

    func randomFill() {
        for _ in 0..<10 {
            self.numbers.append(Int.random(in: 0...100))
        }
    }

    static func linearSearch(list: [Int], number: Int) -> Bool {
        for item in list {
            if item == number {
                return true
            }
        }

        return false
    }
}

func main() {
    let search = Search()
    search.randomFill()
    print(search.numbers)
    print(Search.linearSearch(list: search.numbers, number: 2))
}

main()
