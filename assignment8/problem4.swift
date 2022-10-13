import Foundation

enum StringError: Error {
    case InvalidStringFormatForIntConversionError
    case InvalidEmailFormatError
    case NotValidPassword(numberNeeded: Int)
}

extension String {
    private static let MIN_PASSWORD_LENGTH = 8

    func toInt() throws -> Int {
        guard let i = Int(self) else {
            throw StringError.InvalidStringFormatForIntConversionError
        }
        return i
    }

    func isValidEmail() throws -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        let isValid = emailValidationPredicate.evaluate(with: self)

        if isValid {
            return isValid
        } else {
            throw StringError.InvalidEmailFormatError
        }
    }

    func isValidPassword() throws -> Bool {
        let numberNeeded = String.MIN_PASSWORD_LENGTH - self.count

        if numberNeeded <= 0 {
            return true
        } else {
            throw StringError.NotValidPassword(numberNeeded: numberNeeded)
        }
    }
}

class TextExtension {
    static func convertStringToInt(word: String) -> Int? {
        do {
            let i = try word.toInt()
            return i
        } catch StringError.InvalidStringFormatForIntConversionError {
            return nil
        } catch {
            return nil
        }
    }

    static func isItAnEmail(word: String) -> Bool {
        do {
            let isValid = try word.isValidEmail()
            return isValid
        } catch StringError.InvalidEmailFormatError {
            return false
        } catch {
            return false
        }
    }

    static func validatePassword(password: String) -> Bool {
        do {
            let isValid = try password.isValidPassword()
            return isValid
        } catch StringError.NotValidPassword(numberNeeded: let numberNeeded) {
            print("Enter your password more \(numberNeeded) characters")
            return false
        } catch {
            print("Enter your password at least 8 characters")
            return false
        }
    }
}

func main() {
    print(TextExtension.convertStringToInt(word: "123") ?? "Error!")
    print(TextExtension.convertStringToInt(word: "Yoshi") ?? "Error!")
    print(TextExtension.isItAnEmail(word: "test@example.com"))
    print(TextExtension.isItAnEmail(word: "fweoifwei"))
    print(TextExtension.validatePassword(password: "12345678"))
    print(TextExtension.validatePassword(password: "12"))
}

main()
