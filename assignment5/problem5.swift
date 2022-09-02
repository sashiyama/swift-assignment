struct Student {
    static let firstNames = [
        "Corner",
        "Peter",
        "Hunter",
        "Paul",
        "Johnny",
        "Shane",
        "Nicole",
        "Luna",
        "Luisa"
    ]

    static let lastNames = [
        "Butler",
        "Simmons",
        "Patterson",
        "Ward",
        "Bell",
        "Cox",
        "Evans",
        "Gomez"
    ]

    static let addresses = [
        "Vancouver",
        "Richmond",
        "Surrey",
        "Burnaby",
        "North Vancouver",
    ]

    let firstName: String
    let lastName: String
    let address: String
    let yearOfBirth: Int
    let gpa: Double

    static func printStudent(student: Student) {
        print("Name: \(student.firstName) \(student.lastName)\nAddress: \(student.address)\nYear of birth: \(student.yearOfBirth)\nGPA: \(student.gpa)")
    }
}

class Classroom {
    var students: [Student] = []

    func generateList() {
        for _ in 0..<10 {
            self.students.append(
                Student(
                    firstName: Student.firstNames[Int.random(in: 0..<Student.firstNames.count)],
                    lastName: Student.lastNames[Int.random(in: 0..<Student.lastNames.count)],
                    address: Student.addresses[Int.random(in: 0..<Student.addresses.count)],
                    yearOfBirth: Int.random(in: 1990...2010),
                    gpa: Double.random(in: 0...5)))
        }
    }

    func getHighestGpa() -> Student? {
        if self .students.isEmpty {
            return nil
        }

        var highestGpa = self.students[0].gpa
        var highestGpaStudent = self.students[0]

        for student in self.students {
            if highestGpa < student.gpa {
                highestGpa = student.gpa
                highestGpaStudent = student
            }
        }

        Student.printStudent(student: highestGpaStudent)

        return highestGpaStudent
    }
}

func main() {
    let classroom = Classroom()
    classroom.generateList()
    let _ = classroom.getHighestGpa()
}

main()
