import Foundation

extension String {
    var numberOfDigits: Int {
        return self.count
    }

    var uppercase: String {
        return self.uppercased()
    }

    func isPalindrome() -> Bool {
        return self == reverseIt()
    }

    func reverseIt() -> String {
        return String(self.reversed())
    }
}

func main() {
    let k = "kayak"
    print(k.numberOfDigits)
    print(k.uppercase)
    print(k.isPalindrome())
    print(k.reverseIt())
}

main()
