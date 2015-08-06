//: Typealiases for Self
//: ====================

//: [Previous](@previous)

protocol Material {}
class Wood: Material {}
class Glass: Material {}
class Metal: Material {}
class Cotton: Material {}

protocol HouseholdThing { }
protocol Furniture: HouseholdThing {
    typealias M: Material
    typealias M2: Material
    typealias T: HouseholdThing
    
    func mainMaterial() -> M
    func secondaryMaterial() -> M2
    static func factory() -> T
}

class Chair: Furniture {
    func mainMaterial() -> Wood {
        return Wood()
    }
    func secondaryMaterial() -> Cotton {
        return Cotton()
    }
    static func factory() -> Chair {
        return Chair()
    }
}

class Lamp: Furniture {
    func mainMaterial() -> Glass {
        return Glass()
    }
    func secondaryMaterial() -> Metal {
        return Metal()
    }
    static func factory() -> Chair {
        return Chair() // <== this is not what we intended!
    }
}

//: [Next](@next)
