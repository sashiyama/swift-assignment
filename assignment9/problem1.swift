import Foundation

class Counter {
    static func countNumberOfElementsWithSpecificProperty<U>(_ list: [U], _ predicate: (U) -> Bool) -> Int {
        var total = 0

        for item in list {
            if (predicate(item)) {
                total += 1
            }
        }

        return total
    }
}

enum BookCategory {
    case SciFi, Mistery, Fantasy, Philosohy, Bussiness, Fiction, Horror
}

class Book {
    let title: String
    let pages: Int
    let category: BookCategory

    init(title: String, pages: Int, category: BookCategory) {
        self.title = title
        self.pages = pages
        self.category = category
    }
}

func main() {
    let book1 = Book(title: "Hole", pages: 213, category: .Fiction)
    let book2 = Book(title: "FAIRY TAIL", pages: 360, category: .Horror)
    let book3 = Book(title: "MAD HONEY", pages: 123, category: .Mistery)
    let books = [book1, book2, book3]

    print(Counter.countNumberOfElementsWithSpecificProperty(books, { book in book.pages > 200 } ))
}

main()
