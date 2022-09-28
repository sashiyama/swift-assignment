protocol ViewDelegate: AnyObject {
    func render()
}

class Row {
    let cols: [String]

    init(cols: [String]) {
        self.cols = cols
    }
}

class Table: ViewDelegate {
    var rows: [Row]

    init(rows: [Row]) {
        self.rows = rows
    }

    func render() {
        print("All items (\(self.rows.count))")
        print("-------------------------")
        for row in rows {
            print(row.cols.joined(separator: ","))
            print("-------------------------")
        }
    }
}

class View {
    weak var delegate: ViewDelegate?

    func render() {
        guard let delegate = delegate else {
            print("No view.")
            return
        }

        delegate.render()
    }
}

class Student {
    let firstName: String
    let lastName: String
    let gpa: Int

    init(firstName: String, lastName: String, gpa: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.gpa = gpa
    }

    func toRow() -> Row {
        return Row(cols: ["\(self.firstName) \(self.lastName)", String(self.gpa)])
    }
}

func main() {
    let ali = Student(firstName: "Ali", lastName: "David", gpa: 80)
    let peter = Student(firstName: "Peter", lastName: "Jackson", gpa: 79)
    let donald = Student(firstName: "Donald", lastName: "Trump", gpa: 81)
    let william = Student(firstName: "William", lastName: "Chen", gpa: 76)
    let ana = Student(firstName: "Ana", lastName: "Leu", gpa: 82)

    let students = [ali, peter, donald, william, ana].map({ student in student.toRow() })
    let table = Table(rows: students)
    let view = View()
    view.delegate = table
    view.render()
}

main()
