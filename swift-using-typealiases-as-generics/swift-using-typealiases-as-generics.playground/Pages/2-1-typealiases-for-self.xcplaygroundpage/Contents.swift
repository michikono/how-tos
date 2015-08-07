//: Typealiases for Self
//: ====================

//: [Previous](@previous)

protocol Material {}
class Wood: Material {}
class Glass: Material {}
class Metal: Material {}
class Cotton: Material {}

//: Alternate method for creating a factory

protocol Furniture {
    typealias M: Material
    typealias M2: Material
    
    func mainMaterial() -> M
    func secondaryMaterial() -> M2
    static func factory() -> Self
}

final class Chair: Furniture {
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

//: Notice here that "Chair" can not be the return type for factory(). Change Chair => Lamp to fix this error
final class Lamp: Furniture {
    func mainMaterial() -> Glass {
        return Glass()
    }
    func secondaryMaterial() -> Metal {
        return Metal()
    }
    // change Chair => Lamp to fix this error
    static func factory() -> Chair {
        return Chair()
    }
}

//: [Next](@next)
