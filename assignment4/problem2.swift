func fakeFunction1(a: Int, b: Int) -> Int {
    return a + b
}

func fakeFunction2(a: String) -> Void {
    print(a)
}

func fakeFunction3() -> Int {
    return 1
}

func fakeFunction4() -> [() -> Void] {
    return [{ print("Print func4") }]
}

func fakeFunction5(a: [(Int) -> Void]) -> [String]  {
    return ["func5_1", "func5_2"]
}

func fakeFunction6(a: [(Int) -> Void]) -> [(Int) -> Void] {
    return a
}

func fakeFunction7(a: [(Int) -> Void]?) -> [(Int) -> Void]? {
    return a
}

func fakeFunction8(a: [(Int) -> Void]?) -> [(Int) -> Void]? {
    return a
}

func fakeFunction9() -> ((Int) -> Int, Int)? {
    return ({ a in a }, 1)
}

func main() {
    let func1: (Int, Int) -> Int
    func1 = fakeFunction1

    let func2: (String) -> Void
    func2 = fakeFunction2

    let func3: () -> Int
    func3 = fakeFunction3

    let func4: () -> [() -> Void]
    func4 = fakeFunction4

    let func5: ([(Int) -> Void]) -> [String]
    func5 = fakeFunction5

    let func6: ([(Int) -> Void]) -> [(Int) -> Void]
    func6 = fakeFunction6


    let func7: ([(Int) -> Void]?) -> [(Int) -> Void]?
    func7 = fakeFunction7

    let func8: ([(Int) -> Void]?) -> [(Int) -> Void]?
    func8 = fakeFunction8

    let func9: () -> ((Int) -> Int, Int)?
    func9 = fakeFunction9

    print(func1(1, 2))
    func2("Print func2")
    print(func3())
    print(func4())
    print(func5([{ a in print(a) }]))
    print(func6([{ a in print(a) }]))

    guard let func7ReturnValue = func7([{ a in print(a) }]) else {
        return
    }
    print(func7ReturnValue)

    guard let func8ReturnValue = func8([{ a in print(a) }]) else {
        return
    }
    print(func8ReturnValue)

    guard let func9ReturnValue = func9() else {
        return
    }
    print(func9ReturnValue)
}

main()
