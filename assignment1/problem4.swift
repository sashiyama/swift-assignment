import Foundation

func main() {
    print("Please enter your first name")
    let inputFirstName = readLine()

    print("Please enter your last name")
    let inputLastName = readLine()

    guard let firstName = inputFirstName, let lastName = inputLastName else {
        return
    }

    print("Hi \(firstName) \(lastName), I hope you are doing well!")
}

main()
