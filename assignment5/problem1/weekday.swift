import Foundation

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

enum WeekDay: String {
    case sun, mon, tue, wed, thu, fri, sta

    static func toWeekDay(date: Date) -> WeekDay? {
        // Zeller's congruence
        let weekDay = (date.day + Int(round(26.0 * (Double(date.month) + 1.0) / 10)) + date.year + Int(round(Double(date.year) / 4)) - 2 * Int(round(Double(date.year) / 100)) + Int(round(Double(date.year) / 400))) % 7

        switch weekDay {
        case 0:
            return .sta
        case 1:
            return .sun
        case 2:
            return .mon
        case 3:
            return .tue
        case 4:
            return .wed
        case 5:
            return .thu
        case 6:
            return .fri
        default:
            return nil
        }
    }
}

func main() {
    let date = Date(day: 23, month: 10, year: 1993)
    guard let weekDay = WeekDay.toWeekDay(date: date) else {
        return
    }
    print(weekDay)
}

main()
