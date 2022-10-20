class MyStudent {
    var firstName: String?
    var lastName: String?
    var id: Int = 1
    var address: String?

    init(_ firstName: String?, _ lastName: String?, _ id: Int, _ address: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
        self.address = address
    }

    subscript(index: Int) -> String? {
        get {
            switch index {
            case 0:
                return self.firstName
            case 1:
                return self.lastName
            case 2:
                return String(self.id)
            case 3:
                return self.address
            default:
                return nil
            }
        }

        set(newValue) {
            switch index {
            case 0:
                self.firstName = newValue
            case 1:
                self.lastName = newValue
            case 3:
                self.address = newValue
            default:
                return
            }
        }
    }
}

func main() {
    let st = MyStudent("Sara", "Jones", 5, "Vancouver")
    print(st[0] ?? "None") //prints the first name of st
    print(st[1] ?? "None") //prints the last name of st
    print(st[2] ?? "None") //prints the id of st
    print(st[3] ?? "None") //print the address of st

    st[0] = "Sarah" //change the first name to Sarah
    st[1] = "Peter" //change the last name to Peter
    //st[2] is readOnly and cannont change once assigned
    st[3] = "Surrey" //change the address to Surrey

    print(st[0] ?? "None") //prints the first name of st
    print(st[1] ?? "None") //prints the last name of st
    print(st[2] ?? "None") //prints the id of st
    print(st[3] ?? "None") //print the address of st
}

main()
