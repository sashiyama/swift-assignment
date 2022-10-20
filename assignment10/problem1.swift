class EductionPortal{
    //student numbers -> list of grades
    var marks:[String:[Int]]=["781214":[72,63,70], "341234":[80,46]]
    //student Ids -> numbers
    var ids:[Int:String]=[1:"781214", 2:"341234", 3:"568912"]
    //student numbers -> names
    var names:[String:String]=["781214":"Ali", "341234":"Peter", "568912":"Sam"]
    //complete the code using subscripts (only use subscripts as much as possible)

    subscript(studentID: Int, numOfGrades: Int) -> Double? {
        guard let studentNumber = self.ids[studentID] else {
            return nil
        }
        guard let grades = marks[studentNumber] else {
            return nil
        }
        var total = 0
        for i in 0..<numOfGrades {
            total += grades[i]
        }
        return Double(total) / Double(numOfGrades)
    }

    subscript(studentNumber: String) -> String? {
        return self.names[studentNumber]
    }

    subscript(studentID: Int) -> String? {
        return self.ids[studentID]
    }
}

func main() {
    let ep = EductionPortal()
    let st1Avg = ep[1, 3]
    let studentName = ep["781214"]
    let studentNumber = ep[2]

    print(st1Avg ?? "None")
    print(studentName ?? "None")
    print(studentNumber ?? "None")
}

main()
