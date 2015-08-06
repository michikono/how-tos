//: Inferred Typealiases
//: ===================

//: [Previous](@previous)

protocol Material {}
class Wood: Material {}
class Glass: Material {}
class Metal: Material {}
class Cotton: Material {}

protocol Furniture {
    typealias M: Material
    typealias M2: Material
    func mainMaterial() -> M
    func secondaryMaterial() -> M2
}

class Chair: Furniture {
    func mainMaterial() -> Wood {
        return Wood()
    }
    func secondaryMaterial() -> Cotton {
        return Cotton()
    }
}

class Lamp: Furniture {
    func mainMaterial() -> Glass {
        return Glass()
    }
    func secondaryMaterial() -> Metal {
        return Metal()
    }
}

//: [Next](@next)
