//: Implementing Patterns
//: =====================

//: [Previous](@previous)

protocol Material {}
class Wood: Material {}
class Glass: Material {}
class Metal: Material {}
class Cotton: Material {}

protocol HouseholdThing { }
protocol Furniture: HouseholdThing {
    typealias M: Material
    typealias T: HouseholdThing
    func mainMaterial() -> M
    static func factory() -> T
}

class Chair: Furniture {
    func mainMaterial() -> Wood {
        return Wood()
    }
    static func factory() -> Chair {
        return Chair()
    }
}

class Lamp: Furniture {
    func mainMaterial() -> Glass {
        return Glass()
    }
    static func factory() -> Lamp {
        return Lamp()
    }
}

//: This won't work

class FurnitureMaker<C: Furniture> {
    func make() -> C {
        return C()
    }
    
    func material(furniture: C) -> C.M {
        return furniture.mainMaterial()
    }
}

//: [Next](@next)
