func main() {
    // Definitions
    let func1: (Int, Int) -> Int = { a, b in a + b }
    let func2: (String) -> Void = { a in print(a) }
    let func3: () -> Int = { 10 }
    let func4: () -> [() -> Void] = { [{ print("Print func4") }] }
    let func5: ([(Int) -> Void]) -> [String] = { a in ["func5_1", "func5_2"] }
    let func6: ([(Int) -> Void]) -> [(Int) -> Void] = { a in a }
    let func7: ([(Int) -> Void]?) -> [(Int) -> Void]? = { a in a }
    let func8: ([(Int) -> Void]?) -> [(Int) -> Void]? = { a in a }
    let func9: () -> ((Int) -> Int, Int)? = { ({ a in a }, 1) }


    // Result
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
