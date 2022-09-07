class Student {
    let name: String
    var scores: [Int] = []

    init(name: String) {
        self.name = name
    }

    var average: Double {
        var total = 0
        for score in scores {
            total += score
        }
        return Double(total) / Double(scores.count)
    }

    static func findTopRanker(students: [Student]) -> Student? {
        if students.isEmpty {
            return nil
        }

        var topScore = students[0].average
        var topStudent = students[0]

        for student in students {
            if topScore < student.average {
                topScore = student.average
                topStudent = student
            }
        }

        return topStudent
    }
}

func main() {
    let student1 = Student(name: "Paul Cox")
    let student2 = Student(name: "Luisa Patterson")
    let student3 = Student(name: "Johnny Ward")

    student1.scores.append(80)
    student1.scores.append(45)
    student1.scores.append(92)

    student2.scores.append(73)
    student2.scores.append(76)
    student2.scores.append(38)

    student3.scores.append(23)
    student3.scores.append(12)
    student3.scores.append(24)

    guard let topRanker = Student.findTopRanker(students: [student1, student2, student3]) else {
        return
    }

    print("The top rank student is \(topRanker.name). H(is/er) average score is \(topRanker.average)")
}

main()
