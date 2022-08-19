import Foundation

func addTwoEquations(e1: [[Int]], e2: [[Int]]) -> [[Int]] {
    var result: [[Int]] = [Array(repeating: 0, count: 10), Array(repeating: 0, count: 10), Array(repeating: 0, count: 1)]

    for i in 0...9 {
        result[0][i] = e1[0][i] + e2[0][i]
        result[1][i] = e1[1][i] + e2[1][i]
    }

    result[2][0] = e1[2][0] + e2[2][0]

    return result
}

func main() {
    // e1 = X^4+ 5X^2 + Y^3+Y^2+1, e2 = 5X^10 + 4X^4 + 2X^3 - 7X^2 + 2Y^3 - 15
    let e1 = [[0, 5, 0, 1, 0, 0, 0, 0, 0, 0], [0, 1, 1, 0, 0, 0, 0, 0, 0, 0], [1]]
    let e2 = [[0, -7, 2, 4, 0, 0, 0, 0, 0, 5], [0, 0, 2, 0, 0, 0, 0, 0, 0, 0], [-15]]

    print(addTwoEquations(e1: e1, e2: e2))
}

main()
