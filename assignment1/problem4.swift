import Foundation

func main() {
    print("Please enter your first name")
    let inputFirstName = readLine()

    print("Please enter your last name")
    let inputLastName = readLine()

    if let firstName = inputFirstName, let lastName = inputLastName {
        print("Hi \(firstName) \(lastName), I hope you are doing well!")
    }
}

main()
