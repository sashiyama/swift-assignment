class MyNotification {
    var seen: Bool = false
    var totalSeen: Int = 0
    lazy var myObserver: MyObserver = MyObserver()

    func searchIt(numbers: [Int], predicate: (Int) -> Bool) {
        for number in numbers {
            if predicate(number) {
                myObserver.isHold = true
                myObserver.item = number
            }
        }
        myObserver.printResult()
    }

    func fillIt(size: Int) -> [Int] {
        var numbers: [Int] = []

        for _ in 0..<size {
            numbers.append(Int.random(in: 1...100))
        }

        return numbers
    }
}

class MyObserver {
    var isHold: Bool = false {
        didSet {
            numberOfHolds += 1
        }
    }
    var item: Int = 0 {
        didSet {
            total += item
        }
    }

    var numberOfHolds: Int = 0
    var total: Int = 0

    func printResult() {
        print("number of holds: \(numberOfHolds), total: \(total)")
    }
}

func main() {
    let myNotification = MyNotification()
    let predicate1: (Int) -> Bool = { n in n % 3 == 0 }
    let predicate2: (Int) -> Bool = { n in n % 2 == 0 }
    myNotification.searchIt(numbers: myNotification.fillIt(size: 10), predicate: predicate1)
    myNotification.searchIt(numbers: myNotification.fillIt(size: 10), predicate: predicate2)
}

main()
