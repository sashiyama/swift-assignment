struct Date {
    let day: Int
    let month: Int
    let year: Int

    static func toDate(number: Int) -> Date? {
        if number < 1 || 365 < number {
            return nil
        }

        let year = number / 365
        let month = (number % 365) / 30
        let day = (number % 365) % 30

        return Date(day: day, month: month, year: year)
    }

    func printInDetail() {
        print("day: \(day), month: \(month), year: \(year)")
    }
}

func main() {
    let date1 = Date.toDate(number: 365)
    date1?.printInDetail()

    let date2 = Date.toDate(number: 65)
    date2?.printInDetail()

    let date3 = Date.toDate(number: 1)
    date3?.printInDetail()
}

main()
