//: Inferred Typealiases
//: ===================

//: [Previous](@previous)

protocol Furniture {
    typealias M
    func mainMaterial() -> M
    func secondaryMaterial() -> M
}

class Chair: Furniture {
    func mainMaterial() -> String {
        return "Wood"
    }
    func secondaryMaterial() -> String {
        return "More wood"
    }
}

class Lamp: Furniture {
    func mainMaterial() -> Bool {
        return true
    }
    func secondaryMaterial() -> Bool {
        return true
    }
}

//: **This next code snippet will not compile**

// Error: Type 'Stool' does not conform to protocol 'Furniture'
class Stool: Furniture {
    func mainMaterial() -> String {
        return "Wood"
    }
    func secondaryMaterial() -> Bool {
        return false
    }
}

//: [Next](@next)
