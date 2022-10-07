import Foundation

class Product {
    let productID: Int
    let productName: String
    let productPrice: Double
    let productMadeInCountry: String

    init(productID: Int, productName: String, productPrice: Double, productMadeInCountry: String) {
        self.productID = productID
        self.productName = productName
        self.productPrice = productPrice
        self.productMadeInCountry = productMadeInCountry
    }
}

class Drink: Product {
    let isDrinkDiet: Bool
    let drinkSize: Int

    init(drinkID: Int, drinkName: String, drinkPrice: Double, drinkMadeInCountry: String, isDrinkDiet: Bool, drinkSize: Int) {
        self.isDrinkDiet = isDrinkDiet
        self.drinkSize = drinkSize
        super.init(productID: drinkID, productName: drinkName, productPrice: drinkPrice, productMadeInCountry: drinkMadeInCountry)
    }
}

class Food: Product {
    let foodCalorie: Int
    let foodSize: Int
    let foodIngredients: [String]

    init(foodID: Int, foodName: String, foodPrice: Double, foodMadeInCountry: String, foodCalorie: Int, foodSize: Int, foodIngredients: [String]) {
        self.foodCalorie = foodCalorie
        self.foodSize = foodSize
        self.foodIngredients = foodIngredients
        super.init(productID: foodID, productName: foodName, productPrice: foodPrice, productMadeInCountry: foodMadeInCountry)
    }
}

class Cloth: Product {
    let clothMaterials: [Material]

    init(clothID: Int, clothName: String, clothPrice: Double, clothMadeInCountry: String, clothMaterials: [Material]) {
        self.clothMaterials = clothMaterials
        super.init(productID: clothID, productName: clothName, productPrice: clothPrice, productMadeInCountry: clothMadeInCountry)
    }
}

class Material {
    let materialCode: Int
    let materialName: String

    init(materialCode: Int, materialName: String) {
        self.materialCode = materialCode
        self.materialName = materialName
    }
}

class ShoppingCart {
    var items: [Product] = []

    func add(_ item: Product) {
        items.append(item)
    }

    func totalAmount() -> Double {
        var total = 0.0
        for item in items {
            total += item.productPrice
        }
        return total
    }

    func printNames() {
        for item in items {
            print(item.productName)
        }
    }
}

func main() {
    let _ = Product(productID: 110, productName: "Diet Pepsi", productPrice: 2, productMadeInCountry: "USA")

    let shoppingCart = ShoppingCart()

    for _ in 0..<3 {
        let pepsi = Drink(drinkID: 412, drinkName: "Pepsi", drinkPrice: 2, drinkMadeInCountry: "USA", isDrinkDiet: false, drinkSize: 150)
        shoppingCart.add(pepsi)
    }

    let gingerZero = Drink(drinkID: 183, drinkName: "Ginger", drinkPrice: 3, drinkMadeInCountry: "Canada", isDrinkDiet: true, drinkSize: 200)
    shoppingCart.add(gingerZero)

    for _ in 0..<2 {
        let chicken = Food(foodID: 100, foodName: "Chicken", foodPrice: 8, foodMadeInCountry: "Canada", foodCalorie: 350, foodSize: 4, foodIngredients: ["chicken", "oil", "chees"])
        shoppingCart.add(chicken)
    }

    for _ in 0..<2 {
        let pasta = Food(foodID: 101, foodName: "Pasta", foodPrice: 18, foodMadeInCountry: "Canada", foodCalorie: 250, foodSize: 3, foodIngredients: ["pasta", "meat", "spinach"])
        shoppingCart.add(pasta)
    }

    let cotton = Material(materialCode: 10, materialName: "cotton")
    let nylon = Material(materialCode: 11, materialName: "Nylon")
    let tShirt = Cloth(clothID: 701, clothName: "T-shirt", clothPrice: 15, clothMadeInCountry: "China", clothMaterials: [cotton, nylon])
    shoppingCart.add(tShirt)

    shoppingCart.printNames()
    print("$\(shoppingCart.totalAmount())")
}

main()
