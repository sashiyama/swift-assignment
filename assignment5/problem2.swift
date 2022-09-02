enum PointChar: String {
    case x, y
}

struct Point {
    var x: Int
    var y: Int

    mutating func reset() {
        self.x = 0
        self.y = 0
    }

    func printPoint(point: Point) {
        print("the point is at coordinate [\(point.x), \(point.y)] where \(point.x) and \(point.y) are the x and y coordination of the input point.")
    }

    static func average(points: [Point], pointChar: PointChar) -> Int? {
        var sum = 0

        switch pointChar {
        case .x:
            for point in points {
                sum += point.x
            }
        case .y:
            for point in points {
                sum += point.y
            }
        }

        return sum / points.count
    }

    static func vectorAverage(points: [Point]) -> Point? {
        guard let x = average(points: points, pointChar: .x) else {
            return nil
        }

        guard let y = average(points: points, pointChar: .y) else {
            return nil
        }

        return Point(x: x, y: y)
    }
}

func main() {
    let point = Point(x: 0, y: 0)

    let point1 = Point(x: -1, y: 1)
    let point2 = Point(x: 2, y: 5)
    let point3 = Point(x: 0, y: 15)
    let point4 = Point(x: 12, y: 3)
    let point5 = Point(x: -3, y: -7)

    let points = [point1, point2, point3, point4, point5]

    guard let avePoint = Point.vectorAverage(points: points) else {
        return
    }

    point.printPoint(point: avePoint)
}

main()
