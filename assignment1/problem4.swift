import Foundation

func main() {
    print("Please enter your first name")
    let firstName = readLine()

    print("Please enter your last name")
    let lastName = readLine()

    guard let firstName = firstName, let lastName = lastName else {
        return
    }

    print("Hi \(firstName) \(lastName), I hope you are doing well!")
}

main()
