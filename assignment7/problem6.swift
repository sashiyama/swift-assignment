protocol Protocol1 {
    var property1: Int? { get }
}

protocol Protocol2 {
    var property2: String { get }
}

protocol Protocol3 {
    var property3: (Int?) -> String { get }
}

class Element: Protocol1, Protocol2, Protocol3 {
    var property1: Int? {
        return 1
    }

    var property2: String {
        return "property2"
    }

    var property3: (Int?) -> String {
        return { i in i != nil ? String(i!) : "Input some integer" }
    }
}

func main() {
    let list1 = [Element()]
    let dic1: [String:Protocol1 & Protocol2 & Protocol3] = ["element": Element()]

    print(list1[0].property1!)
    print(list1[0].property2)
    print(list1[0].property3(3))

    print(dic1["element"]!.property1!)
    print(dic1["element"]!.property2)
    print(dic1["element"]!.property3(3))
}

main()
