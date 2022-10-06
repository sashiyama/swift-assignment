import Foundation

class Shape {
    var width: Int
    var height: Int
    var area: Double = 0
    var circumference: Double = 0

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    internal func setAreaAndCircumference(side: Int, anotherSide: Int) {}
}

class Rectangle: Shape {
    override var width: Int {
        didSet {
            setAreaAndCircumference(side: self.width, anotherSide: self.height)
        }
    }

    override var height: Int {
        didSet {
            setAreaAndCircumference(side: self.width, anotherSide: self.height)
        }
    }

    override init(width: Int, height: Int) {
        super.init(width: width, height: height)
        setAreaAndCircumference(side: width, anotherSide: height)
    }

    override func setAreaAndCircumference(side: Int, anotherSide: Int) {
        self.area = Double(side * anotherSide)
        self.circumference = Double((side * 2) + (anotherSide * 2))
    }
}

class Square: Shape {
    override var width: Int {
        didSet {
            setAreaAndCircumference(side: self.width, anotherSide: self.width)
            self.height = self.width
        }
    }

    override var height: Int {
        didSet {
            setAreaAndCircumference(side: self.height, anotherSide: self.height)
            self.width = self.height
        }
    }

    convenience init(width: Int) {
        self.init(width: width, height: width)
        setAreaAndCircumference(side: width, anotherSide: width)
    }

    override func setAreaAndCircumference(side: Int, anotherSide: Int) {
        self.area = Double(side * anotherSide)
        self.circumference = Double(side * 4)
    }
}

class Circle: Shape {
    private static let PI = 3.14

    override var width: Int {
        didSet {
            setAreaAndCircumference(side: self.width, anotherSide: self.width)
            self.height = self.width
        }
    }

    override var height: Int {
        didSet {
            setAreaAndCircumference(side: self.height, anotherSide: self.height)
            self.width = self.height
        }
    }

    convenience init(width: Int) {
        self.init(width: width, height: width)
        setAreaAndCircumference(side: width, anotherSide: width)
    }

    override func setAreaAndCircumference(side: Int, anotherSide: Int) {
        self.area = Double((side / 2) * (anotherSide / 2)) * Circle.PI
        self.circumference = Double(side) * Circle.PI
    }
}

func main() {
    let rectangle = Rectangle(width: 10, height: 5)
    let square = Square(width: 5)
    let circle = Circle(width: 2)

    print("[Rectangle] Area: \(rectangle.area), Circumference: \(rectangle.circumference)")
    print("[Square] Area: \(square.area), Circumference: \(square.circumference)")
    print("[Circle] Area: \(circle.area), Circumference: \(circle.circumference)")
}

main()
