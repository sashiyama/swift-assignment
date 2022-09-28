protocol SpecialStringProtocol {
    //it checks whether a given condition is met on the current string
    func verifiableStringForACondition( _ conditionPredicate: (String) -> Bool) -> Bool
    /*it checks whether the string is a double repeated string. For instance abab is a double
     repeated because the ab is repeated 2 times. Or AliAli is also double repeated.*/
    func repeatedString()-> Bool
}

extension String: SpecialStringProtocol {
    func verifiableStringForACondition(_ conditionPredicate: (String) -> Bool) -> Bool {
        return conditionPredicate(self)
    }

    func repeatedString() -> Bool {
        if self.count % 2 != 0 {
            return false
        }

        let numOfWord = self.count / 2
        return self.prefix(numOfWord) == self.suffix(numOfWord)
    }
}

func main() {
    print("Hello".verifiableStringForACondition({ s in s == "Hello" }))
    print("Bye".verifiableStringForACondition({ s in s == "Hello" }))
    print("abab".repeatedString())
    print("AliAli".repeatedString())
    print("ababcccc".repeatedString())
}


main()
