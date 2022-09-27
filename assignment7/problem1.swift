protocol SomeProtocol1 {
    var property1: Int { get }
    var property2: String { get set }
    var property3: (() -> Int)? { get }
    static var property4: String? { get set }
    static func method1(arg param: Int)
    func method2(arg param: Int) -> Int?
    mutating func method3() -> String?
}

class Class1: SomeProtocol1 {
    var property1: Int {
        return 0
    }

    var property2: String = ""

    var property3: (() -> Int)? {
        return { 3 }
    }

    static var property4: String? = ""

    static func method1(arg param: Int) {
        print(param)
    }

    func method2(arg param: Int) -> Int? {
        return 10 + param > 15 ? param : nil
    }

    func method3() -> String? {
        self.property2 = "Hello method3"
        return self.property2
    }
}

struct Struct1: SomeProtocol1 {
    var property1: Int

    var property2: String

    var property3: (() -> Int)?

    static var property4: String?

    static func method1(arg param: Int) {
        print(param)
    }

    func method2(arg param: Int) -> Int? {
        return 10 + param > 15 ? param : nil
    }

    func method3() -> String? {
        return "Hello struct method3"
    }
}

enum Enum1: SomeProtocol1 {
    var property1: Int {
        return 1
    }

    var property2: String {
        get {
            return "property2"
        }
        set {}
    }

    var property3: (() -> Int)? {
        return { 3 }
    }

    static var property4: String?

    static func method1(arg param: Int) {
        print(param)
    }

    func method2(arg param: Int) -> Int? {
        return 10 + param > 15 ? param : nil
    }

    mutating func method3() -> String? {
        return "Hello enum method3"
    }
}
